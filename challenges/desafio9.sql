SELECT COUNT(h.pessoa_usuaria_id) AS musicas_no_historico
FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.usuarios u
ON h.pessoa_usuaria_id = u.pessoa_usuaria_id
WHERE u.nome_pessoa_usuaria = 'Barbara Liskov'
;

