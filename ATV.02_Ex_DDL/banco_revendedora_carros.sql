CREATE DATABASE REVENDEDORA_CARROS;

USE REVENDEDORA_CARROS;

CREATE TABLE AUTOMOVEIS (
    pk_RENAVAM VARCHAR(11) NOT NULL UNIQUE,
    Placa VARCHAR(7) NOT NULL,
    Marca VARCHAR(30) NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    Ano_Fabricacao DATE NOT NULL,
    Ano_Modelo DATE NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    Motor VARCHAR(20) NOT NULL,
    Numero_Portas INT NOT NULL,
    Tipo_Combustivel VARCHAR(20) NOT NULL,
    Preco DECIMAL(8,2),
    
    primary key (pk_RENAVAM)
);

CREATE TABLE CLIENTES (
    pk_Codigo_Cliente INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(40) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    
    primary key (pk_Codigo_Cliente)
);

CREATE TABLE VENDEDORES (
    pk_Codigo_Vendedor INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(40) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Data_Admissao DATE NOT NULL,
    Salario DECIMAL(8,2) NOT NULL,
    
    primary key (pk_Codigo_Vendedor)
);
 

CREATE TABLE VENDAS (
    pk_Codigo_Venda INT AUTO_INCREMENT NOT NULL UNIQUE,
    fk_Codigo_Cliente INT NOT NULL,
    fk_Codigo_Vendedor INT NOT NULL,
    fk_RENAVAM VARCHAR(11) NOT NULL,
    Preco_Pago DECIMAL(8,2) NOT NULL, 

	primary key (pk_Codigo_Venda),
    foreign key(fk_Codigo_Cliente) references CLIENTES(pk_Codigo_Cliente),
    foreign key(fk_Codigo_Vendedor) references VENDEDORES(pk_Codigo_Vendedor),
    foreign key(fk_RENAVAM) references AUTOMOVEIS(pk_RENAVAM)
);