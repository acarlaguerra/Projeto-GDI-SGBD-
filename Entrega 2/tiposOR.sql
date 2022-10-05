/*
    RODANDO SEM BUGS, PORÉEMMMM:
    1 -> CRIEI UMA NESTED TABLE PARA FONE DAS EMPRESAS E ADICIONEI O DDD PRA FICAR DIFERENTE DO tp_fone
      do user.
    2 -> Entidade fraca (PRODUTO): cloquei uma REF para a tp_produto, para saber de qual loja aquele produto é
      faz sentido???/ (eu não sei :D)
    3 -> tp_pedido: tava dando problema com o REF do tp_funcionario, não entendi muito bem o pq mas tá ai p
      resolver
    by: bill <3
*/

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
    MEMBER PROCEDURE mostrar_info,
    FINAL MAP MEMBER FUNCTION qtd_num_telefone RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY to_usuario AS
    FINAL MAP MEMBER FUNCTION qtd_num_telefone RETURN NUMBER IS
    BEGIN
        RETURN COUNT_ELEMENTS(self.telefone);
    END;
END;
/
-------------------------------------------------------------------------------

-- Cliente (Herda de Usuário) -------------------------------------------------

CREATE OR REPLACE TYPE tp_cliente UNDER tp_usuario (   
    tipo_de_assinatura VARCHAR2 (255),
    OVERRIDING MEMBER PROCEDURE mostrar_info,
    CONSTRUCTOR FUNCTION tp_cliente(c tp_cliente) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    CONSTRUCTOR FUNCTION tp_cliente(c tp_cliente) RETURN SELF AS RESULT
    BEGIN
        cpf := c.cpf;
        nome := c.nome;
        endereco := c.endereco;
        telefone := c.telefone;
        RETURN
    END;
    OVERRIDING MEMBER PROCEDURE mostrar_info IS 
    BEGIN
        dbms_output.put_line(self.nome);
        dbms_output.put_line(self.cpf);
        dbms_output.put_line(self.tipo_de_assinatura);
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
    MEMBER FUNCTION salario_anual RETURN NUMBER,
    OVERRIDING MEMBER PROCEDURE mostrar_info
);
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    MEMBER PROCEDURE aumenta_salario (SELF IN OUT NOCOPY tp_funcionario, input NUMBER) IS
    BEGIN
        self.salario := salario + (salario*input);
    END;
    MEMBER FUNCTION salario_anual RETURN NUMBER IS
    BEGIN
        RETURN salario * 12;
    END;
    OVERRIDING MEMBER PROCEDURE mostrar_info IS 
    BEGIN
        dbms_output.put_line(self.nome);
        dbms_output.put_line(self.cpf);
        dbms_output.put_line(self.tipo_de_assinatura);
    END;    
END;
/
--------------------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_supervisor AS OBJECT (
    supervisor REF tp_funcionario,
    supervisionado REF tp_funcionario
);
/
-- -- -- NESTED TABLE ----------------------------------------------------------------
-- CREATE OR REPLACE TYPE tp_fone_empresa AS OBJECT(
--     ddd VARCHAR2(255),
--     fone VARCHAR2 (255)
-- );
-- / 
-- CREATE OR REPLACE TYPE tp_nt_fone AS TABLE OF tp_fone_empresa;
-- /
-- Empresa ---------------------------------------------------------------------
-- deveriamos fazer a nested table aq?
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
-- NESTED TABLE de Categorias --------------------------------------------------------
CREATE OR REPLACE TYPE varray_tp_categorias AS VARRAY (6) OF tp_categorias;
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

-- Pedido ----------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    ID_do_pedido INTEGER,
    quantidade NUMBER,
    forma_de_pagamento VARCHAR2(255),
    data_da_compra DATE,
    pedido_transportadora REF tp_transportadora,
    pedido_loja REF tp_loja,
    pedido_cliente REF tp_cliente,
    pedido_produto REF tp_produto
);
------------------------------------------------------------------------------
/

-- ADICIONA O ATRIBUTO EMAIL EM EMPRESA  SEUS DEPENDENTES --------------------
ALTER TYPE tp_empresa ADD ATTRIBUTE (email VARCHAR2(255)) CASCADE;
------------------------------------------------------------------------------