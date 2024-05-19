CREATE SCHEMA IF NOT EXISTS Symposium;
USE Symposium;

CREATE TABLE IF NOT EXISTS prodotto(
	id INT auto_increment PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    prezzo numeric(10,2) not null,
    iva int not null,
    descrizione VARCHAR(1000) not null,
    immagine VARCHAR(500),
    stock int default 0 not null,
    alcol numeric(4,2) not null,
    formato numeric(5, 2) not null,
    provenienza varchar(50) not null,
    tipologia VARCHAR(30) NOT NULL CHECK(tipologia IN('rosso', 'spumante', 'champagne', 'altro', 'bianco', 'rosé')),
    annata int not null check(annata>1900),
    denominazione varchar(30) not null
);



CREATE TABLE IF NOT EXISTS utente(
	id int auto_increment primary key,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    email varchar(50) not null unique, -- unico account per mail.
    pw varchar(16) not null,
    telefono char(10),
    data_nascita date,
    amministratore boolean,
    via varchar(50),
    cap char(5),
    citta varchar(40),
    nome_carta varchar(61),
    scadenza date,
    numero_carta char(16),
    cvv char(3)
); 



CREATE TABLE IF NOT EXISTS ordine(
	id int auto_increment primary key,
    data_ordine date not null,
    stato int check(stato in(0, 1, 2)),
    citta varchar(50) not null,
    via varchar(50) not null,
    cap char(5) not null,
    utente int not null,
    foreign key (utente) references utente(id) ON DELETE RESTRICT ON UPDATE CASCADE 
);



CREATE TABLE IF NOT EXISTS categoria(
	nome varchar(40) primary key,
    descrizione varchar(1000) not null
);


CREATE TABLE IF NOT EXISTS appartenenza(
	prodotto int not null,
    categoria varchar(40) not null,
    primary key(prodotto, categoria),
    foreign key (prodotto) references prodotto(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    foreign key (categoria) references categoria(nome) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS element(
	prodotto int not null,
    ordine int not null,
    prezzo numeric(10,2) not null,
    iva int not null,
    quantita int not null,
    primary key (prodotto, ordine),
    foreign key (prodotto) references prodotto(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    foreign key (ordine) references ordine(id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS cart_line(
	prodotto int not null,
    utente int not null,
    quantita int not null,
    data_aggiunta date not null,
    foreign key (prodotto) references prodotto(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    foreign key (utente) references utente(id) ON DELETE RESTRICT ON UPDATE CASCADE
);
