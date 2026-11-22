-- Verificações de integridade, sem alterar dados
SELECT COUNT(*) AS total, COUNT(DISTINCT track_id) AS ids_unicos,
  COUNTIF(streams IS NULL) AS streams_nulos,
  COUNTIF(in_spotify_charts IS NULL) AS charts_nulos,
  COUNTIF(streams < 0) AS streams_negativos
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`;

SELECT COUNT(*) AS total_spotify, COUNT(c.track_id) AS correspondencias,
  COUNTIF(c.track_id IS NULL) AS sem_correspondencia
FROM `projeto-spotify-513019.dados_spotify.Track_in_spotify_final` s
LEFT JOIN `projeto-spotify-513019.dados_spotify.Track_in_competition_final` c
ON s.track_id = c.track_id;
