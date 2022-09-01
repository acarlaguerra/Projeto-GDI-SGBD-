--Povoamento endereço

INSERT INTO Endereco(cep, numero, rua) VALUES ('50000000', 20, 'Rua da Alegria');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000001', 54, 'Rua da Pedra');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000002', 87, 'Rua da Alegria');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000003', 475, 'Rua da Moeda');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000004', 123, 'Rua Augustinho Carrara');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000005', 65, 'Rua do Bonfim');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000006', 11, 'Rua da Moeda');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000007', 410, 'Rua Bom Jesus');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000008', 96, 'Rua das Graças');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000009', 20, 'Rua do Curado');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000010', 19, 'Rua da Penha');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000011', 44, 'Rua Aqui Acabou');
INSERT INTO Endereco(cep, numero, rua) VALUES ('50000012', 32, 'Rua dos Desesperados');

INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('12345678910', 'Silvinho Barros', '50000000', 20);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('42172124417', 'Hanninha Nóbrega', '50000001', 54);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('52942165459', 'Nivanzinho Ferreira', '50000002', 87);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('27945458922', 'Marcelinho Barros', '50000003', 475);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('95942585418', 'Filipinho Calegário', '50000004', 123);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('45492491529', 'Ricardinho Prudêncio', '50000005', 65);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('57945725672', 'Biel Albuquerque', '50000006', 11);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('24924924928', 'Aninha Albuquerque', '50000006', 11);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('27433969307', 'Carlinhos Ferraz', '50000007', 410);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('43413647537', 'Carolzinha Berrafato', '50000008', 96);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('45026905315', 'Joãozinho Borsoi', '50000009', 20);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('16922419254', 'Bonninha Borsoi', '50000009', 20);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('68722270407', 'Bill Gates', '50000010', 19);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('60692905833', 'Luquinhas Silva', '50000011', 44);
INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) VALUES ('29526345298', 'Ricardinho Massa', '50000012', 32);

-- Povoamento: Cliente

INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('12345678910', 'premium');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('42172124417', 'gratuita');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('52942165459', 'gratuita');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('27945458922', 'premium');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('95942585418', 'premium');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('45492491529', 'gratuita');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('57945725672', 'gratuita');
INSERT INTO Cliente(cpf_cliente, tipo_de_assinatura) VALUES ('24924924928', 'premium');

-- Povoamento: Funcionário

INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('12345678910', to_date('02/02/2001', 'dd/mm/yy'), '29526345298', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('42172124417', to_date('03/03/2005', 'dd/mm/yy'), '29526345298', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cargo) VALUES ('52942165459', to_date('04/04/2010', 'dd/mm/yy'), 'gerente');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('27433969307', to_date('05/05/2020', 'dd/mm/yy'), '52942165459', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('43413647537', to_date('06/06/2008', 'dd/mm/yy'), '52942165459', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('45026905315', to_date('07/07/2015', 'dd/mm/yy'), '29526345298', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('16922419254', to_date('08/08/2013', 'dd/mm/yy'), '29526345298', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('68722270407', to_date('09/09/2021', 'dd/mm/yy'), '52942165459', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) VALUES ('60692905833', to_date('10/10/2018', 'dd/mm/yy'), '52942165459', 'empregado');
INSERT INTO Funcionario(cpf_func, data_de_admissao, cargo) VALUES ('29526345298', to_date('11/11/2002', 'dd/mm/yy'), 'gerente');

-- Povoamento: Cargo_salário

INSERT INTO Cargo_salario(cargo, salario) VALUES ('empregado', '1500');
INSERT INTO Cargo_salario(cargo, salario) VALUES ('gerente', '6500');

-- Povoamento: Empresa

INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('44035551046395', 'Livraria do Nivan');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('44397911912301', 'Valéria Modas');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('93139254465827', 'Siga Computadores');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('95495393205116', 'Gustavo Corridas');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('57503186114611', 'Adriano Motors');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('90799725835943', 'Jequiti');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('75167938739208', 'Hinode - Entregamos na sua casa');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('47087581321690', 'CIn Sports - Temos delivery');

-- apenas lojas
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('75167938739001', 'Camisas do Cintia');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('47087581321002', 'Adriano do Hardware');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('75167938739003', 'Bob Shop');

--apenas transportadoras
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('86281239844091', 'Caminho da UFPE Transporte e Ltda');
INSERT INTO Empresa(cnpj, nome_fantasia) VALUES ('76286940702533', 'Tempo de prova: Chega Rápido');

--Povoamento transportadora

INSERT INTO Transportadora(cnpj_transportadora, frete) values ('44035551046395', 65);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('44397911912301', 60);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('93139254465827', 70);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('95495393205116', 65);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('57503186114611', 55);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('90799725835943', 75);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('75167938739208', 60);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('47087581321690', 70);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('86281239844091', 80);
INSERT INTO Transportadora(cnpj_transportadora, frete) values ('76286940702533', 75);

--Povoamento loja
-- loja e transportadoras
INSERT INTO Loja(cnpj_loja) values ('44035551046395');
INSERT INTO Loja(cnpj_loja) values ('44397911912301');
INSERT INTO Loja(cnpj_loja) values ('93139254465827');
INSERT INTO Loja(cnpj_loja) values ('95495393205116');
INSERT INTO Loja(cnpj_loja) values ('57503186114611');
INSERT INTO Loja(cnpj_loja) values ('90799725835943');
INSERT INTO Loja(cnpj_loja) values ('75167938739208');
INSERT INTO Loja(cnpj_loja) values ('47087581321690');
--apenas lojas
INSERT INTO Loja(cnpj_loja) values ('75167938739001');
INSERT INTO Loja(cnpj_loja) values ('47087581321002');
INSERT INTO Loja(cnpj_loja) values ('75167938739003');
-- 

--Povoamento produto

INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('44035551046395', 'Matemática Discreta para Prodígios', 40, 150.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('44035551046395', 'Trivialidade Matemática', 100, 125.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('44397911912301', 'Blusa Relacional', 30, 70.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('44397911912301', 'Calça Jeans Conceitual', 25, 90.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('93139254465827', 'Os 3 Fundamentos de um Hacker de Sucesso', 10, 150.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('93139254465827', 'Hackeando um Sistema Passo a Passo', 5, 160.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('95495393205116', 'Par de Meias Shortest Path', 20, 30.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('95495393205116', 'Dijkstra Tênis', 15, 150.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('57503186114611', 'Óleo Lubrificante Superpipeline', 35, 100.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('57503186114611', 'Ar-condicionado Superescalar', 20, 500.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('90799725835943', 'CR7 Desodorante', 40, 45.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('90799725835943', 'Vasco Desodorante: antiqueda capilar', 30, 35.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739208', 'Hinode Lattitude', 35, 60.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739208', 'Traduções Gold', 20, 70.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321690', 'FutBô', 10, 450.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321690', 'IA Raquete', 5, 550.00);

INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739001', 'Camisa Ada Lovelace', 20, 25.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739001', 'Camisa Mulheres do CIn', 12, 20.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739001', 'Cropped Hopper', 30, 30.00);

INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739003', 'Ração Premium', 20, 100.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739003', 'Remédio de Verme', 60, 50.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('75167938739003', 'Coleira com regulagem', 12, 10.00);

INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321002', 'Chapa de MIPS', 5, 1550.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321002', 'Geladeira Superescalar', 5, 3550.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321002', 'Microondas Escalonado', 5, 4550.00);
INSERT INTO Produto(cnpj_loja, nome, estoque, preco) VALUES ('47087581321002', 'Televisão Super Pipeline', 5, 5550.00);

CREATE SEQUENCE ID_do_pedido INCREMENT by 1 START WITH 1;
-- JM (1-4)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 3, '44035551046395', 'cartão de débito', to_date('02/07/2022', 'dd/mm/yy'), to_date('08/07/2022', 'dd/mm/yy'), to_date('01/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 2, '93139254465827', 'cartão de crédito', to_date('02/07/2022', 'dd/mm/yy'), to_date('08/07/2022', 'dd/mm/yy'), to_date('01/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 3, '76286940702533', 'boleto', to_date('05/07/2022', 'dd/mm/yy'), to_date('10/07/2022', 'dd/mm/yy'), to_date('01/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 2, '86281239844091', 'pix', to_date('10/07/2022', 'dd/mm/yy'), to_date('22/07/2022', 'dd/mm/yy'), to_date('10/07/2022', 'dd/mm/yy'));
--Lucas (5-8)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '86281239844091', 'cartão de crédito', to_date('11/07/2022', 'dd/mm/yy'), to_date('13/07/2022', 'dd/mm/yy'), to_date('11/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 5, '44397911912301', 'cartão de crédito', to_date('25/07/2022', 'dd/mm/yy'), to_date('30/07/2022', 'dd/mm/yy'), to_date('22/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '44397911912301', 'boleto', to_date('05/07/2022', 'dd/mm/yy'), to_date('10/07/2022', 'dd/mm/yy'), to_date('11/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 7, '86281239844091', 'boleto', to_date('23/07/2022', 'dd/mm/yy'), to_date('01/08/2022', 'dd/mm/yy'), to_date('20/07/2022', 'dd/mm/yy'));
--ana (9-12)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 2, '76286940702533', 'cartão de débito', to_date('11/07/2022', 'dd/mm/yy'), to_date('13/07/2022', 'dd/mm/yy'), to_date('11/07/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 4, '86281239844091', 'cartão de crédito', to_date('02/07/2022', 'dd/mm/yy'), to_date('08/07/2022', 'dd/mm/yy'), to_date('30/06/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '44035551046395', 'pix', to_date('01/08/2022', 'dd/mm/yy'), to_date('03/08/2022', 'dd/mm/yy'), to_date('01/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 3, '76286940702533', 'pix', to_date('02/08/2022', 'dd/mm/yy'), to_date('10/08/2022', 'dd/mm/yy'), to_date('02/08/2022', 'dd/mm/yy'));
-- severino (13-16)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 5, '86281239844091', 'cartão de débito', to_date('20/08/2022', 'dd/mm/yy'), to_date('31/08/2022', 'dd/mm/yy'), to_date('19/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '93139254465827', 'boleto', to_date('12/08/2022', 'dd/mm/yy'), to_date('13/08/2022', 'dd/mm/yy'), to_date('11/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 2, '44397911912301', 'pix', to_date('22/08/2022', 'dd/mm/yy'), to_date('26/08/2022', 'dd/mm/yy'), to_date('22/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '95495393205116', 'boleto', to_date('24/08/2022', 'dd/mm/yy'), to_date('28/08/2022', 'dd/mm/yy'), to_date('22/08/2022', 'dd/mm/yy'));
-- carol (17-20)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 2, '76286940702533', 'cartão de débito', to_date('22/08/2022', 'dd/mm/yy'), to_date('24/08/2022', 'dd/mm/yy'), to_date('22/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 5, '57503186114611', 'cartão de débito', to_date('22/08/2022', 'dd/mm/yy'), to_date('31/08/2022', 'dd/mm/yy'), to_date('22/08/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 1, '44397911912301', 'pix', to_date('01/09/2022', 'dd/mm/yy'), to_date('20/09/2022', 'dd/mm/yy'), to_date('01/09/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 5, '44397911912301', 'boleto', to_date('05/09/2022', 'dd/mm/yy'), to_date('20/09/2022', 'dd/mm/yy'), to_date('02/09/2022', 'dd/mm/yy'));
--(21-24)
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 9, '75167938739208', 'cartão de débito', to_date('03/09/2022', 'dd/mm/yy'), to_date('10/09/2022', 'dd/mm/yy'), to_date('03/09/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 7, '44035551046395', 'boleto', to_date('06/09/2022', 'dd/mm/yy'), to_date('20/09/2022', 'dd/mm/yy'), to_date('03/09/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 6, '47087581321690', 'pix', to_date('10/10/2022', 'dd/mm/yy'), to_date('20/10/2022', 'dd/mm/yy'), to_date('09/10/2022', 'dd/mm/yy'));
INSERT INTO Pedido(ID_do_pedido, quantidade, transportadora, forma_de_pagamento, data_de_saida, data_de_entrega, data_da_compra) VALUES (ID_do_pedido.NEXTVAL, 5, '76286940702533', 'boleto', to_date('11/10/2022', 'dd/mm/yy'), to_date('19/10/2022', 'dd/mm/yy'), to_date('10/10/2022', 'dd/mm/yy'));

--Povoamento Info_pedido

-- JM
-- ID 1 (3 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '44035551046395', 1 , 'Matemática Discreta para Prodígios');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '44035551046395', 1 , 'Trivialidade Matemática');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '47087581321002', 1 , 'Televisão Super Pipeline');
-- ID 2 (2 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417','93139254465827', 2,'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417','93139254465827', 2,'Os 3 Fundamentos de um Hacker de Sucesso');
-- ID 3 (3 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459','75167938739003', 3,'Ração Premium');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459','75167938739003', 3,'Remédio de Verme');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459','75167938739003', 3,'Coleira com regulagem');
-- ID 4 (2 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922','75167938739001', 4,'Camisa Ada Lovelace');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922','75167938739001', 4,'Camisa Mulheres do CIn');


-- Lucas
-- ID 5 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('95942585418', '75167938739003', 5 , 'Ração Premium');
-- ID 6 (5 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '93139254465827', 6 , 'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '44035551046395', 6 , 'Trivialidade Matemática');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '44397911912301', 6 , 'Calça Jeans Conceitual');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '95495393205116', 6 , 'Dijkstra Tênis');
-- corrigido
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '90799725835943', 6 , 'CR7 Desodorante');
--
--ID 7 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '95495393205116', 7 , 'Par de Meias Shortest Path');
--ID 8 (7 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '95495393205116', 8 , 'Dijkstra Tênis');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '75167938739003', 8 , 'Coleira com regulagem');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '47087581321690', 8 , 'IA Raquete');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '90799725835943', 8 , 'CR7 Desodorante');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '93139254465827', 8 , 'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '47087581321002', 8 , 'Chapa de MIPS');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '44397911912301', 8 , 'Calça Jeans Conceitual');


-- ana
-- ID 9 (2 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '75167938739001', 9 , 'Camisa Ada Lovelace');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '75167938739001', 9 , 'Camisa Mulheres do CIn');
-- ID 10 (4 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '47087581321002', 10 , 'Chapa de MIPS');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '47087581321002', 10 , 'Microondas Escalonado');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '75167938739208', 10 , 'Hinode Lattitude');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '75167938739208', 10 , 'Traduções Gold');
-- ID 11 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '44035551046395', 11 , 'Matemática Discreta para Prodígios');
-- ID 12 (3 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '75167938739001', 12 , 'Cropped Hopper');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '90799725835943', 12 , 'Vasco Desodorante: antiqueda capilar');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '47087581321002', 12 , 'Televisão Super Pipeline');


-- severino (13-16)
-- ID 13 (5 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '93139254465827', 13 , 'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '44035551046395', 13 , 'Trivialidade Matemática');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '44035551046395', 13 , 'Matemática Discreta para Prodígios');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '93139254465827', 13 , 'Os 3 Fundamentos de um Hacker de Sucesso');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '90799725835943', 13 , 'CR7 Desodorante');
-- ID 14 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('57945725672', '93139254465827', 14 , 'Hackeando um Sistema Passo a Passo');
-- ID 15 (2 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('95942585418', '44397911912301', 15 , 'Blusa Relacional');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('95942585418', '47087581321002', 15 , 'Geladeira Superescalar');
-- ID 16 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '95495393205116', 16 , 'Dijkstra Tênis');


-- carol (17-20)
-- ID 17 (2 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '47087581321002', 17 , 'Chapa de MIPS');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('12345678910', '75167938739001', 17 , 'Cropped Hopper');
-- ID 18 (5 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '75167938739001', 18 , 'Camisa Mulheres do CIn');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '75167938739001', 18 , 'Camisa Ada Lovelace');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '57503186114611', 18 , 'Ar-condicionado Superescalar');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '57503186114611', 18 , 'Óleo Lubrificante Superpipeline');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '90799725835943', 18 , 'CR7 Desodorante');
-- ID 19 (1 produto)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928', '44397911912301', 19 , 'Calça Jeans Conceitual');
-- ID 20 (5 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459', '44397911912301', 20 , 'Blusa Relacional');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459', '93139254465827', 20 , 'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459', '47087581321690', 20 , 'IA Raquete');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459', '95495393205116', 20 , 'Par de Meias Shortest Path');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('52942165459', '44035551046395', 20 , 'Trivialidade Matemática');


-- Bonna
-- ID 21 (9 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','47087581321002', 21,'Chapa de MIPS');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','47087581321002', 21,'Geladeira Superescalar'); 
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','47087581321002', 21,'Microondas Escalonado');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','47087581321002', 21,'Televisão Super Pipeline'); 
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','75167938739003', 21,'Ração Premium');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','75167938739003', 21,'Remédio de Verme');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','75167938739003', 21,'Coleira com regulagem');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','75167938739001', 21,'Camisa Ada Lovelace');  
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('24924924928','75167938739001', 21,'Cropped Hopper');  

-- ID 22 (7 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '44035551046395', 22 , 'Trivialidade Matemática');
-- corrigida
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '47087581321690', 22 , 'IA Raquete');
--
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '75167938739208', 22 , 'Traduções Gold');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '47087581321690', 22 , 'FutBô');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '75167938739208', 22 , 'Hinode Lattitude');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '95495393205116', 22 , 'Dijkstra Tênis');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('45492491529', '47087581321002', 22 , 'Microondas Escalonado');

--ID 23(6 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '44397911912301', 23 , 'Blusa Relacional');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '44397911912301', 23 , 'Calça Jeans Conceitual');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '93139254465827', 23 , 'Os 3 Fundamentos de um Hacker de Sucesso');
-- corrigido
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '57503186114611', 23 , 'Óleo Lubrificante Superpipeline');
--
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '93139254465827', 23 , 'Hackeando um Sistema Passo a Passo');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('27945458922', '47087581321002', 23 , 'Geladeira Superescalar');

