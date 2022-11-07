-- Endereço 

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(8), 
    numero NUMBER, 
    rua VARCHAR2(255)
);
/
-- Telefone

CREATE OR REPLACE TYPE tp_fone AS OBJECT(
    fone VARCHAR2 (14)
);
/ 

-- VARRAY de Telefones

CREATE OR REPLACE TYPE varr_tp_fone AS VARRAY (6) OF tp_fone;
/

-- Usuário --------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_usuario AS OBJECT (
    cpf VARCHAR2(11),
    nome VARCHAR2(255),
    telefone varr_tp_fone,
    endereco tp_endereco,
    MEMBER PROCEDURE mostrar_info
) NOT FINAL NOT INSTANTIABLE;
/
-------------------------------------------------------------------------------

-- Cliente (Herda de Usuário) -------------------------------------------------

CREATE OR REPLACE TYPE tp_cliente UNDER tp_usuario (   
    tipo_de_assinatura VARCHAR2 (255),
    OVERRIDING MEMBER PROCEDURE mostrar_info,
    CONSTRUCTOR FUNCTION tp_cliente(x1 tp_cliente) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    OVERRIDING MEMBER PROCEDURE mostrar_info IS 
        BEGIN
            DBMS_OUTPUT.PUT_LINE(nome);
            DBMS_OUTPUT.PUT_LINE(cpf);
            DBMS_OUTPUT.PUT_LINE(tipo_de_assinatura);
        END;
    CONSTRUCTOR FUNCTION tp_cliente (x1 tp_cliente) RETURN SELF AS RESULT IS
        BEGIN
            cpf := x1.cpf;
            nome := x1.nome;
            telefone := x1.telefone;
            endereco := x1.endereco;
            tipo_de_assinatura := x1.tipo_de_assinatura;
            RETURN;
        END;
END;
/
--------------------------------------------------------------------------------

-- Funcionário -----------------------------------------------------------------

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_usuario (
    salario NUMBER, 
    data_de_admissao DATE,
    cargo VARCHAR2(255),
    MEMBER PROCEDURE aumenta_salario(SELF IN OUT NOCOPY tp_funcionario, input NUMBER),
    MEMBER FUNCTION salario_anual RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    MEMBER PROCEDURE aumenta_salario (SELF IN OUT NOCOPY tp_funcionario, input NUMBER) IS
        BEGIN
            self.salario := salario + (salario*input);
            DBMS_OUTPUT.PUT_LINE(self.salario);
        END;
    MEMBER FUNCTION salario_anual RETURN NUMBER IS
        BEGIN
            RETURN salario * 12;
        END; 
END;
/
--------------------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_supervisor AS OBJECT (
    supervisor REF tp_funcionario,
    supervisionado REF tp_funcionario
);
/
-- Empresa ---------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_empresa AS OBJECT(
    cnpj VARCHAR2(14),
    nome_fantasia VARCHAR2(255),
    fone VARCHAR2(14)
)NOT FINAL NOT INSTANTIABLE;
/
--------------------------------------------------------------------------------
/
-- Categorias ------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_categorias AS OBJECT(
    categoria VARCHAR2(255)
);
/
-- VARRAY de Categorias --------------------------------------------------------
CREATE OR REPLACE TYPE varray_tp_categorias AS VARRAY (3) OF tp_categorias;
/
--------------------------------------------------------------------------------

-- Loja (Herda de empresa) -----------------------------------------------------

CREATE OR REPLACE TYPE tp_loja UNDER tp_empresa (
    categoria varray_tp_categorias
);
/
-- Transportadora (Herda de empresa) -------------------------------------------
CREATE OR REPLACE TYPE tp_transportadora UNDER tp_empresa(
    frete NUMBER
);
-- NESTED TABLE (NOTAS) --------------------------------------------------------
/
CREATE OR REPLACE TYPE tp_notas AS OBJECT (
    notas NUMBER
);
/
CREATE OR REPLACE TYPE tp_nt_notas AS TABLE OF tp_notas;
/
-- Produto -------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_produto AS OBJECT(
    cnpj_loja REF tp_loja,
    cod_identificacao VARCHAR(255),
    nomes VARCHAR2(255),
    estoque NUMBER,
    preco NUMBER,
    notas tp_nt_notas,
    ORDER MEMBER FUNCTION compara_preco (SELF IN OUT NOCOPY tp_produto, p tp_produto) RETURN NUMBER
);
---------------------------------------------------------------------------------
/
CREATE OR REPLACE TYPE BODY tp_produto AS 
    ORDER MEMBER FUNCTION compara_preco (SELF IN OUT NOCOPY tp_produto, p tp_produto) RETURN NUMBER IS
        BEGIN
            IF self.preco > p.preco THEN 
                RETURN 1;
            ELSIF self.preco < p.preco THEN
                RETURN -1;
            ELSE
                RETURN 0;
            END IF;
        END;
END;
/
-- NESTED TABLE nome_produtos ---------------------------------------------------------
CREATE OR REPLACE TYPE tp_nome_produtos AS OBJECT (
    nome_produto VARCHAR2(255)
);
/
CREATE OR REPLACE TYPE tp_nt_produtos AS TABLE OF tp_nome_produtos;
/
-- NESTED TABLE lojas ----------------------------------------------------------------
CREATE OR REPLACE TYPE tp_lojas AS OBJECT (
    info_loja VARCHAR2(255)
);
/
CREATE OR REPLACE TYPE tp_nt_lojas AS TABLE OF tp_lojas;
/
-- Pedido ----------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    ID_do_pedido INTEGER,
    quantidade NUMBER, 
    forma_de_pagamento VARCHAR2(255),
    data_da_compra DATE,
    pedido_transportadora REF tp_transportadora,
    lojas tp_nt_lojas,
    pedido_cliente REF tp_cliente,
    produtos tp_nt_produtos,
    FINAL MAP MEMBER FUNCTION qtd_pedido RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_pedido AS
    FINAL MAP MEMBER FUNCTION qtd_pedido RETURN NUMBER IS
        BEGIN
            RETURN quantidade;
        END;
END;
/

-- ADICIONA O ATRIBUTO EMAIL EM EMPRESA  SEUS DEPENDENTES --------------------
ALTER TYPE tp_empresa ADD ATTRIBUTE (email VARCHAR2(255)) CASCADE;
------------------------------------------------------------------------------
