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
-- VINI ROSSI
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
('Primitivo Doppio Passo 2022', 8.50, 22, "Il Primitivo Doppio Passo è un vino rosso del Salento dal profilo morbido e rotondo.'", 'immagini/1.jpg', 35, 13.0, 75, 'Puglia (Italia)','Vini Rossi', 2022, "Salento IGT", true),
("Cannonau 'Mamuthone' Sedilesu", 19.20, 22, "Il Cannonau 'Mamuthone' di Sedilesu è un vino rosso di grande struttura, invecchiato in botte per 12 mesi.", "immagini/2.jpg", 67, 14.5 , 75, "Sardegna (Italia)", 'Vini Rossi', 2021, "Cannonau sardegna DOC", true),  
('Tignanello Antinori', 235.00, 22, "Il Tignanello di Antinori è un grande vino toscano, corposo e intenso, di grande eleganza e consistenza, prodotto da uve di Sangiovese, Cabernet Franc e Cabernet Sauvignon, affinato per almeno 12 mesi in barrique.", 'immagini/3.jpg', 9, 13.5, 75, 'Toscana (Italia)','Vini Rossi', 2012, "Toscana IGT", true),
("Barolo 'Otin Fiorin - Piè Rupestris' Cappellano", 250.10, 22, "Il Barolo 'Otin Fiorin - Piè Rupestris' è un vino robusto, austero e complesso, nato da viti molto vecchie del cru Gabutti di Serralunga. ", 'immagini/4.jpg', 8, 14.0, 75, 'Piemonte (Italia)','Vini Rossi', 2019, "Barolo DOCG", true),
('Kairos Zymé 2019', 74.00, 22,"Il Kairos è un vino rosso robusto e molto intenso, affinato per 36 mesi in barrique e ottenuto dall'assemblaggio di 15 vitigni, di cui 11 a bacca rossa", 'immagini/5.jpg', 25, 15.0, 75, 'Veneto (Italia)','Vini Rossi', 2019, "Veneto IGT", true),
('Insoglio del Cinghiale Campo di Sasso', 20.90, 22, "L’Insoglio del Cinghiale è un vino rosso che esprime l’anima indomita della Maremma e che si abbina alla perfezione ai piatti tipici della cucina toscana. ", 'immagini/6.jpg', 75, 14.0, 75, 'Toscana (Italia)','Vini Rossi', 2022, "Toscana IGT", true),
("Barbera d'Asti 'Tasmorcan' Elio Perrone", 11.50, 22, "La Barbera d’Asti “Tasmorcan” è un vino rosso di grande tipicità territoriale che colpisce per il carattere morbido e fresco.", 'immagini/7.jpg', 105, 14.5, 75, 'Piemonte (Italia)','Vini Rossi', 2023, "Barbera d'Asti DOCG", true),
("'Casa e Chiesa' Tenuta Lenzini 2023", 13.50, 22, " Un succo godibile e fresco, vinificato in acciaio e in cemento capace di regalare un sorso artigianale e rustico, sincero e appagante, intersecato da venature saline ed ematiche che ne amplificano la naturale forza gastronomica.", 'immagini/8.jpg', 104, 14.0, 75, 'Toscana (Italia)','Vini Rossi', 2023, "Colline Lucchesi DOC ", true),
("Rioja 'El Marujo' Joven Organico Señorio De Librares", 11.50, 22, "El Marujo Joven Organico Señorio De Librares è un vino rosso spagnolo a base di Tempranillo, prodotto da uve biologiche coltivate nella regione di La Rioja", 'immagini/9.jpg', 55, 13.5, 75, 'La Rioja (Spagna)','Vini Rossi', 2022, "Rioja IGT", true),
('Rosso Piceno Aurora 2022', 10.50, 22, "Il Rosso Piceno della cantina Aurora è un vino ottenuto da fermentazione spontanea delle uve. Al naso si avvertono vivaci frutti rossi, di sottobosco e in confettura, spezie, caffè e tabacco.", 'immagini/10.jpg', 67, 13.5, 75, 'Marche (Italia)','Vini Rossi', 2022, "Rosso Piceno DOC", true),
('Taurasi Feudi di San Gregorio 2019', 21.50, 22, "Il Taurasi di Feudi di San Gregorio è un vino rosso irpino pieno e intenso, affinato per 18 mesi in barrique e 9 mesi in bottiglia. ", 'immagini/11.jpg', 75, 14.0, 75, 'Campania (Italia)','Vini Rossi', 2019, "Taurasi DOCG", true),
("Taurasi 'Fren' Stefania Barbot", 38.50, 22, "Il Taurasi 'Fren' è un vino rosso corposo e molto intenso che matura per 2 anni in botti di quercia. Si esprime su ampi sentori di frutta rossa scura matura, spezie dolci, prugna e piacevoli sensazioni di tabacco e cacao.", 'immagini/12.jpg', 15, 14.5, 75, 'Campania (Italia)','Vini Rossi', 2019, "Taurasi DOCG", true);

