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
    SELECT * FROM TABLE(SELECT P.notas FROM tb_produto P
    WHERE P.nomes = 'Matemática discreta para leigos');

    -- Pedido
    -- NESTED TABLE
    SELECT * FROM TABLE(SELECT P.produtos FROM tb_pedido P
    WHERE P.pedido_cliente = (SELECT REF(C) FROM tb_cliente C
                                WHERE C.cpf = '21'));








---- Testando as funções ----------------------------------------------------------------------
-- <MEMBER PROCEDURE> --
-- DECLARE
--     cliente tp_cliente;
-- BEGIN
--     SELECT VALUE(C) INTO cliente FROM tb_cliente C WHERE C.cpf = '20';
--     cliente.mostrar_info();
-- END;

-- -- Supervisor
-- SELECT REF(S) FROM tb_supervisor S;
-- /