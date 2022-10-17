-- drop procedure cadastroMarca;
/*
*DELIMITER $$
CREATE PROCEDURE cadastroMarca(IN nome VARCHAR(20))
BEGIN
DECLARE qtde INT;
DECLARE msg VARCHAR(50);
SET qtde = 0;
SELECT count(*) INTO qtde FROM marca WHERE nome_marca = nome;
IF qtde > 0 THEN
	SET msg = 'A marca informada já está cadastrada';
ELSE
	INSERT INTO marca(nome_marca)
	VALUES(nome);
    SET msg = 'Marca cadastrada';
END IF;
SELECT msg;
END$$
DELIMITER ;
*/
/*
DELIMITER $$
CREATE PROCEDURE cadastroProduto(IN nome VARCHAR(40), IN marca INT, IN preco FLOAT)
BEGIN
DECLARE qtde INT;
DECLARE msg VARCHAR(50);
SET qtde = 0;

SELECT count(*) INTO qtde FROM marca WHERE id_marca = marca;

IF qtde <> 0 THEN
	INSERT INTO produto (nome_produto, id_marca, preco_unitario)
	VALUES(nome, marca, preco);
    SET msg = 'Produto cadastrado!';
ELSE
	SET msg = 'A marca informada ainda não foi cadastrada';
END IF;
SELECT msg;   

END$$
DELIMITER ;

*/
/*
DELIMITER $$
CREATE PROCEDURE addEstoque (IN id INT, IN quantidade FLOAT)
BEGIN
DECLARE qtde INT;
DECLARE msg VARCHAR(50);
SET qtde = 0;

SELECT count(*) INTO qtde FROM produto WHERE id_produto = id;

IF qtde <> 0 THEN
	INSERT INTO estoque (id_produto, quantidade_estoque)
	VALUES(id, quantidade);
    SET msg = 'Estoque cadastrado!';
ELSE
	SET msg = 'Este produto não está cadastrado';
END IF;
SELECT msg;
END$$
DELIMITER ;

*/
/*
drop procedure adicionarAoCarrinho;
DELIMITER $$
CREATE PROCEDURE adicionarAoCarrinho(IN idCarrinho INT, IN idProduto INT, IN quantidade FLOAT)
BEGIN
DECLARE msg VARCHAR(50);
DECLARE qtde INT;
DECLARE stock INT;
DECLARE total FLOAT;
SET qtde = 0;
SET stock = (SELECT quantidade_estoque FROM estoque WHERE estoque.id_produto = idProduto);

SELECT count(*) INTO qtde FROM produto WHERE id_produto = idProduto;

IF qtde = 0 THEN 
	SET msg = 'Este produto não está cadastrado';
ELSE IF stock >= quantidade THEN
	SET total = quantidade * (SELECT preco_unitario FROM produto WHERE id_produto = idProduto);
	INSERT INTO carrinho (id_carrinho, id_produto, quantidade_produto, preco_quantidade)
    VALUES (idCarrinho, idProduto, quantidade, total);
    SET msg = 'Produto adicionado ao carrinho!';
ELSE 
	SET msg = 'Não há estoque suficiente do produto';
END IF;
END IF;

SELECT msg;
	
END$$
DELIMITER ;

*/
/*DELIMITER $$
CREATE PROCEDURE consultaCarrinho()
BEGIN
SELECT * FROM carrinho;
END$$
DELIMITER ;
*/


/*
DELIMITER $$
CREATE PROCEDURE verMovimentos()
BEGIN
 SELECT * FROM movimentos GROUP BY data_movimento;
END$$
DELIMITER ;

/*
DELIMITER $$
CREATE PROCEDURE deletaCarrinho(IN id INT)
BEGIN
DELETE FROM carrinho WHERE id_produto = id;
END$$
DELIMITER ;
*/

DELIMITER $$
CREATE PROCEDURE consultaEstoque()
BEGIN
	SELECT * FROM estoque
    RIGHT JOIN produto ON produto.id_produto = estoque.id_produto;
END$$
DELIMITER ;





