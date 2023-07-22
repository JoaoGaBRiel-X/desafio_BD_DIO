use ecommerce;

insert into entidade (
	Entidade_Pessoa,
	Entidade_Nome_RazaoSocial, 
	Entidade_NomeFantasia, 
	Entidade_CPF, 
	Entidade_CNPJ, 
	Entidade_Nascimento_Fundacao,
	Entidade_Endereco,
    Entidade_Bairro,
    Entidade_CEP,
    Entidade_Cidade,
    Entidade_UF, 
    Entidade_Contato,
    Entidade_Telefone,
    Entidade_Tipo)
values
	('Fisica', 'Maria M Silva', null, 12345678912, null, '1995-08-21', 'Rua das Acacias, 752', 'Centro', '12345678', 'São Paulo', 'SP', 'Maria', '11918645678', 'Cliente'),
    ('Fisica', 'Matheus O Pimentel', null, 12345678913, null, '1992-11-21', 'Rua das Laranjeiras, 256', 'Centro', '12345678', 'São Paulo', 'SP', 'Matheus', '11912345678', 'Cliente'),
    ('Fisica', 'Ricardo F Silva', null, 12345678914, null, '1998-10-14', 'Rua dos Ypes, 14', 'Centro', '12345678', 'São Paulo', 'SP', 'Ricardo', '11956345678', 'Cliente'),
    ('Fisica', 'Julia S França', null, 12345678915, null, '1985-02-13', 'Rua dos Pinheiros, 25', 'Centro', '12345678', 'São Paulo', 'SP', 'Julia', '11912214978', 'Cliente'),
    ('Fisica', 'Roberta G Assis', null, 12345678916, null, '1975-04-21', 'Rua das Arvores, 17', 'Centro', '12345678', 'São Paulo', 'SP', 'Roberta', '11915245678', 'Cliente'),
    ('Fisica', 'Isabela M Cruz', null, 12345678917, null, '1995-08-01', 'Rua dos Arbustos, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Isabela', '11918566784', 'Cliente'),
	('Juridica', 'Almeida e Filhos', 'Distribuidora Almeida', null, 12345675000125, '1970-08-01', 'Rua da Lapa, 750', 'Lapa', '12345678', 'Rio de Janeiro', 'RJ', 'Juarez', '11986332184', 'Fornecedor'),
	('Juridica', 'Eletrônicos Silva', null, null, 15647852000579, '1995-08-01', 'Rua dos Perdigueiros, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Vania', '11918566784', 'Fornecedor'),
	('Juridica', 'Distimport', null, null, 25698745001263, '1995-08-01', 'Rua dos Santos, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Marcos', '11918566784', 'Fornecedor'),
	('Juridica', 'Tech Eletronics', null, null, 14585621000275, '1995-08-01', 'Rua dos Palmeiras, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Pedro', '11918566784', 'Vendedor'),
    ('Juridica', 'Botique Durgas', null, null, 32568750000374, '1995-08-01', 'Rua das flores, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Janio', '11918566784', 'Vendedor'),
	('Juridica', 'Kids World', null, null, 20387468033347, '1995-08-01', 'Rua dos mineiros, 1563', 'Centro', '12345678', 'São Paulo', 'SP', 'Tania', '11918566784', 'Vendedor');


insert into produto (
	Produto_Descricao,
    Produto_Categoria,
    Produto_Valor,
    Produto_Avaliacao,
    Produto_Dimensoes)
values
	('Fone de Ouvido', 'Eletrônicos', 365.00, 4, null),
    ('Barbie Elsa', 'Brinquedos', 65.00, 3, null),
    ('Body Carters', 'Vestuário', 89.90, 5, null),
    ('Microfone Vedo', 'Eletrônicos', 670.50, 4, null),
    ('Harry Potter e a Pedra Filosofal', 'Livros', 39.65, 3, null),
    ('Farinha de Arroz', 'Alimentos', 18.60, 2, null),
    ('Amendoin', 'Alimentos', 5.00, 1, null),
    ('Fire Stick Amazon', 'Eletrônicos', 199.00, 3, null);
    
insert into pagamento
values
	(1, 'Dinheiro', 'Dinheiro', 0),
    (2, 'Mastercard', 'Cartão Crédito', 3.65),
    (3, 'Elo', 'Cartão Débito', 1.8);
    
insert into pedido(
	Pedido_Cliente_Id,
    Pedido_Status,
    Pedido_Descricao,
    Pedido_Frete,
    Pedido_Valor,
    Pedido_Pagamento_Id)
values
	(1, default, 'compra via aplicativo', null, null, 2),
    (2, 'Em rota de entrega', 'compra via aplicativo', 35, null, 3),
    (3, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (1, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (1, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (3, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (4, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (1, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (3, 'Aprovado', 'compra presencial', 16.30, null, 1),
    (4, default, 'compra via site', 45.9, null, 1);

insert into produto_pedido
values
	(1, 1, 2, default),
    (1, 2, 1, default),
    (2, 3, 1, default);
    
insert into estoque (
	Estoque_Local)
values
	('Rio de janeiro'),
    ('São Paulo'),
    ('Brasilia'),
    ('Minas Gerais');

insert into produto_estoque 
values
	(1, 2, 500),
	(1, 1, 35),
    (1, 5, 400),
    (2, 3, 3888),
    (3, 2, 4756),
    (2, 1, 356),
    (4, 7, 756),
    (4, 3, 250),
    (2, 6, 1500);
    
insert into produto_fornecedor
values
	(7,1),
    (7,2),
    (8,1),
    (8,4),
    (9,3),
    (8,5),
    (8,3);
    
insert into produto_vendedor
values
	(1, 6, 80),
    (2, 7, 10);

