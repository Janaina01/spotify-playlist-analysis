-- Scripts recuperados do histórico do BigQuery. ATENÇÃO: comandos CREATE OR REPLACE alteram objetos.
-- Execute apenas em ambiente próprio e após revisar o destino.

-- 01 | Remover duplicatas exatas (Spotify)
CREATE OR REPLACE TABLE
  `projeto-spotify-513019.dados_spotify.Track_in_spotify_clean` AS

SELECT DISTINCT *
FROM `projeto-spotify-513019.dados_spotify.Track_in_spotify`;

-- 02 | Padronizar Spotify
-- KAN-20 | Limpeza consolidada Spotify
-- Origem: tabela com duplicatas exatas removidas

CREATE OR REPLACE TABLE
  `projeto-spotify-513019.dados_spotify.Track_in_spotify_final`
AS

SELECT * REPLACE (

  -- Padronização da chave
  CAST(track_id AS STRING) AS track_id,

  -- Padronização de gêneros
  CASE
    WHEN main_music_genre IN ('Disco pop', 'Disco-pop')
      THEN 'Disco-pop'
    ELSE main_music_genre
  END AS main_music_genre,

  -- Padronização de países
  CASE
    WHEN main_country = 'MX' THEN 'Mexico'
    WHEN main_country = 'PR' THEN 'Puerto Rico'
    WHEN main_country = 'USA' THEN 'United States'
    ELSE main_country
  END AS main_country,

  -- Streams não podem ser negativos
  CASE
    WHEN streams < 0 THEN NULL
    ELSE streams
  END AS streams,

  -- Conversão de playlists para INTEGER
  SAFE_CAST(in_spotify_playlists AS INT64)
    AS in_spotify_playlists

)
FROM
  `projeto-spotify-513019.dados_spotify.Track_in_spotify_clean`;

-- 03 | Padronizar concorrentes
-- KAN-20 | Preparação consolidada Competition

CREATE OR REPLACE TABLE
  `projeto-spotify-513019.dados_spotify.Track_in_competition_final`
AS

SELECT * REPLACE (
  TRIM(track_id) AS track_id
)
FROM
  `projeto-spotify-513019.dados_spotify.Track_in_competition`;

