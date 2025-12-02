const express = require('express')
const cors = require('cors')
const mysql = require('mysql2/promise')
const porta = 3000
const app = express()
const crypto = require('crypto')

const pool = require('./db.js')

//módulo crypto

app.use(cors())
app.use(express.json())

app.listen(porta, () => {
    console.log("servidor rodando!")
})

app.post("/cadastrar", async (req, res) => {
    try {
        const {nome_completo, email} = req.body

        let { senha } = req.body
        senha = senha.trim()
        senha = senha.replace("ㅤ", "")

        if (senha == "") {
            return res.json({"resposta":"Preencha uma senha"})
        } else if (senha.length < 6) {
            return res.json({"resposta":"A senha tem que conter no minimo 6 caracteres"})
        } else if (email.length < 6) {
            return res.json({"resposta":"preencha um email"})
        } else if (nome_completo.length < 6) {
            return res.json({"resposta":"Preencha um nome"})
        }

        //verirficar se o email já está cadastrado
        let sql = `Select * from usuarios where email = ?`
        let [resultado] = await pool.query(sql, [email])
        if (resultado.length != 0) {
            return res.json({ "resposta": "E-mail ou senha incorretos!" })
        }
        const hash = crypto.createHash("sha256").update(senha).digest("hex")


        //validar informações
        sql = `Insert into usuarios (nome_completo,email,senha) Values (?,?,?)`
        let [resultado2] = await pool.query(sql, [nome_completo, email, hash])

        if (resultado2.affectedRows == 1) {
            res.json({ "resposta": "Cadastro efetuado com sucesso!" })
        } else {
            res.sjson({ "resposta": "Erro ao fazer cadastro" })
        }

    } catch (error) {
        console.log(error)
    }
})

app.post("/login", async (req, res) => {
    try {
        const { email } = req.body
        let { senha } = req.body

        senha = senha.trim()
        senha = senha.replace("ㅤ", "")

        if (senha == "") {
            return res.json({"resposta":"Preencha uma senha"})
        } else if (senha.length < 6) {
            return res.json({"resposta":"A senha tem que conter no minimo 6 caracteres"})
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        const sql = `Select * from usuarios where email = ? and senha = ?`
        const [resultado] = await pool.query(sql, [email, hash])
        if (resultado.length > 0) {
            res.json({"resposta":"Você acertou o login e senha"})
        } else {
            res.json({"resposta":"Usuário ou senha inválida"})
        }

    } catch (error) {
        console.log(error)
    }
})

app.post("/contato", async (req, res) => {
    try {
        const { nome_completo,email,telefone,assunto,mensagem} = req.body

        
        if (mensagem == "") {
            return res.json({"resposta":"Preencha alguma mensagem"})
        } else if (mensagem.length < 6) {
            return res.json({"resposta":"A mensagem deve conter no minimo 6 caracteres"})
        } else if (email.length < 6) {
            return res.json({"resposta":"preencha um email"})
        } else if (nome_completo.length < 6) {
            return res.json({"resposta":"Preencha um nome"})
        } else if (assunto.length < 6) {
            return res.json({"resposta":"Preencha um assunto com no minimo 6 caracteres"})
        }


        //validar informações
        let sql = `Insert into visitantes (nome_completo,email,telefone,assunto, mensagem) Values (?,?,?,?,?)`
        let [resultado2] = await pool.query(sql, [nome_completo, email,telefone, assunto,mensagem])

        if (resultado2.affectedRows == 1) {
            res.json({ "resposta": "Mensagem enviada com sucesso!" })
        } else {
            res.json({ "resposta": "Erro ao enviar mensagem" })
        }

    } catch (error) {
        console.log(error)
    }
})