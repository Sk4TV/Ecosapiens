//Meu arquivo de conexão com o banco de dados
const { createPool } = require('mysql2')
const mysql = require('mysql2/promise')

//pool

const conexao = mysql.createPool({
    //criar as configurações do BD
    host:"localhost",       //local do servidor
    user:"root",            //usuário
    password:"",            //senha
    port:3306,              //porta padrão do mysql
    database:"",      //nome do banco
    waitForConnections:true,//aviso de limite de pessoas conectadas
    connectionLimit:10,     //limite de conexões ao mesmo tempo
    queueLimit:0            //limite de transição

})

module.exports = conexao