-- VINI BIANCHI
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
("Vermentino 'Costamolino' Argiolas 2023", 10.50, 22, "Il Vermentino 'Costamolino' è una delle etichette più conosciute della cantina Argiolas. E' un vino bianco dal sapore fruttato e fresco. ", 'immagini/13.jpg', 80, 14.0, 75, 'Alto Adige (Italia)', 'Vini Bianchi', 2023, 'Vermentino di Sardegna DOC', true),
("'Pfefferer' Colterenzio 2023", 10.90, 22, 'Si tratta di un bianco fruttato e speziato, dalla trama elegante e suadente, sostenuta da una energizzante freschezza..', 'immagini/14.jpg', 80, 12.5, 75, 'Alto Adige (Italia)', 'Vini Bianchi', 2023, 'Alto Adige/Sudtirol DOC', true),
('Riesling Trocken Gutswein Weingut Reinhardt 2022', 12.50, 22, 'Il Riesling Trocken Gutswein di Weingut Reinhardt è un vino bianco che irradia potenza ed eleganza. Vestito di un color giallo paglierino luminoso, rimanda ai tipici aromi di mela e pesca nettarina, ai leggeri sentori di agrumi e alla mineralità animata.', 'immagini/15.jpg', 87, 11.5, 75, 'Pfalz (Germania)', 'Vini Bianchi', 2022, '---', true),
("Trebbiano d'Abruzzo Emidio Pepe 2007", 250.20, 22, 'Vino bianco di notevole espressione. Di bella complessità al naso, elegante, dai sentori di frutta accarezzatada sentori marini e in confettura.', 'immagini/16.jpg', 7, 12.0, 75, 'Abruzzo (Italia)', 'Vini Bianchi', 2007, "Trebbiano d'Abruzzo DOC", true),
('Batard-Montrachet Grand Cru Fontaine-Gagnard 2020', 430.40, 22, 'Batard-Montrachet Grand Cru di Fontaine-Gagnard è un bianco di strepitosa eleganza e classe, dal corpo maestoso e denso, frutto delle migliori uve Chardonnay del Grand Cru della Borgogna.', 'immagini/17.jpg', 9, 13.5, 75, 'Borgogna (Francia)', 'Vini Bianchi', 2020, 'Batard Montrachet AOC', true),
("Puligny Montrachet 'Les Charmes'", 145.00, 22, 'Un elegante vino bianco di Borgogna a base di Chardonnay, affinato per 16 mesi in barrique. Ricco, avvolgente e pieno al palato, dal finale minerale e leggermente speziato', 'immagini/18.jpg', 21, 13.0, 75, 'Borgogna (Francia)', 'Vini Bianchi', 2021, 'Puligny Montrachet AOC', true),
("Lugana 'I Frati' Ca' dei Frati 2023", 12.50, 22, "Il fiore all'occhiello della cantina Ca' dei Frati. Pienamente espressivo delle caratteristiche della Turbiana, si offre con una personalità fresca, delicata ed elegante", 'immagini/19.jpg', 84, 13.0, 75, 'Lombardia (Italia)', 'Vini Bianchi', 2023, 'Lugana DOC', true),
('Madeira Sercial Ribeiro 20 YO Barbeito', 166.0, 22, "Il Madeira Sercial Ribeiro 20 YO Barbeito è un vino di grande eleganza prodotto in Portogallo, a base di Sercial e Tinta Negra. Al naso colpisce un'apoteosi di profumi caldi e intensi, dalle note di frutta secca e caramello alle delicate nuances speziate e affumicate dovute al lungo affinamento" , 'immagini/20.jpg', 44, 19.5, 75, 'Madera (Spagna)', 'Vini Bianchi', 2004, 'Madeira DOC', true),
("Sancerre Blanc 'Origine' Matthias et Emile Roblin 2022", 21.60, 22, "E' un Sancerre Blanc che esprime in maniera eccellente l'unicità del terrorir della Valle della Loira orientale. Un Sauvignon dal profilo organolettico erbaceo e fruttato, dai toni verdi e agrumati e dal sorso dritto e vivido", 'immagini/21.jpg', 65, 13.0, 75, 'Valle della Loira ( Francia )', 'Vini Bianchi', 2022, 'Sancerre AOC', true),
('Piccolo Derthona Vigneti Massa 2023', 14.0, 22, 'Il Piccolo Derthona di Vigneti Massa è un vino bianco piacevole e fresco provenienti da uve bianche cresciute a 300 metri di altitudine. ', 'immagini/22.jpg', 57, 12.5, 75, 'Piemonte ( Italia )', 'Vini Bianchi', 2023, '---', true);

