CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE, -- Indica se o cliente está ativo
    created_at TIMESTAMP DEFAULT NOW() -- Data de cadastro
);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_featured BOOLEAN DEFAULT FALSE -- Indica se é uma categoria destacada
);


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT REFERENCES categories (id),
    stock INT DEFAULT 0, -- Quantidade em estoque
    details JSONB, -- Informações adicionais (ex: dimensões, cor)
    is_available BOOLEAN DEFAULT TRUE -- Indica se está disponível para compra
);


CREATE TYPE order_status AS ENUM ('pending', 'completed', 'cancelled', 'shipped');
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers (id),
    status order_status DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

select * from orders;

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders (id),
    product_id INT REFERENCES products (id),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL -- Preço no momento do pedido
);


INSERT INTO customers (name, email, phone, is_active)
VALUES 
    ('João Silva', 'joao.silva@gmail.com', '987654321', TRUE),
    ('Maria Santos', 'maria.santos@gmail.com', NULL, TRUE),
    ('Carlos Souza', 'carlos.souza@gmail.com', NULL, FALSE),
    ('Ana Oliveira', 'ana.oliveira@gmail.com', '123456789', TRUE);


INSERT INTO categories (name, description, is_featured)
VALUES 
    ('Eletrônicos', 'Produtos eletrônicos de última geração', TRUE),
    ('Móveis', NULL, FALSE),
    ('Roupas', 'Moda masculina e feminina', TRUE),
    ('Esportes', NULL, FALSE);


INSERT INTO categories (name, description, is_featured)
VALUES 
    ('Eletrônicos', 'Produtos eletrônicos de última geração', TRUE),
    ('Móveis', NULL, FALSE),
    ('Roupas', 'Moda masculina e feminina', TRUE),
    ('Esportes', NULL, FALSE);


INSERT INTO products (name, price, category_id, stock, details, is_available)
VALUES 
    ('Smartphone', 1999.90, 1, 10, '{"brand": "Samsung", "color": "Black"}', TRUE),
    ('Sofá', 1499.99, 2, 0, '{"dimensions": "200x90x100", "material": "leather"}', FALSE),
    ('Camisa Polo', 99.90, 3, 50, '{"size": "M", "color": "White"}', TRUE),
    ('Bola de Futebol', 89.90, 4, 20, '{"sport": "Football", "material": "synthetic"}', TRUE);


INSERT INTO orders (customer_id, status)
VALUES 
    (1, 'completed'),
    (2, 'pending'),
    (3, 'cancelled'),
    (4, 'shipped');


INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 1, 1999.90),
    (1, 4, 2, 89.90),
    (2, 3, 1, 99.90),
    (3, 2, 1, 1499.99),
    (4, 4, 3, 89.90);


-- join simples
select 
	o.id as order_id, 
	c.name as customer_name, 
	o.status 
from orders o
join customers c on c.id = o.customer_id;


select * from customers;
select * from orders;

-- left join com nulos
-- Liste todos os produtos e as categorias, incluindo produtos sem categoria definida.

-- select * from products;
-- select p.name, p.price, c.name as category_name
-- from products p 
-- left join categories c on c.id = p.category_id;

SELECT * 
FROM customers
WHERE phone IS NULL;
