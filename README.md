# 🚀 Desafio Full Cycle: Docker-Compose Nginx com Node.js e MySQL! 🐳💻

Este projeto demonstra o uso do **nginx como proxy reverso** para uma aplicação Node.js que insere um nome qualquer e apresenta a lista nomes em um banco de dados MySQL.

---

## 🔧 O que este projeto faz?

Essa imagem Docker, ao ser executada, entrega uma resposta simples e poderosa:

> **🗨️ Full Cycle Rocks!!**

---

## 🌐 Acesse o resultado:

👉 <a href="http://localhost:8080" target="_blank1">http://localhost:8080</a>

---


## Tecnologias

- Node.js
- Express
- MySQL
- Nginx
- Docker & Docker Compose

## Como executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/asoares73/FullCycle_Docker_Nginx.git

---

## 📥 Como testar rapidamente

```bash
   # Realizar o build da imagem
   docker-compose up --build -d
   
   # Verificar se os 03 containers (app, nginx e db) estão ativos
   docker ps
   
   # Verificar se foram reportados erros em algum dos containers
   docker logs app
   docker logs nginx
   docker logs db
   
   # Caso precise alterar alguma configuração execute o comando abaixo ele irá encerrar e remove todos os containers, redes, volumes e imagens
   docker-compose down --volumes --remove-orphans
````

🖥️ Acesse: <a href="http://localhost:8080" target="_blank3">http://localhost:8080</a>

---

## 📚 Recursos úteis

* 🔗 Repositório do projeto: <a href="https://github.com/asoares73/FullCycle_Docker_Nginx" target="_blank6">GitHub - asoares73/FullCycle_Docker_Nginx</a>

---

## 🎉 Conclusão

Esse projeto mostra como **Docker + Node + Nginx + MySQL** pode ser simples, poderoso e leve!
Explore, modifique, publique e **divirta-se** 🚀