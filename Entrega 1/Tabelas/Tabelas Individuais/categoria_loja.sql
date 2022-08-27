CREATE TABLE Categorias_loja(
    categoria VARCHAR2(20),
    loja NUMBER (14),
    CONSTRAINT categorias_loja_pk PRIMARY KEY (loja, categoria),
    CONSTRAINT categorias_loja_fk1 FOREIGN KEY (loja) REFERENCES Loja(cnpj_loja)         
);