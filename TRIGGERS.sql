/*
DELIMITER $$
CREATE TRIGGER tr_atualiza_estoque AFTER INSERT On carrinho
FOR EACH ROW
BEGIN
  DECLARE msg VARCHAR(500);
  UPDATE estoque SET quantidade_estoque = quantidade_estoque - NEW.quantidade_produto;
  SET msg = concat('Foi debitado ',NEW.quantidade_produto,' unidades do estoque do produto ', new.id_produto);
  INSERT INTO movimentos VALUES (NEW.id_produto, NEW.id_carrinho, now(), msg);
  
END$$
DELIMITER ;
*/

/*
DELIMITER $$
CREATE TRIGGER tr_exlcui_item AFTER DELETE ON carrinho
FOR EACH ROW
BEGIN
  DECLARE msg VARCHAR(500);
  
  UPDATE estoque SET quantidade_estoque = quantidade_estoque + OLD.quantidade_produto;
  SET msg = concat('Foi creditado ',OLD.quantidade_produto,' unidades do estoque do produto ', OLD.id_produto, ' ao excluir item');
END$$
DELIMITER ;