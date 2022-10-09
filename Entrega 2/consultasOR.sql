-- Consultas básicas
-- Funcionário
SELECT cpf, salario, data_de_admissao, cargo
FROM tb_funcionario;
/

-- Supervisor
-- DEREF
SELECT DEREF(S.supervisor).nome AS supervisor, DEREF(S.supervisionado).nome AS supervisionado
FROM tb_supervisor S;
/

-- Cliente
-- VARRAY
SELECT C.cpf, C.nome, C.endereco.rua AS rua, C.tipo_de_assinatura AS assinatura, T.*
FROM tb_cliente C, TABLE(C.telefone) T;
/

-- Loja
-- VARRAY 
SELECT L.cnpj, L.nome_fantasia, L.fone, C.*
FROM tb_loja L, TABLE(L.categoria) C;
/

-- Transportadora
SELECT T.cnpj, T.nome_fantasia, T.fone, T.frete, T.email
FROM tb_transportadora T;
/

-- Produto
-- NESTED TABLE 
SELECT notas FROM TABLE(SELECT P.notas FROM tb_produto P
WHERE P.nomes = 'Matemática discreta para leigos');

-- Pedido
-- NESTED TABLE
SELECT * FROM TABLE(SELECT P.produtos FROM tb_pedido P
WHERE P.pedido_cliente = (SELECT REF(C) FROM tb_cliente C
                            WHERE C.cpf = '21'));

-- Testando os métodos (FUNCTION e PROCEDURE)
-- <OVERRIDING MEMBER PROCEDURE>
DECLARE
    cliente tp_cliente;
BEGIN
    SELECT VALUE(C) INTO cliente FROM tb_cliente C WHERE C.cpf = '20';
    cliente.mostrar_info();
END;
/

-- <MEMBER PROCEDURE E VALUE>
DECLARE
    funcionario tp_funcionario;
BEGIN
    SELECT VALUE(F) INTO funcionario FROM tb_funcionario F WHERE F.cpf = '49114589178';
    funcionario.aumenta_salario(0.5);
END;
/

--<MEMBER FUNCTION>
SELECT F.salario_anual() FROM tb_funcionario F WHERE F.cpf='97645132896';
/

-- <FINAL MAP MEMBER FUNCTION>
SELECT P.qtd_pedido() FROM tb_pedido P 
WHERE P.ID_do_pedido = 3;
/

--<ORDER MEMBER FUNCTION>
DECLARE
    result NUMBER;
    produto_1 tp_produto;
    produto_2 tp_produto;

BEGIN
    SELECT VALUE(P) INTO produto_1 FROM tb_produto P 
    WHERE P.cod_identificacao = '031';

    SELECT VALUE(P) INTO produto_2 FROM tb_produto P
    WHERE P.cod_identificacao = '111';

    result := produto_1.compara_preco(produto_2);
    
    IF result = 0 THEN
        DBMS_OUTPUT.PUT_LINE('O produto ' || TO_CHAR(produto_1.nomes) || ' e o produto ' || TO_CHAR(produto_2.nomes) 
                             || 'possuem o mesmo preço, ambos custam ' || TO_CHAR(produto_1.preco) || 'reais.');
    ELSIF result = 1 THEN
        DBMS_OUTPUT.PUT_LINE('O produto ' || TO_CHAR(produto_1.nomes) || ' é mais caro em comparação ao produto '|| TO_CHAR(produto_2.nomes)
                             || '. O primeiro custa ' || TO_CHAR(produto_1.preco) || ' reais, enquanto o segundo custa ' || TO_CHAR(produto_2.preco) || ' reais.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('O produto ' || TO_CHAR(produto_2.nomes) || ' é mais caro em comparação ao produto '|| TO_CHAR(produto_1.nomes)
                             || '. O primeiro custa ' || TO_CHAR(produto_2.preco) || ' reais, enquanto o segundo custa ' || TO_CHAR(produto_1.preco) || ' reais.');
    END IF;
END;
