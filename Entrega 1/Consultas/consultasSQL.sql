/* 1. ALTER TABLE */
/* Modificar o campo tipo_de_assinatura da tabela Cliente para usar VARCHAR(10) para diminuir memória usada */
ALTER TABLE Cliente
MODIFY (tipo_de_assinatura VARCHAR(10));


/* 2. CREATE INDEX */
/* Criar index de supervisores para acelerar buscas futuras */
CREATE INDEX index_funcionario_supervisor
ON funcionario (cpf_supervisor);


/* 3. INSERT INTO 
Inserir nova avaliação de cliente*/
INSERT INTO Avalia(cliente_cpf, nome_produto, loja_cnpj, nota) VALUES ('45492491529', 'Cropped Hopper', '75167938739001', 4);


/* 4. UPDATE 
A loja está em promo, desconto no ar condicionado! 
obs.: essa atualização funciona porque temos apenas um produto com esse nome */
UPDATE Produto
SET preco = 400.00
WHERE nome = 'Ar-condicionado Superescalar';


/* 5. DELETE 
Deletando a reclamação sobre um livro que veio amassado */
DELETE FROM reclama
WHERE pedido_id = 3;


/* 6. e 7. SELECT FROM WHERE e BETWEEN 
Selecionar respectivamente o produto, o cnpj da loja e as notas
que possuem avaliações entre 1 e 3 */
SELECT nome_produto, cliente_cpf, nota
FROM Avalia
WHERE nota 
BETWEEN (1) AND (3);


/* 8. IN  
Selecionar lojas que vendem produto de nome
'CR7 Desodorante' ou 'Microondas Escalonado' */
SELECT cnpj_loja
FROM produto
WHERE nome IN('CR7 Desodorante', 'Microondas Escalonado');


/* 9. LIKE 
Seleciona os usuários cujo nome sigam o regex %an%, ignorando case */
SELECT nome
FROM usuario
WHERE LOWER(nome) LIKE '%an%';


/* 10. IS NULL OR IS NOT NULL */
/* Selecionar nome dos funcionários que não possuem supervisor
(isso significa que eles que são supervisores) */
SELECT U.nome
FROM Usuario U, Funcionario F
WHERE U.cpf = F.cpf_func AND F.cpf_supervisor IS NULL;


/* 11. Consulta: INNER JOIN */
/* Consulta que retorna os usuários que são clientes */
SELECT nome AS nome_cliente
FROM Usuario
    INNER JOIN Cliente C
        ON cpf = C.cpf_cliente;
    

/* 12. Consulta: MAX(preço) */
/* Consulta retorna o valor do produto mais caro olhando para todas as lojas e
o produto que é mais estocado */
SELECT MAX(preco), MAX(estoque)
FROM Produto;


/* 13.Consulta: MIN() */
/* Consulta que retorna o valor mínimo de produtos em um pedido */
SELECT MIN(quantidade)
FROM Pedido;


/* 14. AVG() */
/* Função agregada que retorna a média */
SELECT AVG(frete) AS media_frete
FROM transportadora;


/* 15. COUNT()
Consulta que retorna quantos produtos foram vendidos por aquela loja 
*/
SELECT COUNT(loja)
FROM Info_pedido
    WHERE loja = '93139254465827';


/* 16. LEFT ou RIGHT ou FULL OUTER JOIN
Função seleciona os nomes dos funcionários e do seu surpevisor, caso existam  */
SELECT U1.nome AS funcionario, U2.nome as supervisor
FROM Usuario U1
INNER JOIN Funcionario F
    ON U1.cpf = F.cpf_func
LEFT OUTER JOIN Usuario U2
    ON U2.cpf = F.cpf_supervisor;


/* 17. SUBCONSULTA COM OPERADOR RELACIONAL
Consulta externa que seleciona os fretes que são mais caros 
que a média (consulta interna) de todos */
SELECT frete, cnpj_transportadora
FROM transportadora
WHERE frete > (SELECT AVG(frete)
                FROM transportadora)
ORDER BY frete;


/* 18. SUBCONSULTA COM IN
Consulta que retorna o nome das empresas que seus produtos receberam ao menos uma avaliação >= 4
lembrar de discutir se junta SUBCONSULTA COM OPERADOR RELACIONAL aqui
*/
SELECT DISTINCT E.nome_fantasia
FROM avalia A
INNER JOIN empresa E
    ON A.loja_cnpj = E.cnpj
WHERE A.loja_cnpj IN (SELECT loja_cnpj
                    FROM avalia
                    WHERE nota >= 4);


/* 19. SUBCONSULTA COM ANY
Selecionar o cpf e nome do funcionário que possui data de admissão mais recente
do que um funcionario que é supervisor */
SELECT F.cpf_func, U.nome
FROM Funcionario F
INNER JOIN Usuario U
    ON F.cpf_func = U.cpf
WHERE F.data_de_admissao > ANY(SELECT data_de_admissao
                                FROM Funcionario F
                                WHERE F.cpf_supervisor IS NULL);


/* 20. SUBCONSULTA COM ALL
Seleciona o nome e cpf de todos os funcionários que possuem data de admissao
mais antiga do que ambos os supervisores simultanemente*/
SELECT F.cpf_func, U.nome
FROM Funcionario F
INNER JOIN Usuario U
    ON F.cpf_func = U.cpf
WHERE F.data_de_admissao < ALL(SELECT data_de_admissao
                                FROM Funcionario F
                                WHERE F.cpf_supervisor IS NULL);

/* 21.  ORDER BY
Consulta que retorna o nome das transportadoras e o frete correpondente em ordem lexicográfica */
SELECT E.nome_fantasia, T.frete
FROM Empresa E, transportadora T
    WHERE E.cnpj = T.cnpj_transportadora
    ORDER BY E.nome_fantasia;
    

/* 22. GROUP BY
Mostra a quantidade de pedidos feitos, agrupados por tipo de assinatura */
SELECT C.tipo_de_assinatura, COUNT(IP.pedido) AS pedidos
FROM info_pedido IP
INNER JOIN cliente C
    ON IP.cliente = C.cpf_cliente
GROUP BY C.tipo_de_assinatura;


/* 23. HAVING (REVISAR)
Consulta que retorna apenas os pedidos que possuem mais de 2 produtos */
SELECT pedido, COUNT(pedido) AS qtd_produtos
FROM Info_pedido
    GROUP BY pedido
    HAVING COUNT(pedido) > 2
    ORDER BY pedido;


/* 24. MINUS
Consulta que retorna apenas o cpf exclusivamente dos clientes */
SELECT cpf_cliente 
FROM Cliente
    MINUS (SELECT cpf_func 
           FROM Funcionario);


/* 25. CREATE VIEW
Tabela virtual que contém APENAS as reclamações feita para o produto em si
Caso queira testar, rodar o SELECT logo abaixo :D */
CREATE VIEW reclamacao_produto AS
SELECT pedido_id, cliente_cpf, funcionario_cpf, descricao
FROM Reclama
WHERE classificacao = 'produto';

SELECT * FROM reclamacao_produto;

/* 26. GRANT/REVOKE
    GRANT: Garantido todos os previlégios (select, insert, delete, update e todos os privilégios) para todos
    REVOKE: Retirando os previlégios de DELETE, INSERT E UPDATE para todos */
GRANT ALL PRIVILEGES ON Usuario TO PUBLIC;
REVOKE DELETE, INSERT, UPDATE FROM PUBLIC;
