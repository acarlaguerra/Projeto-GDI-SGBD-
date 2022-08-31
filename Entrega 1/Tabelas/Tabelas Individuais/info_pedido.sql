CREATE TABLE Info_pedido (
    cliente VARCHAR2(11) NOT NULL,
    loja VARCHAR2(14) NOT NULL,
    pedido INTEGER NOT NULL,
    nome_produto VARCHAR2(255) NOT NULL,
    CONSTRAINT info_pedido_pk PRIMARY KEY (cliente, loja, pedido, nome_produto),
    CONSTRAINT info_pedido_fk1 FOREIGN KEY (loja, nome_produto) REFERENCES Produto(cnpj_loja, nome),
    CONSTRAINT info_pedido_fk2 FOREIGN KEY (cliente) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT info_pedido_fk3 FOREIGN KEY (pedido) REFERENCES Pedido(ID_do_pedido)
);