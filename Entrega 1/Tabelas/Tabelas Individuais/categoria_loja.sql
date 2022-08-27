CREATE TABLE Categorias_loja( -- herda de loja
    categoria VARCHAR2(255) NOT NULL,
    loja VARCHAR2(14) NOT NULL,
    CONSTRAINT categorias_loja_pk PRIMARY KEY (loja, categoria),
    CONSTRAINT categorias_loja_fk FOREIGN KEY (loja) REFERENCES Loja(cnpj_loja)         
);
