CREATE SCHEMA IF NOT EXISTS Symposium;
USE Symposium;

CREATE TABLE IF NOT EXISTS prodotti(
	id INT auto_increment PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    prezzo numeric(10,2) not null,
    IVA int not null,
    descrizione VARCHAR(1000) not null,
    immagine blob,
    stock int default 0 not null,
    alcol int not null,
    formato numeric(5, 2) not null,
    provenienza varchar(50) not null,
    tipologia VARCHAR(30) NOT NULL CHECK(tipologia IN('rosso', 'spumante', 'champagne', 'altro', 'binaco', 'rosé')),
    annata int not null check(annata>1900),
    denominazione varchar(30) not null
);mysql> tee DDL.sql
mysql> USE DDL.sql
ERROR 1049 (42000): Unknown database 'ddl.sql'
mysql> quit
