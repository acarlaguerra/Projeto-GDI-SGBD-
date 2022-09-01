CREATE TABLE Telefone_usuario ( -- tabela para telefones do usuário (atributo multivalorado)
    cpf VARCHAR2(11) NOT NULL,
    fone VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT Telefone_usuario_pk PRIMARY KEY (cpf, fone),
    CONSTRAINT Telefone_usuario_fk FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);
