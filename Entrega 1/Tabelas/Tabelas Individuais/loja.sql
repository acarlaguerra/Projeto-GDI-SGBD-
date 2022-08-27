CREATE TABLE Loja(
    CONSTRAINT loja_pk PRIMARY KEY (cnpj_loja)
    CONSTRAINT loja_fk FOREIGN KEY (cnpj_loja) REFERENCES Empresa (cnpj)
);
