CREATE TABLE Cliente( -- herda de Usuario
    cpf_cliente NUMBER(11) NOT NULL,
    tipo_de_assinatura VARCHAR2(255) NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES Usuario(cpf)
);
