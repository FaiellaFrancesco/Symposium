USE Symposium;
-- Inserimento nella tabella `utente`
INSERT INTO utente (nome, cognome, email, pw, telefono, data_nascita, amministratore, via, cap, citta, nome_carta, scadenza, numero_carta, cvv) 
VALUES ('Giuseppe', 'Gambardella', 'peppe@gmail.com', '2b36c28e79463e1ba7ff0ef1cac0747c3cd8c5eb5fc8dae5aacbbac11e0c8c152fc04251c404101dad520caa6d0fe75599e90d5355e0a870d58fc8e18380c277', NULL, '2004-02-08', TRUE, 'Via di Casa Mia', '81100', 'Caserta', NULL, NULL, NULL, NULL);

INSERT INTO utente (nome, cognome, email, pw, telefono, data_nascita, amministratore, via, cap, citta, nome_carta, scadenza, numero_carta, cvv) 
VALUES ('Francesco', 'Faiella', 'faiella@gmail.com', '48d5e801a9fb64d19afd2902071da0b65fa3566e10f88a7ee3abaeebe51adf9e58156cf32ad7d5fd70c563ae248722bfe5b49bae7d424358e9a01cdc78837155', NULL, '1980-01-01', TRUE, 'Via Roma 1', '00100', 'Rome', NULL, NULL, NULL, NULL);

INSERT INTO utente (nome, cognome, email, pw, telefono, data_nascita, amministratore, via, cap, citta, nome_carta, scadenza, numero_carta, cvv) 
VALUES ('Marco', 'Brescia', 'm.brescia16@studenti.unisa.it', 'c881ef0fe73259460fb90f821e3d69ec412861de6d34bd333bfc32cc4997012d4423540e2382171315611fb03503ccf913f4bf1839a04998ff536322fb52977a', NULL, '2003-03-26', TRUE, 'Via Castello I', '83029', 'Solofra', NULL, NULL, NULL, NULL);

USE Symposium;

-- Inserimento nella tabella `prodotto`
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione)
VALUES
('Vino Rosso', 12.99, 22, 'Un ottimo vino rosso dal gusto intenso.', 'immagini/vinorosso', 100, 13.5, 750, 'Italia', 'Vini Rossi', 2018, 'Chianti'),
('Spumante Brut', 19.99, 22, 'Un delicato spumante con bollicine fini e persistenti.', 'immagini/spumantebrut', 50, 12.5, 750, 'Francia', 'Spumanti', 2019, 'Prosecco'),
('Champagne Rose', 39.99, 22, 'Uno champagne rose di alta qualita, perfetto per occasioni speciali.', 'immagini/champagne', 20, 12.0, 750, 'Francia', 'Champagne', 2017, 'Moët & Chandon'),
('Vino Bianco', 9.99, 22, 'Un vino bianco fresco e fruttato, ideale per l''estate.', 'immagini/vinobianco', 80, 11.0, 750, 'Italia', 'Vini Bianchi', 2020, 'Pinot Grigio'),
('Rose', 14.99, 22, 'Un vino rose leggero e rinfrescante, perfetto per le giornate estive.', 'immagini/rose', 60, 10.5, 750, 'Spagna', 'Vini Rosati', 2019, 'Rosato di Toscana');

-- Inserimento nella tabella `ordine`
INSERT INTO ordine (data_ordine, stato, citta, via, cap, utente)
VALUES
('2024-04-19', 1, 'Roma', 'Via Appia 12', '00100', 1),
('2024-04-20', 0, 'Milano', 'Corso Buenos Aires 123', '20100', 2),
('2024-04-21', 2, 'Napoli', 'Via Toledo 45', '80100', 3);

-- Inserimento nella tabella `categoria`
INSERT INTO categoria (nome, descrizione)
VALUES
('Vini Rossi', 'Categoria che include tutti i tipi di vini rossi.'),
('Spumanti', 'Categoria che include tutti i tipi di spumanti.'),
('Champagne', 'Categoria che include tutti i tipi di champagne.'),
('Vini Bianchi', 'Categoria che include tutti i tipi di vini bianchi.'),
('Vini Rosati', 'Categoria che include tutti i tipi di vini rosati.');

-- Inserimento nella tabella `appartenenza`
INSERT INTO appartenenza (prodotto, categoria)
VALUES
(1, 'Vini Rossi'),
(2, 'Spumanti'),
(3, 'Champagne'),
(4, 'Vini Bianchi'),
(5, 'Vini Rosati');

-- Inserimento nella tabella `element`
INSERT INTO element (prodotto, ordine, prezzo, iva, quantita, nome)
VALUES
(1, 1, 12.99, 22, 2, 'Vino Rosso'),
(2, 2, 19.99, 22, 1, 'Spumante Brut'),
(3, 3, 39.99, 22, 1, 'Champagne Rose'),
(4, 1, 9.99, 22, 3, 'Vino Bianco'),
(5, 3, 14.99, 22, 2, 'Rose');

-- Inserimento nella tabella `cart_line`
INSERT INTO cart_line (prodotto, utente, quantita, data_aggiunta)
VALUES
(1, 1, 2, '2024-04-19'),
(2, 2, 1, '2024-04-20'),
(3, 3, 1, '2024-04-21'),
(4, 1, 3, '2024-04-19'),
(5, 3, 2, '2024-04-21');
