CREATE TABLE Empresa (
    cnpj VARCHAR2(14) NOT NULL,
    nome_fantasia VARCHAR2(255) NOT NULL,
    CONSTRAINT empresa_pk PRIMARY KEY (cnpj)
);
