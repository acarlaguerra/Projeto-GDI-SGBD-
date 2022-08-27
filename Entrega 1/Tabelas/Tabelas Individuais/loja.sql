CREATE TABLE Loja( -- Herda de empresa
    cnpj_loja VARCHAR2(14) NOT NULL,
    CONSTRAINT loja_pk PRIMARY KEY (cnpj_loja),
    CONSTRAINT loja_fk FOREIGN KEY (cnpj_loja) REFERENCES Empresa (cnpj)
);
