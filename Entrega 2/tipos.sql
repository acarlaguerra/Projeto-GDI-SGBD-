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

-- Cliente --------------------------------------------------------------------

CREATE OR REPLACE TYPE tp_cliente UNDER tp_usuario (   
    tipo_de_assinatura VARCHAR2(255),
    OVERRIDING MEMBER PROCEDURE mostrar_info,
    CONSTRUCTOR FUNCTION tp_cliente (c tp_cliente) RETURN SELF AS RESULT,
    FINAL MAP MEMBER FUNCTION qtd_num_telefone return NUMBER
);

/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    CONSTRUCTOR FUNCTION tp_cliente (c tp_cliente) RETURN SELF AS RESULT
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
    FINAL MAP MEMBER FUNCTION qtd_num_telefone RETURN NUMBER IS
    BEGIN
        RETURN COUNT_ELEMENTS(self.telefone);
    END;
END;
   
--------------------------------------------------------------------------------

-- Funcionário -----------------------------------------------------------------

CREATE TYPE tp_funcionario UNDER tp_usuario (
    supervisor VARCHAR2(11), 
    salario NUMBER, 
    data_de_admissao DATE,
    cargo VARCHAR2(255),
    MEMBER PROCEDURE aumenta_salario(SELF IN OUT NOCOPY tp_funcionario, input NUMBER),
    MEMBER FUNCTION salario_anual,
    OVERRIDING MEMBER PROCEDURE mostrar_info
);

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



-- Empresa

CREATE OR REPLACE TYPE tp_empresa AS OBJECT(
    cnpj VARCHAR2(14),
    nome_fantasia VARCHAR2(255),
    fone tp_fone
)NOT FINAL NOT INSTANTIABLE;
/

-- Categorias

CREATE OR REPLACE TYPE tp_categorias AS OBJECT(
    categoria VARCHAR2(255)
);
/

-- VARRAY de Categorias
CREATE OR REPLACE TYPE varr_tp_categorias AS VARRAY (2) OF tp_categorias;
/

-- Loja

CREATE OR REPLACE TYPE tp_loja UNDER tp_empresa(
    categoria varr_tp_categorias
);
/

-- Transportadora 

CREATE OR REPLACE TYPE tp_transportadora UNDER tp_empresa(
    frete NUMBER
    ORDER MEMBER FUNCTION compara_frete (SELF IN OUT NOCOPY tp_transportadora, t tp_transportadora) RETURN NUMBER
);
/

CREATE OR REPLACE BODY tp_transportadora AS 
    ORDER MEMBER FUNCTION compara_frete (SELF IN OUT NOCOPY tp_transportadora, t tp_transportadora) RETURN NUMBER IS
    BEGIN
        IF self.frete > t.frete THEN 
            RETURN 1;
        ELSIF self.frete < t.frete THEN
            RETURN -1;
        ELSE
            RETURN 0;
        END IF;
    END;
END;

-- Pedido
CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    ID_do_pedido INTEGER,
    quantidade NUMBER,
    forma_de_pagamento VARCHAR2(255),
    data_da_compra DATE,
    
    -- Referenciando as entidades associadas a "pedido"
    pedido_transportadora REF tp_transportadora,
    pedido_funcionario REF tp_funcionario,
    pedido_cliente REF tp_cliente,
    pedido_produto REF tp_produto
);
/

-- ADICIONA O ATRIBUTO EMAIL EM EMPRESA  SEUS DEPENDENTES
ALTER TYPE tp_empresa ADD ATTRIBUTE (email VARCHAR2(255)) CASCADE;

-- Produto
CREATE OR REPLACE TYPE tp_produto AS OBJECT(
    cnpj_loja VARCHAR2(14),
    nome VARCHAR2(255),
    estoque NUMBER,
    preco NUMBER
);
/

