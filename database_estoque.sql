create database estoque;
use estoque;

CREATE TABLE empresa (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    segmento VARCHAR(255)
);

CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pertence_a_empresa INT,
    FOREIGN KEY (pertence_a_empresa) REFERENCES empresa(id)
);

CREATE TABLE variacao_produto (
    id INT PRIMARY KEY,
    prd_principal INT,
    codigo INT,
    descricao VARCHAR(255),
    cor VARCHAR(255),
    tamanho VARCHAR(5),
    preco DECIMAL(10, 2),
    quantidade_atual INT,
    pertence_a_empresa INT,
    FOREIGN KEY (prd_principal) REFERENCES produto(id),
    FOREIGN KEY (pertence_a_empresa) REFERENCES empresa(id)
);

CREATE TABLE natureza_operacao (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo_movimento VARCHAR(255) NOT NULL
);


CREATE TABLE estoque (
    id INT PRIMARY KEY,
    data DATE,
    id_empresa INT,
    id_variacao_produto INT,
    mes_ano VARCHAR(7),
    quantidade INT,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id),
    FOREIGN KEY (id_variacao_produto) REFERENCES variacao_produto(id)
);

CREATE TABLE movimentacoes (
    id INT PRIMARY KEY,
    data DATE,
    id_empresa INT,
    id_variacao_produto INT,
    numero_doc VARCHAR(255),
    nat_operacao INT not null ,
    tipo_movimento VARCHAR(255),
    quantidade INT,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id),
    FOREIGN KEY (id_variacao_produto) REFERENCES variacao_produto(id),
    FOREIGN KEY (nat_operacao) REFERENCES natureza_operacao(id)
);
INSERT INTO empresa (id, nome, segmento)
VALUES (1, 'xyz store', 'roupa');

INSERT INTO produto (id, nome, pertence_a_empresa)
VALUES (1, 'Camisa',1);

INSERT INTO variacao_produto (id, prd_principal, codigo, descricao, cor, tamanho, preco, quantidade_atual, pertence_a_empresa)
VALUES (1001, 101, 1001, 'Camisa de Algodão', 'Preta', 'M', 25.90, 100,1);

-- inserts da tabela 'estoque' conforme feito na planilha

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (1, '2023-01-31', 1, 1001, '01/2023', 73);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (2, '2023-02-28', 1, 1001, '02/2023', 112);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (3, '2023-03-31', 1, 1001, '03/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (4, '2023-04-30', 1, 1001, '04/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (5, '2023-05-31', 1, 1001, '05/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (6, '2023-06-30', 1, 1001, '06/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (7, '2023-07-31', 1, 1001, '07/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (8, '2023-08-31', 1, 1001, '08/2023', 120);

INSERT INTO estoque (id, data, id_empresa, id_variacao_produto, mes_ano, quantidade)
VALUES (9, '2023-09-30', 1, 1001, '09/2023', 120);


-- inserts na tabela 'natureza_operacao'



INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (1, 'compra', 'Entrada');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (2, 'venda', 'Saída');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (3, 'transferência', 'Entrada');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (4, 'transferência', 'Saída');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (5, 'devolução', 'Entrada');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (6, 'dvolução', 'Saída');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (7, 'uso_consumo', 'Saída');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (8, 'inventario', 'Entrada');

INSERT INTO natureza_operacao (id, nome, tipo_movimento)
VALUES (9, 'inventario', 'Saída');


-- inserts na tabela 'movimentacoes'



INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (1, '2023-01-01', 1, 1001, 'S53', 1, 'Entrada', 100);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (2, '2023-01-05', 1, 1001, 'S53', 2, 'Saída', -7);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (3, '2023-01-19', 1, 1001, 'S53', 2, 'Saída', -20);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (4, '2023-02-08', 1, 1001, 'S53', 1, 'Entrada', 50);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (5, '2023-02-12', 1, 1001, 'S53', 2, 'Saída', -8);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (6, '2023-02-18', 1, 1001, 'S53', 2, 'Saída', -3);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (7, '2023-02-22', 1, 1001, 'S53', 2, 'Saída', -2);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (8, '2023-03-03', 1, 1001, 'S53', 1, 'Entrada', 20);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (9, '2023-03-09', 1, 1001, 'S53', 2, 'Saída', -8);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (10, '2023-03-04', 1, 1001, 'S53', 2, 'Saída', -4);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (11, '2023-10-01', 1, 1001, 'S53', 1, 'Entrada', 30);

INSERT INTO movimentacoes (id, data, id_empresa, id_variacao_produto, numero_doc, nat_operacao, tipo_movimento, quantidade)
VALUES (12, '2023-10-02', 1, 1001, 'S53', 2, 'Saída', -10);


select * from variacao_produto;
select * from movimentacoes;