
# Frontend do Chatbot em Vue.js

Este repositório contém o frontend de um chatbot implementado em **Vue.js**. O projeto é separado do backend do Rasa e se conecta com ele via API para exibir o chat no navegador.

## Requisitos

Antes de rodar o projeto, você precisa ter o **Docker** e o **Docker Compose** instalados em sua máquina.

## Estrutura do Projeto

```
chat/
├── Dockerfile             # Dockerfile para construir a imagem do frontend
├── docker-compose.yml     # Configuração do Docker Compose para rodar o frontend
├── src/                   # Código-fonte da aplicação Vue.js
│   ├── components/        # Componentes Vue.js
|       └── ChatBot.vue    # Código com a lógica do chat (envio de mensagem para o Rasa)
│   └── App.vue            # Componente raiz
├── package.json           # Dependências e scripts do projeto Vue.js
└── .gitignore             # Arquivo de configuração do Git para ignorar arquivos desnecessários
```

## Como Rodar o Frontend

### 1. Clonar o Repositório

Clone o repositório para sua máquina local:

```bash
git clone <url-do-repositório>
cd rasa_frontend
```

### 2. Iniciar o Frontend com Docker

Para rodar o frontend com Docker, basta executar o comando:

```bash
docker-compose up --build
```

Isso irá construir a imagem Docker e iniciar o container do frontend Vue.js. O aplicativo ficará disponível em [http://localhost:8080](http://localhost:8080).

### 3. Acessar o Chatbot

Após iniciar o frontend, você poderá acessar o chatbot no navegador. O frontend estará configurado para se comunicar com a API do backend Rasa para exibir a interface de chat.

### 4. Parar os Containers

Para parar os containers, use o comando:

```bash
docker-compose down
```

### 5. Configurações no Código

- **API do Rasa**: O frontend está configurado para se comunicar com o Rasa através de uma API REST. Caso o backend do Rasa esteja em outro endereço ou porta, você precisará atualizar a URL da API no código-fonte em `src/components/ChatBot.vue`.

## Desenvolvimento

Se você quiser modificar o código-fonte do frontend, basta seguir os seguintes passos:

1. **Modificações no Chat**: Você pode modificar o componente `ChatBot.vue` para ajustar o layout, a interação com o Rasa ou outros aspectos do frontend.

## Arquivos Importantes

- **`Dockerfile`**: O Dockerfile para construir a imagem do frontend.
- **`docker-compose.yml`**: Arquivo de configuração do Docker Compose para rodar o frontend em um container.
- **`src/components/ChatBot.vue`**: O componente Vue.js principal para o chatbot, onde ocorre a interação com o backend Rasa.
- **`package.json`**: Arquivo de dependências e scripts do projeto Vue.js.