SELECT
  CASE
    WHEN u.idade <= 30 THEN 'Até 30 anos'
    WHEN u.idade > 30 AND u.idade <= 60 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT u.pessoa_usuaria_id) AS total_pessoas_usuarias,
  COUNT(cf.cancoes_id) AS total_favoritadas
FROM SpotifyClone.usuarios u
LEFT JOIN SpotifyClone.cancoes_favoritas cf ON u.pessoa_usuaria_id = cf.cancoes_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria
;
  

