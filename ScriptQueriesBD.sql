use ecommerce;

-- quantidade de entidade cadastradas
select count(*) as 'Total_Entidades' from entidade;

-- lista pedidos clientes
select 
e.Entidade_Nome_RazaoSocial as 'Nome Cliente', 
p.Pedido_Id as 'Numero Pedido', 
p.Pedido_Status as 'Status Pedido', 
p.Pedido_Descricao as 'Descricao Pedido'
from entidade e, pedido p where e.Entidade_Id = Pedido_Cliente_Id;

-- quantidade de pedidos por cliente
select 
e.Entidade_Nome_RazaoSocial as 'Nome Cliente', 
count(e.Entidade_Nome_RazaoSocial) as 'Qtd Pedidos'
from entidade e, pedido p where e.Entidade_Id = Pedido_Cliente_Id
group by e.Entidade_Nome_RazaoSocial;

-- Top 3 cliente mais pedidos
select 
e.Entidade_Nome_RazaoSocial as 'Nome Cliente', 
count(e.Entidade_Nome_RazaoSocial) as 'Qtd Pedidos'
from entidade e, pedido p where e.Entidade_Id = Pedido_Cliente_Id
group by e.Entidade_Nome_RazaoSocial
order by count(e.Entidade_Nome_RazaoSocial) desc
limit 3;

-- Clientes com mais de 2 pedidos
select 
e.Entidade_Nome_RazaoSocial as 'Nome Cliente', 
count(e.Entidade_Nome_RazaoSocial) as 'Qtd Pedidos'
from entidade e, pedido p where e.Entidade_Id = Pedido_Cliente_Id
group by e.Entidade_Nome_RazaoSocial
having Count(e.Entidade_Nome_RazaoSocial) > 2;

-- produtos em estoque
select 
p.Produto_Descricao as 'Nome Produto',
pe.PE_Quantidade as 'Quantidade',
e.Estoque_Local as 'Local'
from produto_estoque pe
inner join produto p on PE_IdProduto = Produto_Id
inner join estoque e on PE_IdEstoque = Estoque_Id
order by p.Produto_Descricao;

-- total de produtos estoque
select 
p.Produto_Descricao as 'Nome Produto',
SUM(pe.PE_Quantidade) as 'Quantidade'
from produto_estoque pe
inner join produto p on PE_IdProduto = Produto_Id
inner join estoque e on PE_IdEstoque = Estoque_Id
group by p.Produto_Descricao
order by p.Produto_Descricao;

-- Relacao produto fornecedor estoque
select
f.Entidade_Nome_RazaoSocial as 'Fornecedor',
p.Produto_Descricao as 'Produto',
SUM(pe.PE_Quantidade) as 'Quantidade'
from produto_fornecedor pf
inner join entidade f on pf.PF_IdFornecedor = f.Entidade_Id
inner join produto p on pf.PF_IdProduto = p.Produto_Id
inner join produto_estoque pe on PE_IdProduto = p.Produto_Id
group by f.Entidade_Nome_RazaoSocial, p.Produto_Descricao;

-- Relacao produto fornecedor
select
f.Entidade_Nome_RazaoSocial as 'Fornecedor',
p.Produto_Descricao as 'Produto'
from produto_fornecedor pf
inner join entidade f on pf.PF_IdFornecedor = f.Entidade_Id
inner join produto p on pf.PF_IdProduto = p.Produto_Id
inner join produto_estoque pe on PE_IdProduto = p.Produto_Id
group by p.Produto_Descricao, f.Entidade_Nome_RazaoSocial
;

