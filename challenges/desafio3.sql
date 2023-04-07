SELECT u.nome_pessoa_usuaria AS pessoa_usuaria, COUNT(h.pessoa_usuaria_id) AS musicas_ouvidas,
ROUND(SUM(c.duracao_segundos)/60, 2) AS total_minutos
FROM SpotifyClone.usuarios u
INNER JOIN SpotifyClone.historico h
ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
INNER JOIN SpotifyClone.cancoes c
ON c.cancoes_id = h.cancoes_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria;








