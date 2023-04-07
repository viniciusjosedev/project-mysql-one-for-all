SELECT u.nome_pessoa_usuaria AS pessoa_usuaria, IF(YEAR(MAX(h.data_reproducao)) >= 2021, 'Ativa', 'Inativa')  AS status_pessoa_usuaria
FROM SpotifyClone.usuarios u INNER JOIN SpotifyClone.historico h 
ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria; 

