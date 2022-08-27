CREATE TABLE Funcionario(
    cpf_func VARCHAR2(11) NOT NULL,
    data_de_admissao DATE NOT NULL,
    cpf_supervisor VARCHAR2(11) NOT NULL,
    
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fk FOREIGN KEY (cpf) REFERENCES Usuario(cpf),
    CONSTRAINT funcionario_fk1 FOREIGN KEY (cpf_supervisor) REFERENCES Usuario(cpf)
);
