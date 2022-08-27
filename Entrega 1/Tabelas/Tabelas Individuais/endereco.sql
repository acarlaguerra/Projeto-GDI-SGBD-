CREATE TABLE Endereco (
    cep VARCHAR2(255) NOT NULL,
    numero NUMBER NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    
    CONSTRAINT endereco_pk PRIMARY KEY (cep, numero),
);
