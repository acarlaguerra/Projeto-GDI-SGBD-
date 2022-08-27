CREATE TABLE Transportadora ( -- Herda de empresa
    cnpj_transportadora VARCHAR2(14) NOT NULL,
    frete NUMBER NOT NULL,
    CONSTRAINT cnpj_pk PRIMARY KEY (cnpj_transportadora),
    CONSTRAINT cnpj_fk1 FOREIGN KEY (cnpj_transportadora) REFERENCES Empresa(cnpj)
);
