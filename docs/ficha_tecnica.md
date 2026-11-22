# Ficha técnica — Spotify | Playlists e desempenho musical

**Objetivo:** investigar associações entre presença em playlists, charts e streams acumulados no Spotify para subsidiar hipóteses de curadoria musical.

## Fontes e ferramentas
- BigQuery: `projeto-spotify-513019.dados_spotify`
- Fontes finais: `Track_in_spotify_final` (839 registros) e `Track_in_competition_final` (953 registros)
- Integração: `vw_spotify_integrado`, com `LEFT JOIN` em `track_id` (839 registros)
- Visualização: Data Studio; gestão e documentação: Jira/Confluence

## Etapas
1. Remoção de duplicatas exatas e padronização de tipos/categorias.
2. Integração entre Spotify e concorrentes por identificador.
3. Análise exploratória por país, gênero e ano de lançamento.
4. Correlações de Pearson e comparação de médias de streams por presença nos charts.
5. Dashboard executivo.

## Resultados documentados
- Spotify playlists × streams Spotify: **r ≈ 0,7882**.
- Apple Music playlists × streams Spotify: **r ≈ 0,7748**.
- Deezer playlists × streams Spotify: **r ≈ 0,5990**.
- Músicas nos charts Spotify: média ≈ **663 milhões** de streams (473 faixas).
- Músicas fora dos charts: média ≈ **372,8 milhões** (361 faixas).
- A média do primeiro grupo foi aproximadamente **77,8% maior**.

## Limitações
Correlação não demonstra causalidade. Não há informações suficientes sobre investimento em curadoria editorial, tipo de playlist ou evolução temporal dos streams para estimar retorno financeiro. Os dados são uma amostra, não todo o catálogo. A comparação dos charts usa 834 registros válidos.

## Rastreabilidade
- [KAN-11 — Gráficos e correlações](https://janaina-plab.atlassian.net/browse/KAN-11)
- [KAN-24 — Correlações](https://janaina-plab.atlassian.net/browse/KAN-24)
- [KAN-25 — Perguntas de negócio](https://janaina-plab.atlassian.net/browse/KAN-25)
