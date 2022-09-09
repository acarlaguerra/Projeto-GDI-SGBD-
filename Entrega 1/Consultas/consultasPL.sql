/* 1/3. USO DE RECORD & BLOCO ANÔNIMO 
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
    2/6/12. USO DE ESTRUTURA DE DADOS DO TIPO TABLE + %TYPE + FOR in LOOP
    Faz a cópia do tipo da tabela de Produto.nome e printa todos os produtos
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



/* 4/7/16. PROCEDURE &  ROWTYPE & PARÂMETROS (IN, OUT OU IN OUT) 
Procedimento para cadastro de produto */
CREATE OR REPLACE PROCEDURE cadastroProduto (aux IN Produto%ROWTYPE) IS
BEGIN
    INSERT INTO Produto(cnpj_loja, nome, estoque, preco)
            VALUES (aux.cnpj_loja, aux.nome, aux.estoque, aux.preco);
END;


/*
    5/13/15.  CREATE FUNCTION + SELECT INTO + EXCEPTION WHEN
    Essa função visa pegar o salário de um funcionário dado o seu cpf.
    Caso o CPF não seja de um funcionário uma exception é lançada.
*/
CREATE OR REPLACE FUNCTION pegar_salario (cpfinho Usuario.cpf%TYPE)
    RETURN Cargo_Salario.salario%TYPE
    IS salariozinho Cargo_Salario.salario%TYPE;
    BEGIN
        SELECT C.salario
        INTO salariozinho
        FROM Cargo_Salario C
        WHERE C.cargo = (SELECT F.cargo FROM Funcionario F WHERE F.cpf_func = cpfinho);
        
        RETURN salariozinho;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20101, 'Não é um funcionário!');
END;


/* 10/14. LOOP EXIT WHEN & CURSOR(OPEN, FETCH E CLOSE)
Lista o nome E o cpf dos clientes que possuem conta premium*/
DECLARE
    v_nome Usuario.nome%TYPE;
    v_cpf Cliente.cpf_cliente%TYPE;
    v_conta Cliente.tipo_de_assinatura%TYPE := 'premium';

CURSOR cursor_conta IS
    SELECT U.nome, C.cpf_cliente
    FROM Usuario U, Cliente C
    WHERE U.cpf = C.cpf_cliente AND tipo_de_assinatura = v_conta;

BEGIN
    OPEN cursor_conta;
    LOOP
        FETCH cursor_conta INTO v_nome, v_cpf;
        EXIT WHEN cursor_conta%NOTFOUND;
        dbms_output.put_line('Cliente: '|| ' ' || TO_CHAR(v_nome) || ' ' || TO_CHAR(v_cpf));
    END LOOP;
    CLOSE cursor_conta;
    EXCEPTION
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.Put_line('Pare!');
END;

/* 19/9. CREATE OR REPLACE TRIGGER (COMANDO) & CASE WHEN
Trigger que dispara após inserção, atualização e deleção na tabela pedido e printa o tipo de operação realizada*/
CREATE OR REPLACE TRIGGER alteracao_pedido
BEFORE INSERT OR UPDATE OR DELETE
ON pedido
DECLARE 
    operation_type VARCHAR2(15);
BEGIN
    CASE
        WHEN INSERTING THEN
            operation_type := 'Inserting';
        WHEN UPDATING THEN
            operation_type := 'Updating';
        WHEN DELETING THEN
            operation_type := 'Deleting';
    END CASE;
    
    dbms_output.put_line(operation_type || ' realizado com sucesso');
  
END;

/* 20. CREATE OR REPLACE TRIGGER (LINHA)
Trigger que dispara após uma inserção ou atualização na tabela avalia e printa a avaliação da nota */
CREATE OR REPLACE TRIGGER cancelar_depois_do_envio
BEFORE DELETE  
ON pedido
FOR EACH ROW
DECLARE
    dia VARCHAR2(2) := EXTRACT(day from sysdate);
    mes VARCHAR2(2) := EXTRACT(month from sysdate);
    id_pedido pedido.ID_do_pedido%TYPE := :OLD.ID_do_pedido;
    data_invalida EXCEPTION;
BEGIN 
    IF dia >=  EXTRACT (day from :OLD.data_de_saida) AND mes >= EXTRACT (month from :OLD.data_de_saida)THEN
        RAISE data_invalida;
    ELSE    
        DELETE FROM info_pedido
        WHERE pedido = id_pedido;
        
        DELETE FROM Reclama
        WHERE pedido_id = id_pedido;
        
    END IF;
