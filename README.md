# GitStars

### Tecnologias Usadas

Esta aplicação mobile possui as seguintes tecnologias:
* Flutter
* Arquitetura orientada a pacotes
* Getx Pattern
* Getx (Injeção de Dependência, Gerenciamento de Rotas e Gerenciamento de Estado)
* Get Storage (Persistência de Dados)
* GraphQL

### Tarefas

No Github você pode seguir repositórios de projetos que você achou interessantes e acompanhar o desenvolvimento no seu feed de notícias.
Estrelar um repositório torna mais fácil encontrá-los posteriormente. Você pode ver todos os repositórios que você favoritou indo para sua página de favoritos.
O que não tem no Github, com menos do que 2 cliques, é saber quais são todos os repositórios que um determinado usuário estrelou.
Consumindo a API GraphQL do GitHub, você deve fazer um app com o seguinte funcionamento:
- [ X ] Permita que o usuário busque por nome ou apelido de outro usuário no Github;
- [ X ] Liste os repos estrelados do usuário buscado;
- [ X ] Exiba os  seguintes dados do usuário buscado: nickname, avatar, bio, localização, email e URL;
- [ X ] Exiba os seguintes dados dos repositórios encontrados: nome do repo, descrição e quantidade de favoritos;

### Installation

1. Caso não tenha o flutter instalado, [clique aqui](https://flutter.dev/docs/get-started/install/) e leia sua documentação.
2. Faça o clone do projeto e vá para a pasta raiz.
3. Altere a constante <b>TOKEN</b> em ```lib/core/config.dart``` para sua chave secreta do github
4. Caso não tenha a chave [clique aqui](https://docs.github.com/pt/github/authenticating-to-github/creating-a-personal-access-token) e configure com o escopo ```repo``` e ```user```
5. Execute o comando ```flutter pub get``` para baixar as dependências.
6. Execute o comando ```flutter run```.
