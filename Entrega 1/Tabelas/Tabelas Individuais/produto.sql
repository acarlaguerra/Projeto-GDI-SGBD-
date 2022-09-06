-- Alteração na PK onde tinhamos identicacao como PK composta junto com cnpj, tiramos e colocamos nome do produto
CREATE TABLE Produto(
    cnpj_loja VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    estoque NUMBER NOT NULL,
    preco NUMBER NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (nome, cnpj_loja), 
    CONSTRAINT produto_fk FOREIGN KEY (cnpj_loja) REFERENCES Loja(cnpj_loja)
);