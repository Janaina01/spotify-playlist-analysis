-- Consultas analíticas recuperadas do histórico; não modificam tabelas.
-- Em todas as análises entre plataformas, streams refere-se ao Spotify.

-- Spotify playlists x streams
SELECT
  CORR(
    SAFE_CAST(in_spotify_playlists AS FLOAT64),
    CAST(streams AS FLOAT64)
  ) AS correlacao_playlists_streams
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
WHERE
  SAFE_CAST(in_spotify_playlists AS FLOAT64) IS NOT NULL
  AND streams IS NOT NULL;

-- Spotify playlists x streams sem valores acima do P99
WITH dados AS (
  SELECT
    SAFE_CAST(in_spotify_playlists AS FLOAT64) AS playlists,
    CAST(streams AS FLOAT64) AS streams
  FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
),
limite AS (
  SELECT
    APPROX_QUANTILES(streams, 100)[OFFSET(99)] AS p99
  FROM dados
  WHERE playlists IS NOT NULL
    AND streams IS NOT NULL
)
SELECT
  CORR(playlists, streams) AS correlacao_sem_extremos
FROM dados
CROSS JOIN limite
WHERE playlists IS NOT NULL
  AND streams IS NOT NULL
  AND streams <= p99;

-- Streams Spotify x playlists Apple/Deezer
SELECT
  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_apple_playlists AS FLOAT64)
  ) AS correlacao_spotify_apple,

  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_deezer_playlists AS FLOAT64)
  ) AS correlacao_spotify_deezer

FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
WHERE streams IS NOT NULL;

-- Playlists entre plataformas
SELECT
  CORR(
    SAFE_CAST(in_spotify_playlists AS FLOAT64),
    SAFE_CAST(in_apple_playlists AS FLOAT64)
  ) AS correlacao_playlists_spotify_apple,

  CORR(
    SAFE_CAST(in_spotify_playlists AS FLOAT64),
    SAFE_CAST(in_deezer_playlists AS FLOAT64)
  ) AS correlacao_playlists_spotify_deezer,

  CORR(
    SAFE_CAST(in_apple_playlists AS FLOAT64),
    SAFE_CAST(in_deezer_playlists AS FLOAT64)
  ) AS correlacao_playlists_apple_deezer

FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`;

-- Streams Spotify x presença nos charts
SELECT
  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_spotify_charts AS FLOAT64)
  ) AS correlacao_spotify,

  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_apple_charts AS FLOAT64)
  ) AS correlacao_apple,

  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_deezer_charts AS FLOAT64)
  ) AS correlacao_deezer,

  CORR(
    CAST(streams AS FLOAT64),
    CAST(in_shazam_charts AS FLOAT64)
  ) AS correlacao_shazam

FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
WHERE streams IS NOT NULL;

