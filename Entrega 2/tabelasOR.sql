/*
    ERROS:
        1 - tb_funcionario = tá dando erro de tipo (não achei o motivo)
        2 - 
*/

CREATE TABLE tb_funcionario OF tp_funcionario (
    cpf PRIMARY KEY,
    salario NOT NULL CHECK(salario >= 1212.00),
    data_de_admissao NOT NULL,
    cargo NOT NULL
);
/

CREATE TABLE tb_supervisor OF tp_supervisor (
    supervisor NULL,
    supervisionado NOT NULL
);
/

CREATE TABLE tb_cliente OF tp_cliente (
    cpf PRIMARY KEY,
    tipo_de_assinatura NOT NULL
);
/

CREATE TABLE tb_loja OF tp_loja (
    cnpj PRIMARY KEY,
    categoria NOT NULL
);
/

CREATE TABLE tb_transportadora OF tp_transportadora (
    cnpj PRIMARY KEY,
    frete NOT NULL
);
/

CREATE TABLE tb_produto OF tp_produto (
    cnpj_loja SCOPE IS tb_loja NOT NULL, -- deveria usar o SCOPE IS?
    cod_identificacao PRIMARY KEY,
    nomes NOT NULL,
    estoque NOT NULL,
    preco NOT NULL
) NESTED TABLE notas STORE AS notas_produto;
/

CREATE TABLE tb_pedido OF tp_pedido (
    ID_do_pedido PRIMARY KEY,
    quantidade NOT NULL,
    forma_de_pagamento NOT NULL,
    data_da_compra NOT NULL,
    pedido_transportadora WITH ROWID REFERENCES tb_transportadora NOT NULL, 
    pedido_cliente WITH ROWID REFERENCES tb_cliente NOT NULL

) NESTED TABLE lojas STORE AS lojas_comprados,
  NESTED TABLE produtos STORE AS produtos_comprados;