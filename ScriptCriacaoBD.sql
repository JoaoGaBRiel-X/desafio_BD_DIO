-- criação do banco de dados para o cenário de e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table entidade (
	Entidade_Id int auto_increment primary key,
    Entidade_Pessoa enum('Fisica', 'Juridica') not null,
    Entidade_Nome_RazaoSocial varchar(35) not null,
    Entidade_NomeFantasia varchar(45),
    Entidade_CPF char(11),
    Entidade_CNPJ char(14),
    Entidade_Nascimento_Fundacao date not null,
    Entidade_Endereco varchar(45),
    Entidade_Bairro varchar(30),
    Entidade_CEP char(8),
    Entidade_Cidade varchar(25),
    Entidade_UF char(2),
    Entidade_Contato varchar(35),
    Entidade_Telefone char(11),
    Entidade_Tipo enum('Cliente', 'Fornecedor', 'Vendedor') not null,
    constraint unique_cpf_entidade unique(Entidade_CPF, Entidade_Nome_RazaoSocial),
    constraint unique_cnpj_entidade unique(Entidade_CNPJ, Entidade_Nome_RazaoSocial)
);

-- criar tabela produto
create table produto (
	Produto_Id int auto_increment primary key, 
    Produto_Descricao varchar(255) not null, 
    Produto_Categoria enum('Eletrônicos', 'Vestuário', 'Brinquedos', 'Livros', 'Alimentos') not null, 
    Produto_Valor float,
    Produto_Avaliacao float default 0,
    Produto_Dimensoes varchar(10)
);

-- criar tabela de pagamentos
create table pagamento(
	Pagamento_Id int primary key,
    Pagamento_Descricao varchar(30) not null,
    Pagamento_Tipo enum('Dinheiro', 'Cartão Crédito', 'Cartão Débito', 'Boleto', 'Outros') not null,
    Pagamento_Taxa float
);

-- criar tabela pedido

create table pedido (
	Pedido_Id int auto_increment primary key,
    Pedido_Cliente_Id int not null,
    Pedido_Status enum('Aguardando Aprovação', 'Aprovado', 'Cancelado', 'Em Separação', 'Em rota de entrega', 'Entregue') not null default 'Aguardando Aprovação',
	Pedido_Descricao varchar(45) not null,
	Pedido_Frete float,
    Pedido_Valor float,
    Pedido_Pagamento_Id int not null,
    constraint fk_cliente_pedido foreign key (Pedido_Cliente_Id) references entidade(Entidade_Id),
    constraint fk_pagamento_pedido foreign key (Pedido_Pagamento_Id) references pagamento(Pagamento_Id)
);

-- criar tabela estoque
create table estoque (
	Estoque_Id int auto_increment primary key, 
    Estoque_Local varchar(45)
);

-- criar tabela de relacionamento produto/vendedor
create table produto_vendedor (
	PV_IdVendedor int not null, 
	PV_IdProduto int not null,
    PV_Quantidade int not null,
    primary key (PV_IdProduto, PV_IdVendedor),
    constraint fk_produto_vendedor_vendedor foreign key (PV_IdVendedor) references entidade(Entidade_Id),
    constraint fk_produto_vendedor_produto foreign key (PV_IdProduto) references produto(Produto_Id)
);

-- criar tabela de relacionamento produto/pedido
create table produto_pedido (
	PP_IdPedido int not null, 
    PP_IdProduto int not null, 
    PP_Quantidade int not null,
    PP_Status enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (PP_IdProduto, PP_IdPedido),
    constraint fk_produto_pedido_pedido foreign key (PP_IdPedido) references pedido(Pedido_Id),
    constraint fk_produto_pedido_produto foreign key (PP_IdProduto) references produto(Produto_Id)
);

-- criar tabela de relacionamento produto/estoque
create table produto_estoque (
	PE_IdEstoque int not null, 
    PE_IdProduto int not null, 
    PE_Quantidade int not null,
    primary key (PE_IdProduto, PE_IdEstoque),
    constraint fk_produto_estoque_estoque foreign key (PE_IdEstoque) references estoque(Estoque_Id),
    constraint fk_produto_estoque_produto foreign key (PE_IdProduto) references produto(Produto_Id)
);

-- criar tabela de relacionamento produto/fornecedor
create table produto_fornecedor (
	PF_IdFornecedor int not null, 
    PF_IdProduto int not null, 
    primary key (PF_IdProduto, PF_IdFornecedor),
    constraint fk_produto_fornecedor_fornecedor foreign key (PF_IdFornecedor) references entidade(Entidade_Id),
    constraint fk_produto_fornecedor_produto foreign key (PF_IdProduto) references produto(Produto_Id)
);

show tables;
