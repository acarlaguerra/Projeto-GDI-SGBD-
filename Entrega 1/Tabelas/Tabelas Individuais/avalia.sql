-- trocou identificacao do produto para nome_produto
CREATE TABLE Avalia( -- relacionamento N:M
    cliente_cpf VARCHAR2(11) NOT NULL,
    nome_produto VARCHAR2(255) NOT NULL, 
    loja_cnpj VARCHAR2(14) NOT NULL, 
    nota NUMBER CHECK (nota >= 1 AND nota <= 5),
    
    CONSTRAINT avalia_pk PRIMARY KEY (cliente_cpf, nome_produto, loja_cnpj), 
    CONSTRAINT avalia_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT avalia_fk2 FOREIGN KEY (nome_produto, loja_cnpj) REFERENCES Produto(nome, cnpj_loja)
);