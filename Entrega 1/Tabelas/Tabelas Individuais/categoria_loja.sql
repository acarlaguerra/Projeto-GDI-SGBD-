CREATE TABLE Categorias_loja( -- herda de loja
    categoria VARCHAR2(10) NOT NULL,
    loja NUMBER (14) NOT NULL,
    CONSTRAINT categorias_loja_pk PRIMARY KEY (loja, categoria),
    CONSTRAINT categorias_loja_fk FOREIGN KEY (loja) REFERENCES Loja(cnpj_loja)         
);