-- VINI ROSE
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
("Tinetta La Bollina 2023", 9.90, 22, "Tinetta è un vino rosato leggero e delicato del Piemonte a base di Nebbiolo, vinificato e affinato in solo acciaio. Il ventaglio olfattivo verte su piccoli frutti rossi e fiori di campo con leggeri ricordi minerali.", 'immagini/23.jpg', 60, 13.0, 75, "Piemonte (Italia)", 'Vini Rosati', 2023, "Monferrato DOC", true),
("Rosato 'Cancelli' Rabasco", 12.90, 22, "Un vino rosato fresco e succoso a base di uve rosse realizzato dalla cantina Rabasco sita nel territorio collinare del pescarese. Al naso profuma di rosa, melograno e intense sensazioni di frutti di bosco.", 'immagini/24.jpg', 107, 11.5, 75, "Abruzzo (Italia)", 'Vini Rosati', 2018, "---", true),
("Rosato Massa Vecchia 2021", 44.00, 22, "Il Rosato di Massa Vecchia è un meraviglioso vino rosato a base di uve Malvasia Nera e Merlot in grado di esprimere l'anima autentica e tipica delle colline Metallifere dell'Alta Maremma", 'immagini/25.jpg', 37, 14.5, 75, "Toscana (Italia)", 'Vini Rosati', 2021, "Toscana IGT", true),
("Rosé Chateau de Pibarnon 2022", 51.00, 22, "Il Rosé dello Chateau de Pibarnon è un vino rosato dal timbro fragrante, mediterraneo e solare prodotto a Bandol, famosa area di produzione di Rosé della Costa Azzurra. ", 'immagini/26.jpg', 61, 13.5, 75, "Provenza ( Francia )", 'Vini Rosati', 2022, "---", true),
("Primitivo Rosato Doppio Passo 2023", 7.90, 22, "Il Primitivo Rosato Doppio Passo è un vino rosato del Salento che esprime grande freschezza e leggerezza di beva.  All'assaggio è slanciato, gentile e fragrante, con piacevole morbidezza che richiama un nuovo sorso", 'immagini/27.jpg', 56, 12.0, 75, "Puglia (Italia)", 'Vini Rosati', 2023, "Puglia IGT", true),
("Derthona Vigneti Massa 2022", 21.00, 22, "Il Derthona di Vigneti Massa è un vino bianco espressivo e molto territoriale prodotto da uve bianche. Il profilo aromatico è floreale e agrumato, caratterizzato da grande freschezza e mineralità. ", 'immagini/28.jpg', 60, 14.0, 75, "Piemonte ( Italia )", 'Vini Rosati', 2022, "---", true),
("Malvasia Zidarich 2021", 27.50, 22, "La Malvasia di Zidarich è un vino bianco intenso e territoriale, ricco di frutta, spezie ed erbe aromatiche. Viene prodotto in tini aperti con macerazione sulle bucce e matura in botte per 24 mesi. Esprime buona complessità, freschezza e sapidità", 'immagini/29.jpg', 47, 13.0, 75, "Friuli Venezia Giulia ( Italia )", 'Vini Rosati', 2021, "Venezia Giulia IGT", true),
("Coenobium Monastero Trappiste di Vitorchiano 2022", 15.10, 22, "Il Coenobium è un vino bianco fresco, beverino e piacevolmente rustico prodotto dalle monache Trappiste di Vitorchiano da uve bianche tipiche del territorio. Ha un profilo agile e rinfrescante, sapido e minerale con note aromatiche di fieno, erbe di campo, humus e frutta bianca matura. Un inno alla vita cenobitica e comunitaria!", 'immagini/30.jpg', 27, 12.5, 75, "Lazio (Italia)", 'Vini Rosati', 2022, "Lazio IGT", true),
("Chardonnay 'Tesadro' Agricola Mos 2023", 19.50, 22, "Lo Chardonnay 'Tesadro' di Agricola Mos è un vino bianco di buona struttura ed eleganza, affinato qualche mese in barrique nuove e usate per raggiungere la morbidezza e l'aromaticità desiderata dai giovani produttori trentini. ", 'immagini/31.jpg', 65, 12.5, 75, "Trentino ( Italia )", 'Vini Rosati', 2023, "Dolomiti IGT", true);

