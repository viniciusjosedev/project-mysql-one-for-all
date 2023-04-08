SELECT
ar.artista AS artista,
CASE
WHEN COUNT(cf.cancoes_id) >= 5 THEN 'A'
WHEN COUNT(cf.cancoes_id) IN (3,4) THEN 'B'
WHEN COUNT(cf.cancoes_id) IN (1, 2) THEN 'C' 
ELSE '-'
END AS 'ranking'
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.albuns al ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.cancoes ca ON ca.album_id = al.album_id
LEFT JOIN SpotifyClone.cancoes_favoritas cf ON cf.cancoes_id = ca.cancoes_id
GROUP BY artista
ORDER BY COUNT(cf.cancoes_id) DESC, artista ASC
;