-- ID 24 (5 produtos)
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417', '90799725835943', 24 , 'CR7 Desodorante');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417', '90799725835943', 24 , 'Vasco Desodorante: antiqueda capilar');
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417', '95495393205116', 24 , 'Dijkstra Tênis');
-- corrigida
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417', '47087581321002', 24 , 'Chapa de MIPS');
--
INSERT INTO Info_pedido(cliente, loja, pedido, nome_produto) VALUES ('42172124417', '44035551046395', 24 , 'Trivialidade Matemática');

-- Povoamento avalia

INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('42172124417', 'Matemática Discreta para Prodígios', '44035551046395', 3);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('45492491529', 'Matemática Discreta para Prodígios', '44035551046395', 2);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('42172124417', 'Trivialidade Matemática', '44035551046395', 4);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('42172124417', 'Os 3 Fundamentos de um Hacker de Sucesso', '93139254465827', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('27945458922', 'Trivialidade Matemática', '44035551046395', 3);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('52942165459', 'Vasco Desodorante: antiqueda capilar', '90799725835943', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('24924924928', 'Vasco Desodorante: antiqueda capilar', '90799725835943', 1);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('24924924928', 'Blusa Relacional', '44397911912301', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('57945725672', 'Óleo Lubrificante Superpipeline', '57503186114611', 3);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('45492491529', 'Dijkstra Tênis', '95495393205116', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('95942585418', 'Os 3 Fundamentos de um Hacker de Sucesso', '93139254465827', 4);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('45492491529', 'Os 3 Fundamentos de um Hacker de Sucesso', '93139254465827', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('24924924928', 'Camisa Mulheres do CIn', '75167938739001', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('95942585418', 'Microondas Escalonado', '47087581321002', 4);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('57945725672', 'Remédio de Verme', '75167938739003', 4);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('57945725672', 'Ração Premium', '75167938739003', 5);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('27945458922', 'Microondas Escalonado', '47087581321002', 3);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('27945458922', 'Traduções Gold', '75167938739208', 4);
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('12345678910', 'IA Raquete', '47087581321690', 5);

-- Povoamento Reclama

INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('42172124417', 2, '68722270407', 'entrega', 'o entregador jogou a encomenda pelo portão'); 
INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('52942165459', 6, '29526345298', 'produto', 'a garrafa veio de outra cor e quebrada'); 
INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('12345678910', 4, '60692905833', 'funcionario', 'funcionario foi rude e não me ajudou'); 
INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('27945458922', 1, '68722270407', 'entrega', 'a entrega atrasou mais de 2 semanas'); 
INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('57945725672', 7, '16922419254', 'produto', 'produto menor do que eu esperava'); 
INSERT INTO Reclama(cliente_cpf, pedido_id, funcionario_cpf, classificacao, descricao) VALUES ('95942585418', 3, '29526345298', 'produto', 'livro chegou amassado');

-- povoamento Telefone_usuario

INSERT INTO Telefone_usuario(cpf, fone) VALUES ('12345678910', '998804842'); 
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('42172124417', '991861127');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('52942165459', '993968102');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('27945458922', '995840355');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('95942585418', '994059907');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('45492491529', '998170764');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('57945725672', '987769452');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('24924924928', '997637451');
-- adicionar novos cpf's que forem adicionados em usuários ok
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('27433969307', '981375453');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('43413647537', '998800617');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('45026905315', '998810617');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('16922419254', '998820617');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('68722270407', '998830617');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('60692905833', '998840617');
INSERT INTO Telefone_usuario(cpf, fone) VALUES ('29526345298', '998850617');

-- povoamento Telefone_empresa

INSERT INTO Telefone_empresa(empresa, fone) VALUES ('44035551046395', '81989794353');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('44397911912301', '82988469450');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('93139254465827', '27989408968');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('95495393205116', '31987549623');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('57503186114611', '14982843996');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('90799725835943', '18983950148');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('75167938739208', '47997038385');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('47087581321690', '48980454329');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('86281239844091', '81993475201');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('76286940702533', '81985099798');
-- apenas lojas

INSERT INTO Telefone_empresa(empresa, fone) VALUES ('75167938739001', '57998753421');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('47087581321002', '81983403212');
INSERT INTO Telefone_empresa(empresa, fone) VALUES ('75167938739003', '72996760932');

-- povoamento Categorias_loja

INSERT INTO Categorias_loja(categoria, loja) VALUES ('Vestuário', '44397911912301');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Esporte', '95495393205116');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Cosméticos', '90799725835943');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Cosméticos', '75167938739208');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Livros', '44035551046395');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Eletrônicos', '93139254465827');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Automotivo', '57503186114611');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Esporte', '47087581321690');

INSERT INTO Categorias_loja(categoria, loja) VALUES ('Vestuário', '75167938739001');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Eletrodomésticos', '47087581321002');
INSERT INTO Categorias_loja(categoria, loja) VALUES ('Pet Shop', '75167938739003');