-- CHAMPAGNE
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
("Champagne Brut 'Vintage' Dom Perignon 2013", 238.00, 22, "Il Dom Perignon Vintage è un grande Champagne, sinonimo di prestigio, lusso ed eleganza. Nasce da un affinamento di almeno 72 mesi sui lieviti in bottiglia e si esprime in un ricco di bouquet di canditi, frutta fresca, note tostate e spezie. ", 'immagini/32.jpg', 20, 12.5, 75, 'Regione Champagne ( Francia )', 'Champagne', 2013, "Champagne AOC", true),
("Champagne Brut Blanc de Blancs Grand Cru 'Moncuit-Delos' Pierre Moncuit",32.40, 22, "Lo Champagne Brut Moncuit-Delos è un elegante Champagne Blanc de Blancs, cioè ottenuto da sole uve di Chardonnay, affinato sui lieviti in bottiglia per 48 mesi. Freschi sentori di mela, brioche e agrumi emergono da un ventaglio aromatico raffinato, complesso e minerale ", 'immagini/33.jpg', 20, 12.0, 75, "Regione Champagne (Francia)", 'Champagne', 2017, "Champagne AOC", true),
("Champagne Brut Grand Cru Boever A&S 2014", 41.00, 22, "Il Brut Grand Cru Pierre Boever è uno Champagne Millesimato prodotto solo nelle annate migliori a partire da uve Chardonnay e Pinot noir in parti uguali. Di grande eleganza e potenza, si distingue al naso per note leggere di miele di acacia e agrumi con un finale finemente speziato di pepe nero. Al palato è minerale, corposo e di lunga persistenza", 'immagini/34.jpg', 40, 12.0, 75, 'Regione Champagne (Francia)', 'Champagne', 2014, "Champagne AOC", true),
("Champagne Brut Grand Cru 'Bastien Thomas' Boever A&S", 36.00, 22, "Il Grand Cru 'Bastien Thomas' di Pierre Boever è uno Champagne prodotto nella zona della Montagne de Reims da uve Chardonnay e Pinot Noir in percentuali uguali, provenienti dalle migliori parcelle della maison. Un Brut elegante ed espressivo che sprigiona al naso avvolgenti note citrine e fruttate e si presenta al palato di buona struttura e persistenza gustativa", 'immagini/35.jpg', 20, 12.0, 75, 'Regione Champagne (Francia)', 'Champagne', 2017, "Champagne AOC", true),
("Champagne Brut Reserve Vieilles Vignes Francis Orban", 50.00, 22, "Lo Champagne Brut Reserve Vieilles Vignes di Francis Orban è uno Champagne a base di uve Pinot Meunier, pienamente espressivo del suo territorio, nel village di Leuvrigny. Si presenta di un colore giallo paglierino dorato con perlage fine", 'immagini/36.jpg', 20, 12.0, 75, 'Regione Champagne (Francia)', 'Champagne', 2017, "Champagne AOC", true);

