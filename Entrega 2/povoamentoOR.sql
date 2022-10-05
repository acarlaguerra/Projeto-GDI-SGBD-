-- Funcionários -----------------------------------------------------------------------

INSERT INTO tb_funcionario VALUES (
    tp_funcionario ('12462142598', --cpf (11 dígitos)
                    'Petrônio Silva', --nome
                    varr_tp_fone(tp_fone('98452194582581'), --varray de telefones (14 dígitos)
                                 tp_fone('95152156515646'),
                                 tp_fone('91234567891011')
                    ),
                    tp_endereco('52101422', --cep (8 dígitos)
                                2632, --número
                                'Rua Dois' --rua
                    ),
                    1500, --salário
                    to_date('21/07/2019', 'dd/mm/yy'), --data de admissão
                    'Gerente de RH' --cargo
    )
);
/
INSERT INTO tb_funcionario VALUES (
    tp_funcionario ('97645132896', --cpf (11 dígitos)
                    'Alfredo Gomes', --nome
                    varr_tp_fone(tp_fone('74185963969562'), --varray de telefones (14 dígitos)
                                 tp_fone('84169419198018')
                    ),
                    tp_endereco('94819498', --cep (8 dígitos)
                                818, --número
                                'Rua Alfredo não presta' --rua
                    ),
                    2000, --salário
                    to_date('18/04/2021', 'dd/mm/yy'), --data de admissão
                    'Secretário' --cargo  
    )
);
/
INSERT INTO tb_funcionario VALUES (
    tp_funcionario ('49114589178', --cpf (11 dígitos)
                    'Socorro', --nome
                    varr_tp_fone(tp_fone('91618561816165'), --varray de telefones (14 dígitos)
                                 tp_fone('99815616983165'),
                                 tp_fone('94945198219842'),
                                 tp_fone('36459532421685')
                    ),
                    tp_endereco('14598421', --cep (8 dígitos)
                                20, --número
                                'Rua dos zeros' --rua
                    ),
                    3400, --salário
                    to_date('01/01/2018', 'dd/mm/yy'), --data de admissão
                    'Atendente' --cargo  
    )
);
/
-- Supervisores -----------------------------------------------------------------------

INSERT INTO tb_supervisor VALUES (
    tp_supervisor(SELECT REF(F) FROM tb_funcionario F
                  WHERE F.cpf = '12462142598',
                  SELECT REF(F) FROM tb_funcionario F
                  WHERE F.cpf = '49114589178'
    )
);
INSERT INTO tb_supervisor VALUES (
    tp_supervisor(SELECT REF(F) FROM tb_funcionario F
                  WHERE F.cpf = '12462142598',
                  SELECT REF(F) FROM tb_funcionario F
                  WHERE F.cpf = '97645132896'
    )
);
/
-- TESTAR
INSERT INTO tb_supervisor VALUES (
    tp_supervisor(NULL,
                  SELECT REF(F) FROM tb_funcionario F
                  WHERE F.cpf = '12462142598'
    )
);
/
-- Clientes ---------------------------------------------------------------------------

