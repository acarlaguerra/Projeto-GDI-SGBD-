CREATE TABLE Transportadora ( -- Herda de empresa
    cnpj VARCHAR2(14) NOT NULL,
    frete NUMBER NOT NULL,
    CONSTRAINT cnpj_pk PRIMARY KEY (cnpj),
    CONSTRAINT cnpj_fk1 FOREIGN KEY (cnpj) REFERENCES Empresa(cnpj)
);
