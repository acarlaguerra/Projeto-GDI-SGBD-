CREATE TABLE Cliente( -- herda de Usuario
    cpf_cliente NUMBER(11),
    tipo_de_assinatura VARCHAR2(255),
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES Usuario(cpf)
);