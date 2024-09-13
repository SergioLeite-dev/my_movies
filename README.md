# My Movies

## O que é?

My Movies é um aplicativo desenvolvido em Flutter que exibe os filmes em alta de acordo com as APIs do [The Movie DB](https://www.themoviedb.org/). Também é possível pesquisar por filmes e séries e alternar entre essas listas de maneira altamente performática.

## Funcionalidades Principais:

- Lista de Filmes e Séries em Alta hoje.
- Em alta essa semana.
- Busca Por Filmes e Séries.
- Infinite Scroll: Ao chegar ao final de qualquer uma das listas (em alta hoje / essa semana / pesquisa) a respectiva API é chamada novamente e popula a lista com dados novos. Esses dados não são perdidos ao trocar de lista.
- Back to Top: Um botão aparece ao percorrer uma certa distância na lista, trazendo o usuário de volta ao topo com uma animação.
- Desempenho: Ao trocar de uma lista para outra, você não perde os dados da lista anterior, evitando desperdício de chamadas em API.

## Pontos Técnicos:

- Flutter & Dart.
- Arquitetura MVC Modular.
- Gerenciamento de Estado, Injeção de Dependência e Navegação usando GetX.
- Requisição e Resposa de APIs devidamente modeladas.
- Null Safety.
- Apenas duas dependências: Get e Dio.

## O que está faltando?

- Página com detalhes de cada Filme.
- Testes.
- Versão Web.

## Como executar o projeto?

1. Configure o ambiente Flutter no seu computador, seguindo a [documentação](https://docs.flutter.dev/get-started/install).
2. Confira sua instalação com o comando `flutter doctor -v`.
3. Clone este repositório.
4. No diretório local do projeto, execute os comandos `flutter clean` seguido de `flutter pub get`.
5. Execute o projeto utilizando o método de sua preferência.
