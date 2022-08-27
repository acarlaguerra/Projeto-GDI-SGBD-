CREATE TABLE Usuario (
    cpf VARCHAR2(11) NOT NULL, 
    nome VARCHAR2(255) NOT NULL,
    cep_edereco VARCHAR2(255) NOT NULL,
    numero_endereco NUMBER NOT NULL,
    
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep_edereco, numero_endereco) REFERENCES Endereco(cep, numero)
);
