CREATE TABLE Transportadora ( -- Herda de empresa
    cnpj_transportadora VARCHAR2(14) NOT NULL,
    frete NUMBER NOT NULL,
    CONSTRAINT transportadora_pk PRIMARY KEY (cnpj_transportadora),
    CONSTRAINT transportadora_fk1 FOREIGN KEY (cnpj_transportadora) REFERENCES Empresa(cnpj)
);
