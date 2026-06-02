CREATE VERTEX TYPE Movie IF NOT EXISTS
CREATE VERTEX TYPE Actor IF NOT EXISTS
CREATE VERTEX TYPE Director IF NOT EXISTS
CREATE VERTEX TYPE Genre IF NOT EXISTS
CREATE VERTEX TYPE User IF NOT EXISTS
CREATE EDGE TYPE MovieDirector IF NOT EXISTS
CREATE EDGE TYPE HasGenre IF NOT EXISTS
CREATE EDGE TYPE ActedIn IF NOT EXISTS
CREATE EDGE TYPE Watch IF NOT EXISTS
CREATE EDGE TYPE Recommendation IF NOT EXISTS

INSERT INTO Movie SET title = 'A Espera de um Milagre', year = 1999
INSERT INTO Movie SET title = 'Deu a Louca na Chapeuzinho', year = 2005
INSERT INTO Movie SET title = 'Carol', year = 2015
INSERT INTO Movie SET title = 'O Poderoso Chefão', year = 1972
INSERT INTO Movie SET title = 'Coraline e o Mundo Secreto', year = 2009
INSERT INTO Movie SET title = 'Cidade de Deus', year = 2002
INSERT INTO Movie SET title = 'A Hora da Estrela', year = 1985
INSERT INTO Movie SET title = 'Central do Brasil', year = 1998
INSERT INTO Movie SET title = 'Deus e o Diabo na Terra do Sol', year = 1964
INSERT INTO Movie SET title = 'Turma da Mônica em Cinegibi, O Filme', year = 2004

INSERT INTO Actor (name_actor, nationality) VALUES
('Michael Clarke Duncan', 'Estadunidense'),
('Tom Hanks', 'Estadunidense'),
('David Morse', 'Estadunidense')

INSERT INTO Actor (name_actor, nationality) VALUES 
('Cory Edwards', 'Estadunidense'),
('Anne Hathaway', 'Estadunidense'),
('Patrick Warburton', 'Estadunidense')

INSERT INTO Actor (name_actor, nationality) VALUES 
('Cate Blanchett', 'Australiana'),
('Rooney Mara', 'Estadunidense'),
('Sarah Paulson', 'Estadunidense')

INSERT INTO Actor (name_actor, nationality) VALUES
('Al Pacino', 'Estadunidense'),
('Marlon Brando.Jr', 'Estadunidense'),
('James Caan', 'Estadunidense'),
('Diane Keaton', 'Estadunidense'),
('Talia Shire', 'Estadunidense')

INSERT INTO Actor (name_actor, nationality) VALUES
('Dakota Fanning', 'Estadunidense'),
('Teri Hatcher', 'Estadunidense'),
('Jennifer Saunders', 'Inglesa'),
('Ian McShane', 'Ingles'),
('Dawn French', 'Inglesa')

INSERT INTO Actor (name_actor, nationality) VALUES
('Alice Braga', 'Brasileira'),
('Alexandre Rodrigues', 'Brasileiro'),
('Douglas Silva', 'Brasileiro'),
('Phellipe Haagensen', 'Brasileiro'),
('Darlan Cunha', 'Brasileiro'),
('Seu Jorge', 'Brasileiro')

INSERT INTO Actor (name_actor, nationality) VALUES
('Marcélia Cartaxo', 'Brasileira'),
('José Dumont', 'Brasileiro'),
('Fernanda Montenegro', 'Brasileira'),
('Tamara Taxman', 'Estadunidense'),
('Umberto Magnani', 'Brasileiro'),
('Sônia Guedes', 'Brasileira'),
('Lizette Negreiros', 'Brasileira')

INSERT INTO Actor (name_actor, nationality) VALUES
('Fernanda Montenegro', 'Brasileira'),
('Vinícius de Oliveira', 'Brasileiro'),
('Marília Pêra', 'Brasileira'),
('Soia Lira', 'Brasileira'),
('Othon Bastos', 'Brasileiro')

INSERT INTO Actor (name_actor, nationality) VALUES
('Geraldo Del Rey', 'Brasileiro'),
('Lidio Silva', 'Brasileiro'),
('Othon Bastos', 'Brasileiro'),
('Yoná Magalhães', 'Brasileira'),
('Sonia Dos Humildes', 'Brasileira')

