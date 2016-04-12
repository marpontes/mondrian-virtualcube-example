CREATE TABLE compras(
  id_produto int,
  id_tempo int,
  valor_compra int
);

CREATE TABLE produtos(
  id int,
  linha VARCHAR(10),
  produto VARCHAR(20)
);

CREATE TABLE tempo(
  id int,
  ano int,
  mes_numero int,
  mes_abrev VARCHAR(3)
);

CREATE TABLE vendas(
  id_produto int,
  id_tempo int,
  id_vendedor int,
  valor_venda int
);

CREATE TABLE vendedores(
  id int,
  nome VARCHAR(8)
);
