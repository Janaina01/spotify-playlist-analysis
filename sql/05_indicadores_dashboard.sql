-- Indicadores recuperados do histórico BigQuery.

-- Comparação de médias: músicas nos charts x fora dos charts
SELECT
  CASE
    WHEN in_spotify_charts > 0
      THEN 'Presente nos charts'
    ELSE 'Fora dos charts'
  END AS situacao_charts,
  COUNT(*) AS total_musicas,
  ROUND(AVG(streams), 0) AS media_streams
FROM `projeto-spotify-513019.dados_spotify.Track_in_spotify_final`
WHERE streams IS NOT NULL
  AND in_spotify_charts IS NOT NULL
GROUP BY situacao_charts;

-- ATENÇÃO: o próximo comando recria uma tabela.
-- Tabela KPI de correlações
CREATE OR REPLACE TABLE
  `projeto-spotify-513019.dados_spotify.kpi_correlacoes`
AS
SELECT
  CORR(
    SAFE_CAST(in_spotify_playlists AS FLOAT64),
    CAST(streams AS FLOAT64)
  ) AS correlacao_spotify,

  CORR(
    CAST(in_apple_playlists AS FLOAT64),
    CAST(streams AS FLOAT64)
  ) AS correlacao_apple,

  CORR(
    CAST(in_deezer_playlists AS FLOAT64),
    CAST(streams AS FLOAT64)
  ) AS correlacao_deezer

FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`;