EXCEPTION 
WHEN data_invalida THEN
    Raise_application_error(-20404, 'Pedido a caminho! Tentativa de cancelamento recusada');
END;    

/* 11/8. WHILE LOOP & IF ELSE
Contabiliza quantos pedidos foram feitos no cartão de débito e no pix*/
DECLARE 
    cnt BINARY_INTEGER;
    q BINARY_INTEGER;
    i BINARY_INTEGER;
    aux_pagamento Pedido.forma_de_pagamento%TYPE;

BEGIN
    i := 1;
    cnt := 0;
    SELECT COUNT(*) INTO q FROM Pedido;
    WHILE i < q LOOP
        SELECT p.forma_de_pagamento INTO aux_pagamento
        FROM Pedido p
        WHERE p.ID_do_pedido = i;

        IF aux_pagamento IN ('cartão de débito') THEN 
            cnt := cnt + 1;
        ELSIF aux_pagamento IN ('pix') THEN 
            cnt := cnt + 1;
        ELSE
            cnt := cnt + 0;
        END IF;
        
        i := i +1;

    END LOOP;

    DBMS_OUTPUT.Put_line('No total foram feitas ' || cnt || ' compras no pix ou boleto ');
    
END;


/*
    18/17. Criação do PACKAGE + BODY
    O package funciona como um RH, ele é responsável por chamar os métodos que contrata um novo funcionário como também
    faz reajuste de salario nas funções (tanto em empregado como no gerente)
    Quando ocorre o cadastro de um novo funcionário, também ocorre a adição dos parâmatros nas tabelas que ele depende (Usuario, Endereço).

    Caso queira testar:
    RH.novo_funcionario('09876543211', to_date('02/02/2021', 'dd/mm/yy'), '52942165459', 'empregado', 'Careca louco', '50201006', 1, 'Jose estila');
    RH.reajuste_salarial('empregado', '100000');
    
    Logo após pode verificar as tabelas modificadas (SELECT'S)
*/
CREATE OR REPLACE PACKAGE RH AS
PROCEDURE novo_funcionario(n_cpf_func Funcionario.cpf_func%TYPE,
                           n_data_de_admissao Funcionario.data_de_admissao%TYPE,
                           n_cpf_supervisor Funcionario.cpf_supervisor%TYPE,
                           n_cargo Funcionario.cargo%TYPE,
                           n_nome Usuario.nome%TYPE,
                           n_cep_endereco Usuario.cep_endereco%TYPE,
                           n_numero Usuario.numero_endereco%TYPE,
                           n_rua Endereco.rua%TYPE);

PROCEDURE reajuste_salarial(new_cargo Cargo_salario.cargo%TYPE,
                            new_salario Cargo_salario.salario%TYPE);
END RH;
/
CREATE OR REPLACE PACKAGE BODY RH AS
PROCEDURE novo_funcionario(n_cpf_func Funcionario.cpf_func%TYPE,
                           n_data_de_admissao Funcionario.data_de_admissao%TYPE,
                           n_cpf_supervisor Funcionario.cpf_supervisor%TYPE,
                           n_cargo Funcionario.cargo%TYPE,
                           n_nome Usuario.nome%TYPE,
                           n_cep_endereco Usuario.cep_endereco%TYPE,
                           n_numero Usuario.numero_endereco%TYPE,
                           n_rua Endereco.rua%TYPE) IS
                           BEGIN
                                INSERT INTO Endereco(cep, numero, rua) 
                                VALUES (n_cep_endereco, n_numero, n_rua);
                                
                                INSERT INTO Usuario(cpf, nome, cep_endereco, numero_endereco) 
                                VALUES (n_cpf_func, n_nome, n_cep_endereco, n_numero);
                                
                                INSERT INTO Funcionario(cpf_func, data_de_admissao, cpf_supervisor, cargo) 
                                VALUES (n_cpf_func, n_data_de_admissao, n_cpf_supervisor, n_cargo);
                           END novo_funcionario;
PROCEDURE reajuste_salarial(new_cargo Cargo_salario.cargo%TYPE,
                            new_salario Cargo_salario.salario%TYPE) IS
                            BEGIN
                                UPDATE Cargo_salario
                                SET salario = new_salario
                                WHERE cargo = new_cargo;
                            END reajuste_salarial;
END RH;
/
BEGIN
    RH.novo_funcionario();
    RH.reajuste_salarial();
END;
/

SELECT * FROM Funcionario;
SELECT * FROM Cargo_salario;
