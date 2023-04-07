SELECT COUNT(c.cancoes_id) AS cancoes, COUNT(ar.artista_id) AS artistas, COUNT(al.album) AS albuns
FROM SpotifyClone.cancoes c
LEFT JOIN SpotifyClone.albuns al
ON c.cancoes_id = al.album_id
LEFT JOIN SpotifyClone.artista ar
ON al.album_id = ar.artista_id;


