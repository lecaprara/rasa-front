# Use a imagem oficial do Node.js para construção
FROM node:18 as build

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos de configuração e dependências para o container
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install

# Copia o restante dos arquivos para o container
COPY . .

# Cria o build de produção
RUN npm run build

# Use uma imagem Nginx para servir o conteúdo
FROM nginx:alpine

# Copia o build do Vue.js para o diretório do Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exponha a porta 80 para acesso externo
EXPOSE 80

# Inicia o Nginx
CMD ["nginx", "-g", "daemon off;"]
