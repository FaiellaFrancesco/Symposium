use Symposium;
-- Inserimento nella tabella `prodotto`
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione)
VALUES
('Vino Rosso', 12.99, 22, 'Un ottimo vino rosso dal gusto intenso.', 'immagini/vinorosso', 100, 13.5, 750, 'Italia', 'rosso', 2018, 'Chianti'),
('Spumante Brut', 19.99, 22, 'Un delicato spumante con bollicine fini e persistenti.', 'immagini/spumantebrut', 50, 12.5, 750, 'Francia', 'spumante', 2019, 'Prosecco'),
('Champagne Rosé', 39.99, 22, 'Uno champagne rosé di alta qualità, perfetto per occasioni speciali.','immagini/chamapgne.webp', 20, 12.0, 750, 'Francia', 'champagne', 2017, 'Moët & Chandon'),
('Vino Bianco', 9.99, 22, 'Un vino bianco fresco e fruttato, ideale per l''estate.','immagini/vinobianco', 80, 11.0, 750, 'Italia', 'bianco', 2020, 'Pinot Grigio'),
('Rosé', 14.99, 22, 'Un vino rosé leggero e rinfrescante, perfetto per le giornate estive.','immagini/rose', 60, 10.5, 750, 'Spagna', 'bianco', 2019, 'Rosato di Toscana');

-- Inserimento nella tabella `utente`
INSERT INTO utente (nome, cognome, email, pw, telefono, data_nascita, amministratore, via, cap, citta, nome_carta, scadenza, numero_carta, cvv)
VALUES
('Mario', 'Rossi', 'mario.rossi@example.com', 'password123', '1234567890', '1990-05-15', 1, 'Via Roma 123', '00100', 'Roma', 'Mario Rossi', '2026-12-31', '1234567890123456', '123'),
('Giulia', 'Bianchi', 'giulia.bianchi@example.com', 'abc123', '0987654321', '1988-10-20', 0, 'Corso Italia 45', '20100', 'Milano', 'Giulia Bianchi', '2025-11-30', '9876543210987654', '456'),
('Luca', 'Verdi', 'luca.verdi@example.com', 'passpass', '1122334455', '1995-03-10', 0, 'Via Garibaldi 67', '80100', 'Napoli', 'Luca Verdi', '2024-10-31', '5678901234567890', '789');

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
INSERT INTO element (prodotto, ordine, prezzo, iva, quantita)
VALUES
(1, 1, 12.99, 22, 2),
(2, 2, 19.99, 22, 1),
(3, 3, 39.99, 22, 1),
(4, 1, 9.99, 22, 3),
(5, 3, 14.99, 22, 2);

-- Inserimento nella tabella `cart_line`
INSERT INTO cart_line (prodotto, utente, quantita, data_aggiunta)
VALUES
(1, 1, 2, '2024-04-19'),
(2, 2, 1, '2024-04-20'),
(3, 3, 1, '2024-04-21'),
(4, 1, 3, '2024-04-19'),
(5, 3, 2, '2024-04-21');