INSERT INTO Actor (name_actor, nationality) VALUES
('Paulo Cavalcante', 'Brasileiro'),
('Elza Gonçalves', 'Brasileira'),
('Fernanda Lima', 'Brasileira'),
('Sibele Toledo', 'Brasileira'),
('Marli Bortoletto', 'Brasileira')

INSERT INTO Director SET name_director = 'Frank Darabont', nationality = 'Frances'
INSERT INTO Director SET name_director = 'Cory Edwards', nationality = 'Estadunidense'
INSERT INTO Director SET name_director = 'Todd Haynes', nationality = 'Estadunidense'
INSERT INTO Director SET name_director = 'Francis Ford Coppola', nationality = 'Estadunidense'
INSERT INTO Director SET name_director = 'Henry Selick', nationality = 'Estadunidense'
INSERT INTO Director SET name_director = 'Fernando Meirelles', nationality = 'Brasileiro'
INSERT INTO Director SET name_director = 'Kátia Lund', nationality = 'Brasileira'
INSERT INTO Director SET name_director = 'Suzana Amaral', nationality = 'Brasileira'
INSERT INTO Director SET name_director = 'Walter Salles', nationality = 'Brasileiro'
INSERT INTO Director SET name_director = 'Glauber Rocha', nationality = 'Brasileiro'
INSERT INTO Director SET name_director = 'José Márcio Nicolosi', nationality = 'Brasileiro'

INSERT INTO Genre SET name_genre = 'Drama'
INSERT INTO Genre SET name_genre = 'Fantasia'
INSERT INTO Genre SET name_genre = 'Policial'
INSERT INTO Genre SET name_genre = 'Misterio'
INSERT INTO Genre SET name_genre = 'Animação'
INSERT INTO Genre SET name_genre = 'Comédia'
INSERT INTO Genre SET name_genre = 'Romance'
INSERT INTO Genre SET name_genre = 'Suspense infantil'
INSERT INTO Genre SET name_genre = 'Terror infantil'
INSERT INTO Genre SET name_genre = 'Máfia'

INSERT INTO User SET username = 'Maria Silva', email = 'mariasilva@email.com'
INSERT INTO User SET username = 'João da Costa', email = 'joaocosta@email.com'
INSERT INTO User SET username = 'Ana Souza', email = 'anasouza@email.com'
INSERT INTO User SET username = 'José Miguel Pinheiro', email = 'josepinheiro@email.com'

CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'A Espera de um Milagre') TO(SELECT FROM Director WHERE name_director = 'Frank Darabont')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho') TO(SELECT FROM Director WHERE name_director = 'Cory Edwards')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Carol') TO(SELECT FROM Director WHERE name_director = 'Todd Haynes')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'O Poderoso Chefão') TO(SELECT FROM Director WHERE name_director = 'Francis Ford Coppola')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto') TO(SELECT FROM Director WHERE name_director = 'Henry Selick')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Cidade de Deus') TO(SELECT FROM Director WHERE name_director = 'Fernando Meirelles')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Cidade de Deus') TO(SELECT FROM Director WHERE name_director = 'Kátia Lund')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'A Hora da Estrela') TO(SELECT FROM Director WHERE name_director = 'Suzana Amaral')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Central do Brasil') TO(SELECT FROM Director WHERE name_director = 'Walter Salles')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol') TO(SELECT FROM Director WHERE name_director = 'Glauber Rocha')
CREATE EDGE MovieDirector FROM(SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme') TO(SELECT FROM Director WHERE name_director = 'José Márcio Nicolosi')

CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'A Espera de um Milagre') TO (SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'A Espera de um Milagre') TO (SELECT FROM Genre WHERE name_genre = 'Fantasia')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'A Espera de um Milagre') TO (SELECT FROM Genre WHERE name_genre = 'Policial')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho') TO (SELECT FROM Genre WHERE name_genre = 'Animação')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho') TO (SELECT FROM Genre WHERE name_genre = 'Comédia')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Carol') TO(SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Carol') TO(SELECT FROM Genre WHERE name_genre = 'Romance')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'O Poderoso Chefão') TO (SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'O Poderoso Chefão') TO (SELECT FROM Genre WHERE name_genre = 'Policial')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'O Poderoso Chefão') TO (SELECT FROM Genre WHERE name_genre = 'Máfia')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto') TO(SELECT FROM Genre WHERE name_genre = 'Animação')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto') TO(SELECT FROM Genre WHERE name_genre = 'Fantasia')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto') TO(SELECT FROM Genre WHERE name_genre = 'Suspense infantil')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto') TO(SELECT FROM Genre WHERE name_genre = 'Terror infantil')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Cidade de Deus') TO(SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Cidade de Deus') TO(SELECT FROM Genre WHERE name_genre = 'Policial')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'A Hora da Estrela') TO(SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'A Hora da Estrela') TO(SELECT FROM Genre WHERE name_genre = 'Comédia')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Central do Brasil') TO(SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol') TO(SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE HasGenre FROM (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme') TO(SELECT FROM Genre WHERE name_genre = 'Animação')

CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Michael Clarke Duncan') TO (SELECT FROM Movie WHERE title = 'A Espera de um Milagre')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Tom Hanks') TO (SELECT FROM Movie WHERE title = 'A Espera de um Milagre')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'David Morse') TO (SELECT FROM Movie WHERE title = 'A Espera de um Milagre')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Cory Edwards') TO (SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Anne Hathaway') TO (SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Patrick Warburton') TO (SELECT FROM Movie WHERE title = 'Deu a Louca na Chapeuzinho')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Cate Blanchett') TO (SELECT FROM Movie WHERE title = 'Carol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Rooney Mara') TO (SELECT FROM Movie WHERE title = 'Carol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Sarah Paulson') TO (SELECT FROM Movie WHERE title = 'Carol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Al Pacino') TO (SELECT FROM Movie WHERE title = 'O Poderoso Chefão')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Marlon Brando.Jr') TO (SELECT FROM Movie WHERE title = 'O Poderoso Chefão')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'James Caan') TO (SELECT FROM Movie WHERE title = 'O Poderoso Chefão')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Diane Keaton') TO (SELECT FROM Movie WHERE title = 'O Poderoso Chefão')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Talia Shire') TO (SELECT FROM Movie WHERE title = 'O Poderoso Chefão')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Dakota Fanning') TO (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Teri Hatcher') TO (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Jennifer Saunders') TO (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Ian McShane') TO (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Dawn French') TO (SELECT FROM Movie WHERE title = 'Coraline e o Mundo Secreto')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Alice Braga') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Alexandre Rodrigues') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Douglas Silva') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Phellipe Haagensen') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Darlan Cunha') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Seu Jorge') TO (SELECT FROM Movie WHERE title = 'Cidade de Deus')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Marcélia Cartaxo') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'José Dumont') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Fernanda Montenegro') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Tamara Taxman') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Umberto Magnani') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Sônia Guedes') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Lizette Negreiros') TO (SELECT FROM Movie WHERE title = 'A Hora da Estrela')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Fernanda Montenegro') TO (SELECT FROM Movie WHERE title = 'Central do Brasil')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Vinícius de Oliveira') TO (SELECT FROM Movie WHERE title = 'Central do Brasil')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Marília Pêra') TO (SELECT FROM Movie WHERE title = 'Central do Brasil')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Soia Lira') TO (SELECT FROM Movie WHERE title = 'Central do Brasil')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Othon Bastos') TO (SELECT FROM Movie WHERE title = 'Central do Brasil')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Geraldo Del Rey') TO (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Lidio Silva') TO (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Othon Bastos') TO (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Yoná Magalhães') TO (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Sonia Dos Humildes') TO (SELECT FROM Movie WHERE title = 'Deus e o Diabo na Terra do Sol')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Paulo Cavalcante') TO (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Elza Gonçalves') TO (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Fernanda Lima') TO (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Sibele Toledo') TO (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme')
CREATE EDGE ActedIn FROM (SELECT FROM Actor WHERE name_actor = 'Marli Bortoletto') TO (SELECT FROM Movie WHERE title = 'Turma da Mônica em Cinegibi, O Filme')

CREATE EDGE Recommendation FROM (SELECT FROM User WHERE username = 'João da Costa') TO (SELECT FROM Genre WHERE name_genre = 'Drama')
CREATE EDGE Recommendation FROM (SELECT FROM User WHERE username = 'Ana Souza') TO (SELECT FROM Genre WHERE name_genre = 'Animação')

#Pesquisa no site do ArcadeDB
SELECT FROM HasGenre LIMIT 100


