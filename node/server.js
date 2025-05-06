const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;

const config = {
  host: 'db',
  user: 'root',
  password: 'root',
  database: 'nodedb'
};

const connection = mysql.createConnection(config);

// Criação da tabela se não existir
const createTable = `CREATE TABLE IF NOT EXISTS people (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
)`;
connection.query(createTable, (err) => {
  if (err) console.error('Erro ao criar tabela:', err);
});

// Middleware para tratar JSON
app.use(express.json());

// Middleware para servir arquivos estáticos (ex: index.html em /public)
app.use(express.static('public'));

// Rota GET para obter todos os nomes
app.get('/nomes', (req, res) => {
  connection.query(`SELECT name FROM people`, (err, results) => {
    if (err) {
      console.error('Erro ao buscar nomes:', err);
      return res.status(500).json({ error: 'Erro no banco de dados' });
    }

    const nomes = results.map(row => row.name);
    res.json(nomes); // <-- JSON esperado pelo front
  });
});

// Rota POST para incluir um nome
app.post('/nomes', (req, res) => {
  const { nome } = req.body;

  if (!nome) {
    return res.status(400).send('Nome não fornecido');
  }

  connection.query(`INSERT INTO people(name) VALUES(?)`, [nome], (err) => {
    if (err) {
      console.error('Erro ao inserir nome:', err);
      return res.status(500).send('Erro ao inserir nome no banco');
    }

    res.status(201).send('Nome inserido com sucesso');
  });
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
