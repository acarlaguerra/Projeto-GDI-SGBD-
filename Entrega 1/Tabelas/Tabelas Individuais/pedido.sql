CREATE TABLE Pedido (
    quantidade NUMBER NOT NULL,
    forma_de_pagamento VARCHAR2(255) NOT NULL, 
    data_de_saida VARCHAR2(255) NOT NULL, 
    data_de_entrega VARCHAR2(255) NOT NULL, 
    data_da_compra VARCHAR2(255) NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (ID_do_pedido), 
    CONSTRAINT pedido_fk1 FOREIGN KEY (produto) REFERENCES Produto(identificação),
    CONSTRAINT pedido_fk2 FOREIGN KEY (cliente) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT pedido_fk3 FOREIGN KEY (loja) REFERENCES Produto(cnpj_loja),
    CONSTRAINT pedido_fk3 FOREIGN KEY (transportadora) REFERENCES Transportadora (cnpj_transportadora)
);
