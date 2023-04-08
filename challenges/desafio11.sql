SELECT 
	al.album AS album,
    COUNT(cf.cancoes_id) AS favoritadas
FROM SpotifyClone.albuns al
INNER JOIN SpotifyClone.cancoes c ON c.album_id = al.album_id
INNER JOIN SpotifyClone.cancoes_favoritas cf ON cf.cancoes_id = c.cancoes_id
GROUP BY album
ORDER BY favoritadas DESC, album
LIMIT 3
; 
