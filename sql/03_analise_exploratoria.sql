-- Consultas de apresentação para explorar a view integrada.
-- Reorganizadas a partir dos campos utilizados no histórico e no dashboard;
-- não são cópias literais das consultas automáticas do Looker Studio.

-- Total de músicas e chaves distintas
SELECT COUNT(*) AS total_musicas, COUNT(DISTINCT track_id) AS ids_distintos
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`;

-- Top 10 países por streams acumulados (país associado à música, não ao ouvinte)
SELECT main_country, COUNT(*) AS total_musicas, SUM(streams) AS total_streams
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
WHERE main_country IS NOT NULL AND streams IS NOT NULL
GROUP BY main_country ORDER BY total_streams DESC LIMIT 10;

-- Gêneros com mais músicas
SELECT main_music_genre, COUNT(*) AS total_musicas
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
WHERE main_music_genre IS NOT NULL
GROUP BY main_music_genre ORDER BY total_musicas DESC LIMIT 10;

-- Lançamentos por ano na amostra
SELECT released_year, COUNT(*) AS total_musicas
FROM `projeto-spotify-513019.dados_spotify.vw_spotify_integrado`
GROUP BY released_year ORDER BY released_year;
