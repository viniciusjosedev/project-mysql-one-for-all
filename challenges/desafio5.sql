SELECT c.cancoes AS cancao, COUNT(h.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes c INNER JOIN SpotifyClone.historico h
ON c.cancoes_id = h.cancoes_id
GROUP BY c.cancoes, h.cancoes_id
ORDER BY reproducoes DESC, cancao
LIMIT 2; 



