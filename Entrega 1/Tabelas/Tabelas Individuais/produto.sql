CREATE TABLE Produto(
    nome VARCHAR2(255) NOT NULL,
    estoque NUMBER NOT NULL,
    preço NUMBER NOT NULL,
    média NUMBER NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (identificação, cnpj_loja), 
    CONSTRAINT produto_fk FOREIGN KEY (cnpj_loja) REFERENCES Loja(cnpj_loja)
);
