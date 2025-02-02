![N|Solid](logo_ioasys.png)

# Desafio Pessoa Desenvolvedora Flutter

## Implementação telas principais

![Overview1](screenshots/screens_1.png)


## Implementação Busca

![Overview2](screenshots/screens_2.png)

## Seja um testador

Todos os releases dessa aplicação são assinados no processo de CI/CD e enviados via firebase app distribution para os testadores.
Se você quiser ser um testador, cadastre-se no link: https://appdistribution.firebase.dev/i/5dc844e5628089d7

## CI/CD

Os testes unitários e releases são controlados em regime de CI/CD. Mais detalhes podem ser acessados em:
https://github.com/BrunoGiacoboPinto/ioasys/actions

## Gerenciamento do projeto

O projeto foi gerenciado usando os projetos do Github, por meio de issues e pull requests. mais detalhes
podem ser acessados em: https://github.com/BrunoGiacoboPinto/ioasys/projects/1

## Timeline de releases

Todos os releases e versões são gerados automaticamente. Para observar o andamento e diferenciação entre esses releases, basta acessar o link:
https://github.com/BrunoGiacoboPinto/ioasys/releases


## 🏗  O que fazer?
Você deve fazer um fork deste repositório, criar o código e ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso, nós iremos avaliar e retornar por e-mail o resultado do seu teste.

## 📱Escopo de projeto
Deve ser criado um aplicativo em Flutter com as seguintes especificações:

* Login e acesso de Usuário já registrado
    * Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
    * Para ter acesso as demais APIS precisamos enviar esses 3 custom headers para a API autorizar a requisição;
* Busca de Empresas
* Listagem de Empresas
* Detalhamento de Empresas

**Sinta-se a vontade para:**

* Escolher a arquitetura e padrões utilizados
* Usar ou não usar bibliotecas
* Escolher a ferramenta/padrão para gerenciamento de estado (Bloc, Mobx, Redux etc.)
* Complementar ou alterar layout e/ou funcionalidades para **INCREMENTAR** o projeto, não negligenciando os requisitos citados no escopo.

## 🕵 Itens a serem avaliados
Pense no desafio como uma oportunidade de mostrar todo o seu conhecimento. Independente de onde conseguiu chegar no teste, é importante disponibilizar sua implementação para analisarmos.

* Tratamento de validações, *edge cases* e erros 
* Estrutura e organização do projeto
* Integração com as APIs
* Manutebilidade e testabilidade do seu código
* Estruturação de layout e fluxo de aplicação
* Utilização de código limpo e princípios SOLID
* Boas práticas do Dart e do Flutter
* Boas práticas de UI alinhadas com as plataforma nativas
* Gerenciamento de estado dos Widgets


## 🎁 Extras
Estes itens não são obrigatórios, porém desejáveis.

* Testes unitários
* Testes de UI
* Modularização
* Aplicação tanto para iOS como para Android
* Injeção de Dependências (Provider, GetIt etc)


## 🚨 Informações Importantes
* Layout e recortes disponíveis no Figma (http://bit.ly/testeios)
* Você deve fazer um cadastro no Figma para ter acesso ao layout.
* Integração disponível a partir de uma collection para Postman (https://www.getpostman.com/apps) disponível neste repositório.

## Dados para Teste
* Servidor: https://empresas.ioasys.com.br/api
* Versão da API: v1
* Usuário de Teste: testeapple@ioasys.com.br
* Senha de Teste : 12341234