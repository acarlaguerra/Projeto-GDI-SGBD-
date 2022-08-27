CREATE TABLE Telefone_empresa(
    empresa NUMBER(14) NOT NULL,
    fone NUMBER(9) NOT NULL,
    CONSTRAINT telefone_empresa_pk PRIMARY KEY (empresa, fone),
    CONSTRAINT telefone_empresa_fk FOREIGN KEY (empresa) REFERENCES Empresa(cnpj)
);
