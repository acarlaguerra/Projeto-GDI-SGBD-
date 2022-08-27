CREATE TABLE Avalia( -- relacionamento N:M
    cliente_cpf VARCHAR2(11) NOT NULL,
    produto_id INTEGER NOT NULL, 
    loja_cnpj VARCHAR2(14) NOT NULL, 
    nota NUMBER CHECK (nota >= 1 AND nota <= 5),
    
    CONSTRAINT avalia_pk PRIMARY KEY (cliente_cpf, produto_id, loja_cnpj), 
    CONSTRAINT avalia_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT avalia_fk2 FOREIGN KEY (produto_id) REFERENCES Produto(identificacao),
    CONSTRAINT avalia_fk3 FOREIGN KEY (loja_cnpj) REFERENCES Produto(cnpj_loja)
);
