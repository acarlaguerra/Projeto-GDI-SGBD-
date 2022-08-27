CREATE TABLE Funcionario(
    cpf_func VARCHAR2(11) NOT NULL,
    data_de_admissao DATE NOT NULL,
    
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fk FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);
