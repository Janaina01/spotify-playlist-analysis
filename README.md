# Spotify | Playlists e desempenho musical 🎧

Projeto desenvolvido no módulo de dados durante curso de capacitação na **Laboratoria**, investigando a relação entre presença de músicas em playlists, rankings e volume de streams no Spotify.

## Pergunta de negócio

**Músicas presentes em mais playlists apresentam mais streams?** Como essa relação varia entre plataformas e entre músicas presentes ou ausentes dos charts?

## Principais resultados

|Indicador|Resultado|
|-|-:|
|Músicas analisadas|839|
|Correlação playlists Spotify × streams Spotify|0,7882|
|Correlação playlists Apple Music × streams Spotify|0,7748|
|Correlação playlists Deezer × streams Spotify|0,5990|
|Diferença na média de streams: nos charts vs fora|+77,8%|

**Interpretação:** há associações positivas entre presença em playlists e streams acumulados, mas esses resultados **não comprovam causalidade nem mensuram o retorno da curadoria editorial**.

## Tecnologias

`SQL` · `Google BigQuery` · `Looker Studio` · `Jira` · `Confluence`

## Etapas do projeto

1. Exploração, identificação de nulos e duplicatas.
2. Preparação e padronização de dados.
3. Integração de tabelas por `track\\\_id`.
4. Análise exploratória e correlações de Pearson.
5. Construção de dashboard executivo.

## Estrutura

* [`sql/01\\\_preparacao\\\_dados.sql`](sql/01_preparacao_dados.sql): limpeza e padronização originais.
* [`sql/02\\\_integracao\\\_views.sql`](sql/02_integracao_views.sql): criação de views e JOIN.
* [`sql/03\\\_analise\\\_exploratoria.sql`](sql/03_analise_exploratoria.sql): consultas legíveis para explorar a amostra.
* [`sql/04\\\_correlacoes.sql`](sql/04_correlacoes.sql): correlações recuperadas do histórico.
* [`sql/05\\\_indicadores\\\_dashboard.sql`](sql/05_indicadores_dashboard.sql): comparação dos charts e tabela de KPIs.
* [`sql/06\\\_validacoes.sql`](sql/06_validacoes.sql): verificações de integridade.
* [`docs/ficha\\\_tecnica.md`](docs/ficha_tecnica.md): metodologia, resultados e limitações.

## Dashboard

**https://datastudio.google.com/u/0/reporting/d1a84072-af82-44c5-b6d8-b8ee2670ac36/page/p\_5ytt46n88d**

!\[Dashboard executivo](assets/dashboard.png)

## Como reproduzir

As consultas usam o projeto `projeto-spotify-513019` e o dataset `dados\\\_spotify`. Para reproduzir em outro ambiente, ajuste os identificadores e disponibilize as tabelas de origem conforme as permissões de uso dos dados. **Atenção:** scripts `CREATE OR REPLACE` substituem objetos existentes; não execute sem revisar o destino.

## Limitações

A análise usa streams acumulados do Spotify mesmo quando compara playlists de outras plataformas. Não distingue playlists editoriais, algorítmicas ou de usuários e não contém custos de curadoria nem séries temporais. Portanto, as conclusões são descritivas e associativas.

## Documentação de acompanhamento

* [Jira — Análises e correlações](https://janaina-plab.atlassian.net/browse/KAN-11)

