CREATE TABLE Produto(
    identificacao INTEGER NOT NULL,
    cnpj_loja VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    estoque NUMBER NOT NULL,
    preco NUMBER NOT NULL,
    media NUMBER NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (identificacao, cnpj_loja), 
    CONSTRAINT produto_fk FOREIGN KEY (cnpj_loja) REFERENCES Loja(cnpj_loja)
);
