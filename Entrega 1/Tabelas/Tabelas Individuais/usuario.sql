CREATE TABLE Usuario (
    cpf VARCHAR2(11) NOT NULL, 
    nome VARCHAR2(255) NOT NULL,
    cep_endereco VARCHAR2(255) NOT NULL,
    
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep_endereco) REFERENCES Endereco(cep)
);
