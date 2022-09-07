/* 1.USO DE RECORD & 3.BLOCO ANÔNIMO 
Descrição: cria um novo endereço e insere no Banco de Dados */
<<record_block>>
DECLARE 
    TYPE d_endereco IS RECORD (
        cep VARCHAR2(8),
        numero NUMBER,
        rua VARCHAR2(255));
        new_endereco d_endereco;
BEGIN 
    new_endereco.cep := '50000056';
    new_endereco.numero := '55';
    new_endereco.rua := 'Rua Tatooine';
    INSERT INTO Endereco VALUES new_endereco;
END record_block;

/* 
    2/6/12. USO DE ESTRUTURA DE DADOS DO TIPO TABLE + %TYPE + FOR in LOOP;
*/
DECLARE
    TYPE produtos_type IS TABLE OF Produto.nome%TYPE
    INDEX BY BINARY_INTEGER;
    nome_produto_table produtos_type;
    i BINARY_INTEGER;

BEGIN
    i := 0;
    FOR produtos IN (SELECT nome FROM Produto) LOOP
        nome_produto_table(i) := produtos.nome;
        DBMS_OUTPUT.PUT_LINE(nome_produto_table(i));
        i := i + 1;
    END LOOP;
END;

/* 4. PROCEDURE &  16. PARÂMETROS (IN, OUT OU IN OUT) */
Procedimento para cadastro de produto*/
CREATE OR REPLACE PROCEDURE cadastroProduto (aux IN Produto%ROWTYPE) IS
BEGIN
    INSERT INTO Produto(cnpj_loja, nome, estoque, preco)
            VALUES (aux.cnpj_loja, aux.nome, aux.estoque, aux.preco);
END;
