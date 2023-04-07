SELECT 
  ar.artista AS artista,
  al.album AS album,
  COUNT(ua.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.albuns al
ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.usuarios_artistas ua
ON al.artista_id = ua.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album
;

