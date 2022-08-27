CREATE TABLE Reclama( -- relacionamento triplo
    cliente_cpf VARCHAR2(11) NOT NULL,
    pedido_id INTEGER NOT NULL,
    funcionario_cpf VARCHAR2(11) NOT NULL,
    classificacao VARCHAR2(255) NOT NULL,
    descricao VARCHAR2(255) NOT NULL,
    
    CONSTRAINT reclama_pk PRIMARY KEY (cliente_cpf, pedido_id, funcionario_cpf), 
    CONSTRAINT reclama_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT reclama_fk2 FOREIGN KEY (pedido_id) REFERENCES Pedido(ID_do_pedido),
    CONSTRAINT reclama_fk3 FOREIGN KEY (funcionario_cpf) REFERENCES Funcionario(cpf_func)
);