-- SPUMANTE
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
("Spumante Metodo Classico Extra Brut 'Quattrocento 40 Lune' Nicola Gatta", 33.50, 22, "Il 'Quattrocento' di Nicola Gatta è uno Spumante Metodo Classico che matura sui lieviti per 40 mesi/lune. ", 'immagini/37.jpg', 50, 12.5, 75, 'Lombardia (Italia)', 'Spumanti', 2019, '---', true),
("Prosecco di Valdobbiadene Superiore", 11.50, 22, "descrizione", 'immagini/38.jpg', 50, 11.5, 75, 'Veneto (Italia)', 'Spumanti', 2023, 'Prosecco di V.-C. DOCG', true),
("Brut 'Cuvée dei Frati' Ca' dei Frati", 17.90, 22, "Uno spumante metodo classico a base di Turbiana e Chardonnay che sosta almeno 24 mesi sui lieviti. Il bouquet presenta note biscottate di nocciola, fieno e tabacco stagionato, mentre in bocca è setoso e di bella freschezza", 'immagini/39.jpg', 50, 13.0, 75, 'Lombardia (Italia)', 'Spumanti', 2019, '---', true),
("Trento Spumante Dosaggio Zero Tenuta Volpare 2019", 30.90, 22, "Il Trento Spumante Dosaggio Zero della Tenuta Volpare è uno spumante Metodo Classico a base di Pinot Nero e Chardonnay affinato 26 mesi sui lieviti. Un pas dosé che per questo resta secco ed equilibrato", 'immagini/40.jpg', 50, 12.5, 75, 'Trentino (Italia)', 'Spumanti', 2019, 'Trento DOC', true),
("Prosecco di Valdobbiadene Superiore Extra Dry Col Vetoraz 2023", 14.50, 22, "Il Prosecco Extra-Dry di Col Vetoraz è uno spumante fresco, semplice e beverino, caratterizzato da sentori freschi di mela e pera, da un gusto sottile e delicato, vivacizzato da un perlage fine e cremoso.", 'immagini/41.jpg', 50, 11.5, 75, 'Veneto (Italia)', 'Spumanti', 2023, 'Prosecco di V.-C. DOCG', true),
("Franciacorta Brut Mosnel", 25.00, 22, "Il Franciacorta Brut di Mosnel è uno spumante fresco ed elegante, ricco di sentori fruttati e floreali. Dopo una maturazione di 24 mesi sui lieviti in bottiglia si esprime in un bouquet armonico e piacevole. ", 'immagini/42.jpg', 50, 13.0, 75, 'Lombardia (Italia)', 'Spumanti', 2019, 'Franciacorta DOCG', true);

-- ALTRO
INSERT INTO prodotto (nome, prezzo, iva, descrizione, immagine, stock, alcol, formato, provenienza, tipologia, annata, denominazione, mostra)
VALUES
("Jack Daniel's Tennessee Whiskey", 18.90, 22, "'Old no. 7' è tra i più celebri e apprezzati Whisky Tennesse al mondo, legato al successo di grandi personaggi nel mondo della musica, come Frank Sinatra o Lemmy Kilmister.", 'immagini/43.jpg', 104, 40.0, 70, 'Italia', 'Altro', 2024, 'Whisky', true),
('Lala (Teletubbies)', 44.44, 22, 'Tinky Winky, Dipsy, LALA!!!, Po!', 'immagini/44.jpg', 4444, 44.44, 44, 'Mondo dei Teletubbies', 'Altro', 1997, 'Teletubbies', true),
('Scwarz', 6.66, 22, 'In figura una dività di origine medio-orientale.', 'immagini/45.jpg', 666, 66.6, 66, 'Meme di Faiella', 'Altro', 2000, 'Dachau', true);


-- Inserimento nella tabella `ordine`
INSERT INTO ordine (data_ordine, stato, citta, via, cap, utente)
VALUES
('2024-05-01', 1, 'Firenze', 'Via Roma 10', '50100', 1),
('2024-05-02', 0, 'Torino', 'Via Garibaldi 50', '10100', 2),
('2024-05-03', 2, 'Bologna', 'Via Indipendenza 20', '40100', 2);


-- Inserimento nella tabella `categoria`
INSERT INTO categoria (nome, descrizione)
VALUES
('Vini Rossi', 'Categoria che include tutti i tipi di vini rossi.'),
('Spumanti', 'Categoria che include tutti i tipi di spumanti.'),
('Champagne', 'Categoria che include tutti i tipi di champagne.'),
('Vini Bianchi', 'Categoria che include tutti i tipi di vini bianchi.'),
('Vini Rosati', 'Categoria che include tutti i tipi di vini rosati.'),
('Altro', 'altri prodotti');

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
-- Ordine 4 (Firenze)
(1, 1, 8.50, 22, 2, 'Primitivo Doppio Passo 2022'),
(2, 1, 19.20, 22, 1, "Cannonau 'Mamuthone' Sedilesu"),

-- Ordine 5 (Torino)
(3, 2, 235.00, 22, 1, 'Tignanello Antinori'),
(4, 2, 250.10, 22, 2, "Barolo 'Otin Fiorin - Piè Rupestris' Cappellano"),

-- Ordine 6 (Bologna)
(5, 3, 74.00, 22, 1, 'Kairos Zymé 2019'),
(6, 3, 20.90, 22, 3, 'Insoglio del Cinghiale Campo di Sasso');


-- Inserimento nella tabella `cart_line`
INSERT INTO cart_line (prodotto, utente, quantita, data_aggiunta)
VALUES
(1, 1, 2, '2024-04-19'),
(2, 2, 1, '2024-04-20'),
(3, 3, 1, '2024-04-21'),
(4, 1, 3, '2024-04-19'),
(5, 3, 2, '2024-04-21');
