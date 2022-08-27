CREATE TABLE Telefone_empresa( -- herda de empresa
    empresa NUMBER(14) NOT NULL,
    fone NUMBER(11) NOT NULL,
    CONSTRAINT telefone_empresa_pk PRIMARY KEY (empresa, fone),
    CONSTRAINT telefone_empresa_fk FOREIGN KEY (empresa) REFERENCES Empresa(cnpj)
);