INSERT INTO tb_cliente VALUES (
    tp_cliente('20',
               'Bill',
               varr_tp_fone(tp_fone('988888888'),
                            tp_fone('977777777'),
                            tp_fone('966666666'),
                            tp_fone('999999999'),
                            tp_fone('911111111'),
                            tp_fone('922222222')),
               tp_endereco('66666666',
                           12,
                           'Federal is a shit'),
               'premium'
    )
);
/
INSERT INTO tb_cliente VALUES (
    tp_cliente('21',
               'Thay',
               varr_tp_fone(tp_fone('988888811'),
                            tp_fone('977777711'),
                            tp_fone('966666611'),
                            tp_fone('999999911'),
                            tp_fone('911111122'),
                            tp_fone('922222211')),
               tp_endereco('77777777',
                           1,
                           'Travessa Na Paz do Seu Sorriso'),
               'gratuito'
    )
);
/
INSERT INTO tb_cliente VALUES (
    tp_cliente('22',
               'Carolzinha',
               varr_tp_fone(tp_fone('988888822'),
                            tp_fone('977777722'),
                            tp_fone('966666622'),
                            tp_fone('999999922'),
                            tp_fone('911111133'),
                            tp_fone('922222244')),
               tp_endereco('88888888',
                           134,
                           'Rua Verão do Cometa'),
               'premium'
    )
);
/
INSERT INTO tb_cliente VALUES (
    tp_cliente('23',
               'Lucas Lucco',
               varr_tp_fone(tp_fone('988888833'),
                            tp_fone('977777733'),
                            tp_fone('966666633'),
                            tp_fone('999999933'),
                            tp_fone('911111144'),
                            tp_fone('922222233')),
               tp_endereco('99999999',
                           122,
                           'Rua do Corno'),
               'premium'
    )
);
/
INSERT INTO tb_cliente VALUES (
    tp_cliente('24',
               'Ana Carlota',
               varr_tp_fone(tp_fone('988888844'),
                            tp_fone('977777744'),
                            tp_fone('966666644'),
                            tp_fone('999999944'),
                            tp_fone('911111155'),
                            tp_fone('922222244')),
               tp_endereco('11111111',
                           1,
                           'Rua do Corno Inconformado'),
               'premium'
    )
);
/
-- Lojas ------------------------------------------------------------------------------

INSERT INTO tb_loja VALUES (
    tp_loja('12345678967890',
            'Nivan Inutilidades',
            '976544567',
            varray_tp_categorias(tp_categorias('Roupa',
                                               'Livros',
                                               'Problemas'
                                )),
            'nivanzero@cin.ufpe.br'
    )
);
/
INSERT INTO tb_loja VALUES (
    tp_loja('09876543211234',
            'Adriano do Hardware',
            '909080706',
            varray_tp_categorias(tp_categorias('Eletrônicos',
                                               'Acessorios'
                                )),
            'adrianobytes@cin.ufpe.br'
    )
);
/
INSERT INTO tb_loja VALUES (
    tp_loja('11223344556677',
            'Alex Pessoa',
            '912212332',
            varray_tp_categorias(tp_categorias('Material de escritório',
                                               'Revistas',
                                               'Soluções para os seus problemas',
                                )),
            'alexdosanjos@cin.ufpe.br'
    )
);
/
-- Transportadoras --------------------------------------------------------------------

INSERT INTO tb_transportadora VALUES (
    tp_transportadora('87451378946514', --cnpj (14 dígitos)
                      'Reprovação entregas', --nome_fantasia
                      '94592189412987', --fone
                      20 --frete
    )
    'reprovacao@cin.ufpe.br'
);
/
INSERT INTO tb_transportadora VALUES (
    tp_transportadora('94586194527946', --cnpj (14 dígitos)
                      'Rapidão Almir', --nome_fantasia
                      '98416515684784', --fone
                      15 --frete
    )
    'almirquentinhas@cin.ufpe.br'
);
/
-- Produto ----------------------------------------------------------------------------

INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '000',
               'Design Thinking',
               100,
               70.00,
               tp_nt_notas(tp_notas(2,
                                    3,
                                    5,
                                    4,
                                    5,
                                    5,
                                    2
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '001',
               'Design for Kids',
               120,
               100.00,
               tp_nt_notas(tp_notas(4,
                                    1,
                                    1,
                                    5,
                                    0,
                                    5,
                                    5
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '002',
               'Aprovação',
               1,
               10000.00,
               tp_nt_notas(tp_notas(5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '003',
               'Abridor de lata',
               50,
               9.00,
               tp_nt_notas(tp_notas(3,
                                    5,
                                    5,
                                    4,
                                    2,
                                    5,
                                    1
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '004',
               'Mesinha',
               14,
               150.00,
               tp_nt_notas(tp_notas(0,
                                    2,
                                    0,
                                    3,
                                    2,
                                    3,
                                    1
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '11223344556677',
               '005',
               'Cadeira Ergonômica',
               50,
               1200.00,
               tp_nt_notas(tp_notas(5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5
               ))
    )    
);
/
-- Nivan inutilidades
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '12345678967890',
               '004',
               '30 minutos no tempo de prova',
               1,
               12000.00,
               tp_nt_notas(tp_notas(3,
                                    3,
                                    2,
                                    4,
                                    1,
                                    0,
                                    1
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '12345678967890',
               '005',
               'Casaco anti-trapaça na prova',
               250,
               40.00,
               tp_nt_notas(tp_notas(2,
                                    5,
                                    2,
                                    4,
                                    1,
                                    4,
                                    5
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '12345678967890',
               '006',
               'Matemática discreta para leigos',
               100,
               150.00,
               tp_nt_notas(tp_notas(5,
                                    0,
                                    1,
                                    0,
                                    1,
                                    2,
                                    3
               ))
    )    
);
/
-- adriano (acessórios / eletrônicos)
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '09876543211234',
               '111',
               'Processador MIPS',
               250,
               500.00,
               tp_nt_notas(tp_notas(5,
                                    5,
                                    2,
                                    4,
                                    1,
                                    4,
                                    5
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '09876543211234',
               '112',
               'Super memória DD8',
               1000,
               1000.00,
               tp_nt_notas(tp_notas(5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5,
                                    5
               ))
    )    
);
/
INSERT INTO tb_produto VALUES (
    tp_produto(SELECT REF(P) FROM tb_loja
               WHERE P.cnpj = '09876543211234',
               '851',
               'Mouse programado em Verilog',
               64,
               280.00,
               tp_nt_notas(tp_notas(5,
                                    5,
                                    4,
                                    5,
                                    1,
                                    4,
                                    2
               ))
    )    
);
/
-- Pedido -----------------------------------------------------------------------------

CREATE SEQUENCE id INCREMENT by 1 START WITH 1;
/
-- CNPJ das transportadoras: 87451378946514  94586194527946
-- CNPJ das lojas: 12345678967890 09876543211234 11223344556677
-- CPF dos clientes: 20 21 22 23 24
INSERT INTO tb_pedido VALUES (tp_pedido(id.NEXTVAL,
                              4,
                              'pix',
                              to_date('20/09/2022', 'dd/mm/yy'),
                              SELECT REF(T) FROM tb_transportadora T
                              WHERE T.cnpj = '94586194527946',
                              SELECT REF(L) FROM tb_loja L
                              WHERE T.cnpj = '09876543211234',
                              SELECT REF(C) FROM tb_cliente C
                              WHERE T.cpf = '21',
                              SELECT REF(P) FROM tb_produto P
                              WHERE T.cod_identificacao = '000'               
    )
);
/
INSERT INTO tb_pedido VALUES (tp_pedido(id.NEXTVAL,
                              4,
                              'cartão de crédito',
                              to_date('20/09/2022', 'dd/mm;yy'),
                              SELECT REF(T) FROM tb_transportadora T
                              WHERE T.cnpj = '94586194527946',
                              SELECT REF(L) FROM tb_loja L
                              WHERE T.cnpj = '12345678967890',
                              SELECT REF(C) FROM tb_cliente C
                              WHERE T.cpf = '20',
                              SELECT REF(P) FROM tb_produto P
                              WHERE T.cod_identificacao = '001'                 
    
);
/
INSERT INTO tb_pedido VALUES (tp_pedido(id.NEXTVAL,
                              4,
                              'boleto',
                              to_date('20/09/2022', 'dd/mm;yy'),
                              SELECT REF(T) FROM tb_transportadora T
                              WHERE T.cnpj = '87451378946514',
                              SELECT REF(L) FROM tb_loja L
                              WHERE T.cnpj = '11223344556677',
                              SELECT REF(C) FROM tb_cliente C
                              WHERE T.cpf = '24',
                              SELECT REF(P) FROM tb_produto P
                              WHERE T.cod_identificacao = '002',                 
    )
);
/
INSERT INTO tb_pedido VALUES (tp_pedido(id.NEXTVAL,
                              4,
                              'cartão de débito',
                              to_date('20/09/2022', 'dd/mm;yy'),
                              SELECT REF(T) FROM tb_transportadora T
                              WHERE T.cnpj = '87451378946514',
                              SELECT REF(L) FROM tb_loja L
                              WHERE T.cnpj = '12345678967890',
                              SELECT REF(C) FROM tb_cliente C
                              WHERE T.cpf = '22',
                              SELECT REF(P) FROM tb_produto P
                              WHERE T.cod_identificacao = '003',                 
    )
);