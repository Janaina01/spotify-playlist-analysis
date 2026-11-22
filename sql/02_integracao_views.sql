-- Criação de views: comandos alteram objetos do dataset.

-- Spotify limpo
CREATE OR REPLACE VIEW
  `projeto-spotify-513019.dados_spotify.vw_spotify_clean`
AS
SELECT *
FROM `projeto-spotify-513019.dados_spotify.Track_in_spotify_final`;

-- Concorrentes limpos
CREATE OR REPLACE VIEW
  `projeto-spotify-513019.dados_spotify.vw_competition_clean`
AS
SELECT *
FROM `projeto-spotify-513019.dados_spotify.Track_in_competition_final`;

-- Integração por track_id
-- EP02 | Integração das tabelas
-- JOIN entre Spotify e Competition

CREATE OR REPLACE VIEW
  `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
AS

SELECT
  s.*,
  c.* EXCEPT(track_id)

FROM
  `projeto-spotify-513019.dados_spotify.vw_spotify_clean` AS s

LEFT JOIN
  `projeto-spotify-513019.dados_spotify.vw_competition_clean` AS c

ON s.track_id = c.track_id;

