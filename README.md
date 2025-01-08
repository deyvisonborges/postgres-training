### Descrição do Projeto

O sistema gerencia clientes, produtos, categorias, pedidos e itens do pedido. A estrutura foi projetada para ser rica em relacionamentos, permitindo explorar consultas com JOINs, filtragens, agregações e subconsultas.

### Estrutura do banco:

#### Entidades

- Cliente
- Categoria
- Produto
- Pedido
- Item de pedido

#### Tópicos de construção

- [ ] - criacao de id
- [ ] - validacao de nulos
- [ ] - definir valores default do tipo boleano
- [ ] - definir valores de default do tipo date
- [ ] - adicionar references
- [ ] - adicionar campos JSONB
- [ ] - criar type enum

#### Construção das tabelas

- [ ] - criar tabela customers
- [ ] - criar tabela categories
- [ ] - criar tabela products
- [ ] - criar tabela orders
- [ ] - criar tabela order_items

#### Popupar tabelas

Para cada tabela, inserir valores, associações, cenários nulos e outros.

#### Prática da consulta

- [ ] - Liste os pedidos e os nomes dos clientes.
- [ ] - Liste todos os produtos e as categorias, incluindo produtos sem categoria definida.
- [ ] - Liste todas as categorias, incluindo aquelas sem produtos associados.
- [ ] - Encontre produtos de uma marca específica (exemplo: Samsung).
- [ ] - Encontre o total de pedidos por cliente.
- [ ] - Liste os clientes que já gastaram mais de R$ 2000 em pedidos.
- [ ] - Liste os clientes ativos cadastrados nos últimos 30 dias.
- [ ] - Liste pedidos com uma descrição mais legível para o status.
- [ ] - Buscar clientes que não informaram o número de telefone (phone).
- [ ] - Buscar todos os produtos que possuem categorias associadas (excluir categorias nulas).
- [ ] - Substituir valores NULL por uma string padrão ao exibir os telefones dos clientes.
- [ ] - Contar quantos clientes possuem e quantos não possuem telefone cadastrado.
- [ ] - Listar categorias e verificar quais não têm produtos associados.
