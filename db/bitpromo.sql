CREATE DATABASE IF NOT EXISTS bitpromo;
USE bitpromo;

CREATE TABLE clientes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE empresas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE
);
-- DROP TABLE USERS;
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'USER', 'EMPRESA') NOT NULL,

    cliente_id BIGINT NULL,
    empresa_id BIGINT NULL,

    CONSTRAINT fk_user_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_user_empresa
        FOREIGN KEY (empresa_id)
        REFERENCES empresas(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2),
    imagem VARCHAR(500),
    link VARCHAR(500),
    
    categoria ENUM(
        'SMARTPHONES, ELETRÔNICOS E TV',
        'INFORMÁTICA E GAMES',
        'CASA E ELETRODOMÉSTICOS',
        'MODA E ACESSÓRIOS',
        'PRODUTOS PARA SEU PET',
        'OUTROS'
    ) NOT NULL,

    empresa_id BIGINT,
    
    CONSTRAINT fk_produto_empresa FOREIGN KEY (empresa_id)
        REFERENCES empresas(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

select * from empresas

