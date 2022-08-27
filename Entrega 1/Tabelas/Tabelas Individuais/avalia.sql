CREATE TABLE Avalia( -- relacionamento N:M
    cliente_cpf VARCHAR2(11) NOT NULL,
    produto_id VARCHAR2(255) NOT NULL, 
    loja_cnpj VARCHAR2(14) NOT NULL, 
    nota VARCHAR2(255) NOT NULL,
    
    CONSTRAINT avalia_pk PRIMARY KEY (cliente_cpf, produto_id, loja_cnpj), 
    CONSTRAINT avalia_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT avalia_fk2 FOREIGN KEY (produto_id) REFERENCES Produto(identificacao),
    CONSTRAINT avalia_fk3 FOREIGN KEY (loja_cnpj) REFERENCES Produto(cnpj_loja),
);
