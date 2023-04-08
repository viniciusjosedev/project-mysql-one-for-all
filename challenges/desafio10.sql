DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(100) NOT NULL,
  valor_plano DECIMAL(6,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(100),
  artista_id INT NOT NULL,
  ano_lancamento CHAR(4) NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
  cancoes VARCHAR(100) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)  
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_pessoa_usuaria VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  data_assinatura DATETIME,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
  pessoa_usuaria_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  FOREIGN KEY(pessoa_usuaria_id) REFERENCES usuarios(pessoa_usuaria_id), 
  FOREIGN KEY(cancoes_id) REFERENCES cancoes(cancoes_id), 
  PRIMARY KEY(pessoa_usuaria_id, cancoes_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_artistas(
  pessoa_usuaria_id INT NOT NULL,
  artista_id INT,
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES usuarios(pessoa_usuaria_id),
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
	PRIMARY KEY(pessoa_usuaria_id, artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes_favoritas(
	pessoa_usuaria_id INT NOT NULL,
	cancoes_id INT NOT NULL,
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES usuarios(pessoa_usuaria_id),
	FOREIGN KEY (cancoes_id) REFERENCES cancoes(cancoes_id),
	PRIMARY KEY (pessoa_usuaria_id, cancoes_id)
);

INSERT INTO SpotifyClone.plano(plano, valor_plano)
VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO SpotifyClone.artista(artista) 
VALUES 
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.albuns(album, artista_id, ano_lancamento) 
VALUES 
('Renaissance', 1, 2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.cancoes(cancoes, duracao_segundos, album_id) 
VALUES 
('BREAK MY SOUL', 279, 1),
("VIRGO'S GROOVE", 369, 1),
("ALIEN SUPERSTAR", 116, 1),
("Don't Stop Me Now", 203, 2),
("Under Pressure", 152, 3),
("Como Nossos Pais", 105, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 5),
("Samba em Paris", 267, 6),
("The Bard's Song", 244, 7),
("Feeling Good", 100, 8);

INSERT INTO SpotifyClone.usuarios(nome_pessoa_usuaria, idade, data_assinatura, plano_id)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.historico(pessoa_usuaria_id, cancoes_id, data_reproducao)
VALUES 
(1, 8, "2022-02-28 10:45:55"),
(1, 2,  "2020-05-02 05:30:35"),
(1, 10, "2020-03-06 11:22:33"),
(2, 10, "2022-08-05 08:05:17"),
(2, 7, "2020-01-02 07:40:33"),
(3, 10, "2020-11-13 16:55:13"),
(3, 2, "2020-12-05 18:38:30"),
(4, 8, "2021-08-15 17:10:10"),
(5, 8, "2022-01-09 01:44:33"),
(5, 5, "2020-08-06 15:23:43"),
(6, 7, "2017-01-24 00:31:17"),
(6, 1,  "2017-10-12 12:35:20"),
(7, 4, "2011-12-15 22:30:49"),
(8, 4, "2012-03-17 14:56:41"),
(9, 9, "2022-02-24 21:14:22"),
(10, 3, "2015-12-13 08:30:22");

INSERT INTO SpotifyClone.usuarios_artistas(pessoa_usuaria_id, artista_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);

INSERT INTO SpotifyClone.cancoes_favoritas(pessoa_usuaria_id, cancoes_id)
VALUES
(1, 3),
(1, 6),
(1, 10),
(2, 4),
(3, 1),
(3, 3),
(4, 7),
(4, 4),
(5, 10),
(5, 2),
(8, 4),
(9, 7),
(10, 3)
;

