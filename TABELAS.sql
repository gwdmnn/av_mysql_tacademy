/*
CREATE TABLE cliente (
id_cliente INT NOT NULL primary key auto_increment,
nome_cliente VARCHAR(30),
cpf_cliente INT, 
fone_cliente VARCHAR(12)
)

CREATE TABLE marca (
id_marca INT NOT NULL primary key auto_increment,
nome_marca VARCHAR(20)
)

CREATE TABLE produto(
id_produto INT NOT NULL primary key auto_increment,
nome_produto VARCHAR(40),
id_marca INT,
FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
)

CREATE TABLE estoque (
id_produto INT,
quantidade_estoque FLOAT,
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
)

CREATE TABLE carrinho(
id_carrinho INT NOT NULL primary key,
id_produto INT,
quantidade_produto FLOAT, 
preco_quantidade FLOAT,
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
)

alter table produto
add column preco_unitario FLOAT

CREATE TABLE venda(
id_venda INT NOT NULL primary key auto_increment,
id_carrinho INT,
id_cliente INT,
preco_total FLOAT, 
FOREIGN KEY (id_carrinho) REFERENCES carrinho(id_carrinho),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
)


CREATE TABLE movimentos(
produto_movimento INT,
carrinho_movimento INT,
data_movimento DATETIME,
descricao_movimento VARCHAR(100),
FOREIGN KEY (produto_movimento) REFERENCES produto(id_produto),
FOREIGN KEY (carrinho_movimento) REFERENCES carrinho(id_carrinho)
)


CREATE TABLE historicoCliente(
id_cliente INT,
quantidade_itens INT,
valor_gasto INT
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
)
*/









