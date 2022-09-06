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

/* 6. SELECT FROM WHERE 7. BETWEEN 
Selecionar o produto e o cnpj da loja que possuem avaliações entre 1 e 3 */
SELECT nome_produto, cliente_cpf, nota
FROM Avalia
WHERE nota 
BETWEEN (1) AND (3);

/* 8. IN */
/* Selecionar lojas que vendem produto de nome 'CR7 Desodorante' ou 'Microondas Escalonado' */
SELECT cnpj_loja
FROM produto
WHERE nome IN('CR7 Desodorante', 'Microondas Escalonado');

/* 9. LIKE /
/ Seleciona os usuários cujo nome sigam o regex %an%, ignorando case */
SELECT nome
FROM usuario
WHERE LOWER(nome) LIKE '%an%'

/* 10. IS NULL OR IS NOT NULL */
/* Selecionar nome das Empresas que não possuem transportadora */
SELECT E.nome_fantasia
FROM Empresa E, Transportadora
WHERE cnpj_transportadora.T = cnpj.E AND cnpj_transportadora IS NULL;

/* 11. Consulta: INNER JOIN */
/* Consulta que retorna os usuários que são clientes e funcionários */
SELECT nome AS nome_cliente
FROM Usuario
    INNER JOIN Cliente C
        ON cpf = C.cpf_cliente;
    

/* 12. Consulta: MAX(preço) */
/* Consulta retorna o valor do produto mais caro olhando para todas as lojas e
o produto que é mais estocado */
SELECT MAX(preco), MAX(estoque)
FROM Produto 


/* 13.Consulta: MIN() */
/* Consulta que retorna o valor mínimo de produtos em um pedido */
SELECT MIN(quantidade)
FROM Pedido


/* 14. AVG() */
/* Função agregada que retorna a média */
SELECT AVG(frete) AS media_frete
FROM transportadora

/* 15. */
/* Função seleciona os nomes dos funcionários e do seu surpevisor, caso existam  */
SELECT U1.nome AS funcionario, U2.nome as supervisor
FROM Usuario U1
INNER JOIN Funcionario F
    ON U1.cpf = F.cpf_func
LEFT OUTER JOIN Usuario U2
    ON U2.cpf = F.cpf_supervisor;

/*
    >> COUNT()
    Consulta que retorna quantos produtos foram vendidos pela aquela loja 
*/
SELECT COUNT(loja)
FROM Info_pedido
    WHERE loja = '93139254465827';




/*
    >> ORDER BY
    Consulta que retorna o nome das transportadoras e o frete correpondente em ordem lexicográfica
*/
SELECT E.nome_fantasia, T.frete
FROM Empresa E, transportadora T
    WHERE E.cnpj = T.cnpj_transportadora
    ORDER BY E.nome_fantasia;
    
/*
    GROUP BY
    Mostra a quantidade de pedidos feitos, agrupados por tipo de assinatura
*/
SELECT C.tipo_de_assinatura, COUNT(IP.pedido) AS pedidos
FROM info_pedido IP
INNER JOIN cliente C
    ON IP.cliente = C.cpf_cliente
GROUP BY C.tipo_de_assinatura


/*
    >> HAVING
    
*/
SELECT 







