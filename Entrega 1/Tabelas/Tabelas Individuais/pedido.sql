CREATE TABLE Pedido (
    ID_do_pedido INTEGER NOT NULL,
    quantidade NUMBER NOT NULL,
    produto VARCHAR2(255) NOT NULL,
    cliente VARCHAR2(11) NOT NULL,
    loja VARCHAR2(14) NOT NULL,
    transportadora VARCHAR2(14) NOT NULL,
    forma_de_pagamento VARCHAR2(255) NOT NULL, 
    data_de_saida DATE NOT NULL, 
    data_de_entrega DATE NOT NULL, 
    data_da_compra DATE NOT NULL,
    
    CONSTRAINT pedido_pk PRIMARY KEY (ID_do_pedido), 
    CONSTRAINT pedido_fk1 FOREIGN KEY (produto) REFERENCES Produto(identificacao),
    CONSTRAINT pedido_fk2 FOREIGN KEY (cliente) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT pedido_fk3 FOREIGN KEY (loja) REFERENCES Produto(cnpj_loja),
    CONSTRAINT pedido_fk4 FOREIGN KEY (transportadora) REFERENCES Transportadora(cnpj_transportadora)
);
