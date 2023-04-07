SELECT 
	ar.artista AS artista, 
	al.album AS album
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.albuns al
ON ar.artista_id = al.artista_id
HAVING artista = 'Elis Regina'
ORDER BY album
;