DROP TABLE Endereco;
DROP TABLE Usuario;
DROP TABLE Cliente;
DROP TABLE Funcionario;
DROP TABLE Cargo_salario;
DROP TABLE Empresa;
DROP TABLE Transportadora;
DROP TABLE Loja;
DROP TABLE Produto;
DROP TABLE Pedido;
DROP TABLE Avalia;
DROP TABLE Reclama;
DROP TABLE Telefone_Usuario;
DROP TABLE Telefone_empresa;
DROP TABLE Categorias_loja;





CREATE TABLE Endereco (
    cep VARCHAR2(8) NOT NULL,
    numero NUMBER NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    
    CONSTRAINT endereco_pk PRIMARY KEY (cep, numero)
);


CREATE TABLE Usuario (
    cpf VARCHAR2(11) NOT NULL, 
    nome VARCHAR2(255) NOT NULL,
    cep_endereco VARCHAR2(8) NOT NULL,
    numero_endereco NUMBER NOT NULL,
    
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep_endereco, numero_endereco) REFERENCES Endereco(cep, numero)
);


CREATE TABLE Cliente( -- herda de Usuario
    cpf_cliente VARCHAR2(11) NOT NULL,
    tipo_de_assinatura VARCHAR2(255) NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES Usuario(cpf)
);


CREATE TABLE Funcionario(
    cpf_func VARCHAR2(11) NOT NULL,
    data_de_admissao DATE NOT NULL,
    cpf_supervisor VARCHAR2(11),
    cargo VARCHAR2(255) NOT NULL,
    
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf_func),
    CONSTRAINT funcionario_fk FOREIGN KEY (cpf_func) REFERENCES Usuario(cpf),
    CONSTRAINT funcionario_fk1 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf_func)
);


CREATE TABLE Cargo_salario (
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER NOT NULL CHECK (salario >= 1212),
    CONSTRAINT cargo_pk PRIMARY KEY (cargo)
);


CREATE TABLE Empresa (
    cnpj VARCHAR2(14) NOT NULL,
    nome_fantasia VARCHAR2(255) NOT NULL,
    CONSTRAINT empresa_pk PRIMARY KEY (cnpj)
);


CREATE TABLE Transportadora ( -- Herda de empresa
    cnpj_transportadora VARCHAR2(14) NOT NULL,
    frete NUMBER NOT NULL,
    CONSTRAINT transportadora_pk PRIMARY KEY (cnpj_transportadora),
    CONSTRAINT transportadora_fk FOREIGN KEY (cnpj_transportadora) REFERENCES Empresa(cnpj)
);


CREATE TABLE Loja( -- Herda de empresa
    cnpj_loja VARCHAR2(14) NOT NULL,
    CONSTRAINT loja_pk PRIMARY KEY (cnpj_loja),
    CONSTRAINT loja_fk FOREIGN KEY (cnpj_loja) REFERENCES Empresa (cnpj)
);


CREATE TABLE Produto(
    identificacao INTEGER NOT NULL,
    cnpj_loja VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    estoque NUMBER NOT NULL,
    preco NUMBER NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (identificacao, cnpj_loja), 
    CONSTRAINT produto_fk FOREIGN KEY (cnpj_loja) REFERENCES Loja(cnpj_loja)
);


-- Revisar tabela pedido (produto e loja ñ tá batendo)

CREATE TABLE Pedido (
    ID_do_pedido INTEGER NOT NULL,
    quantidade NUMBER NOT NULL,
    produto INTEGER NOT NULL,
    cliente VARCHAR2(11) NOT NULL,
    loja VARCHAR2(14) NOT NULL,
    transportadora VARCHAR2(14) NOT NULL,
    forma_de_pagamento VARCHAR2(255) NOT NULL, 
    data_de_saida DATE NOT NULL, 
    data_de_entrega DATE NOT NULL, 
    data_da_compra DATE NOT NULL,
    
    CONSTRAINT pedido_pk PRIMARY KEY (ID_do_pedido), 
    CONSTRAINT pedido_fk1 FOREIGN KEY (produto, loja) REFERENCES Produto(identificacao, cnpj_loja),
    CONSTRAINT pedido_fk2 FOREIGN KEY (cliente) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT pedido_fk4 FOREIGN KEY (transportadora) REFERENCES Transportadora(cnpj_transportadora)
);


CREATE TABLE Avalia( -- relacionamento N:M
    cliente_cpf VARCHAR2(11) NOT NULL,
    produto_id INTEGER NOT NULL, 
    loja_cnpj VARCHAR2(14) NOT NULL, 
    nota NUMBER CHECK (nota >= 1 AND nota <= 5),
    
    CONSTRAINT avalia_pk PRIMARY KEY (cliente_cpf, produto_id, loja_cnpj), 
    CONSTRAINT avalia_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT avalia_fk2 FOREIGN KEY (produto_id, loja_cnpj) REFERENCES Produto(identificacao, cnpj_loja)
);

CREATE TABLE Reclama( -- relacionamento triplo
    cliente_cpf VARCHAR2(11) NOT NULL,
    pedido_id INTEGER NOT NULL,
    funcionario_cpf VARCHAR2(11) NOT NULL,
    classificacao VARCHAR2(255) NOT NULL,
    descricao VARCHAR2(255) NOT NULL,
    
    CONSTRAINT reclama_pk PRIMARY KEY (cliente_cpf, pedido_id, funcionario_cpf), 
    CONSTRAINT reclama_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT reclama_fk2 FOREIGN KEY (pedido_id) REFERENCES Pedido(ID_do_pedido),
    CONSTRAINT reclama_fk3 FOREIGN KEY (funcionario_cpf) REFERENCES Funcionario(cpf_func)
);


CREATE TABLE Telefone_Usuario ( -- tabela para telefones do usuário (atributo multivalorado)
    cpf VARCHAR2(11) NOT NULL,
    fone VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT Telefone_Usuario_pk PRIMARY KEY (cpf, fone),
    CONSTRAINT Telefone_Usuario_fk FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);


CREATE TABLE Telefone_empresa( -- herda de empresa
    empresa VARCHAR2(14) NOT NULL,
    fone NUMBER(11) NOT NULL,
    CONSTRAINT telefone_empresa_pk PRIMARY KEY (empresa, fone),
    CONSTRAINT telefone_empresa_fk FOREIGN KEY (empresa) REFERENCES Empresa(cnpj)
);


CREATE TABLE Categorias_loja( -- herda de loja
    categoria VARCHAR2(255) NOT NULL,
    loja VARCHAR2(14) NOT NULL,
    CONSTRAINT categorias_loja_pk PRIMARY KEY (loja, categoria),
    CONSTRAINT categorias_loja_fk FOREIGN KEY (loja) REFERENCES Loja(cnpj_loja)         
);
