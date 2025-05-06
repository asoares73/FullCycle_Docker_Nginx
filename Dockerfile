# #############################################################################################
#
# Author....;;: Alexandre Soares de Almeida
# Reviewed by.: Full Cycle Team
# Object......: node
# Create by...: 2025/05/04
# References..: Full Cycle 3.0 - Treinamento Docker
# Objective...: Cumprir o Desafio 2 do Treinamento Full Cycle 3.0 - Docker 
#               Complete Challenge 2 of the Full Cycle 3.0 Training - Docker
#
# #############################################################################################
# (C) Copyright 2025. Direitos reservados ao público em geral. Esta solução pode ser utilizada,
#     compartilhada e adaptada livremente, desde que seja atribuída corretamente.
#                                         .........
#     Rights reserved to the general public. This solution may be used, shared, and adapted 
#     freely, provided proper attribution is given.
# #############################################################################################

# ----------------------------------------------------------------------------------------------
# Etapa 1: Preparar o build para a imagem principal
# ----------------------------------------------------------------------------------------------

# Use a imagem base do Node.js
FROM node:18

# Defina o diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copia todos os arquivos do host
COPY ./node/ .
RUN npm install
COPY . .

# Instalar o dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update && apt-get install -y wget \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

EXPOSE 3000

CMD ["node", "index.js"]
