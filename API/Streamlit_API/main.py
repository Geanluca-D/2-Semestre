# pip install flask_sqlalchemy
# Permite a conexão da API com o banco de dados
# Flask - permite a criação de API com Python
# Response e Request -> requisição
from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask('carro')

# Rastrear as modificações realizadas
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

# Configuração de conexão com o banco
# 1- Usuario (root) 2- Senha (Senai@134) 3- localhost(127.0.0.1) 4- nome do banco
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/db_carro'
# %40 -> faz o papel de @

mydb = SQLAlchemy(app)

# Classe para definir o modelo dos dados que correspondem a tabela do banco de dados
class Carros(mydb.Model):
    __tablename__ = 'tb_carro'
    id_carro = mydb.Column(mydb.Integer, primary_key = True)
    marca = mydb.Column(mydb.String(255))
    modelo = mydb.Column(mydb.String(255))
    ano = mydb.Column(mydb.String(255))
    valor = mydb.Column(mydb.String(255))
    cor = mydb.Column(mydb.String(255))
    numero_vendas = mydb.Column(mydb.String(255))

    # Este método to_json vai ser usado para converter o objeto em json
    def to_json(self):
        return{
            "id_carro": self.id_carro,
            "marca": self.marca,
            "modelo": self.modelo,
            "ano": self.ano,
            "valor": float(self.valor),
            "cor": self.cor,
            "numero_vendas": self.numero_vendas
        }
    
# ==================================================================================================================================== #
# MÉTODO 1 - GET
@app.route('/carro', methods=['GET'])
def seleciona_carro():
    # Executa uma consulta no banco de dados (SELECT * FROM tb_carro)
    carro_selecionado = Carros.query.all()
    carro_json = [carro.to_json()
                  for carro in carro_selecionado]
    return gera_resposta(200, "Lista de carros", carro_json, 'Carros Retornados')

# ==================================================================================================================================== #
# MÉTODO 2 - GET (POR ID)
@app.route('/carro/<id_carro_pam>', methods=['GET'])
def seleciona_carro_id(id_carro_pam):
    carro_selecionado = Carros.query.filter_by(id_carro = id_carro_pam).first() # SELECT * FROM TB_CARRO WHERE ID_CARRO = 3
    carro_json = carro_selecionado.to_json()
    return gera_resposta(200, "Carro selecionado",carro_json, 'Carro encontrado!')

# ==================================================================================================================================== #
# MÉTODO 3 - POST
@app.route('/carro', methods=['POST'])
def criar_carro():
    requisicao = request.get_json()

    try:
        carro = Carros(
            id_carro = requisicao['id_carro'],
            marca = requisicao['marca'],
            modelo = requisicao['modelo'],
            ano = requisicao['ano'],
            valor = requisicao['valor'],
            cor = requisicao['cor'],
            numero_vendas = requisicao['numero_vendas']
        )

        mydb.session.add(carro) # Adiciona ao banco
        mydb.session.commit() # Salva
        return gera_resposta(201, "Carro adicionado", carro.to_json(), "Carro adicionado com sucesso!")
    
    except Exception as e:
        print('Erro', e)
        return gera_resposta(400, '', {}, 'Erro ao cadastrar')

# ==================================================================================================================================== #
# MÉTODO 4 - DELETE
@app.route('/carro/<id_carro_pam>', methods=['DELETE'])
def deleta_carros(id_carro_pam):
    carro = Carros.query.filter_by(id_carro = int(id_carro_pam)).first() # SELECT * FROM TB_CARRO WHERE ID_CARRO = 3

    try:
        mydb.session.delete(carro)
        mydb.session.commit()
        return gera_resposta(200, 'Carro deletado:', carro.to_json(), 'Deletado com sucesso')
    
    except Exception as e:
        print('Erro', e)
        return gera_resposta(400, '', {}, 'Erro ao deletar!')
    
# ==================================================================================================================================== #
# MÉTODO 5 - UPDATE (PUT)
@app.route('/carro/<id_carro_pam>', methods=['PUT'])
def atualiza_carros(id_carro_pam):
    carro = Carros.query.filter_by(id_carro = id_carro_pam).first()
    requisicao = request.get_json()

    try:
        if('marca' in requisicao):
            carro.marca = requisicao['marca']
        if('modelo' in requisicao):
            carro.modelo = requisicao['modelo']
        if('ano' in requisicao):
            carro.ano = requisicao['ano']
        if('valor' in requisicao):
            carro.valor = requisicao['valor']
        if('cor' in requisicao):
            carro.cor = requisicao['cor']
        if('numero_vendas' in requisicao):
            carro.numero_vendas = requisicao['numero_vendas']
        
        mydb.session.add(carro)
        mydb.session.commit()
    
        return gera_resposta(200, 'Carro atualizado:', carro.to_json(), "Carro atualizado com sucesso!")
    
    except Exception as e:
        print('Erro', e)
        return gera_resposta(400, 'Erro', {}, 'Erro ao atualizar')

# ==================================================================================================================================== #
# RESPOSTA PADRÃO
# - status (200, 404)
# nome do conteudo
# conteudo
# mensagem (opcional)
def gera_resposta(status, nome_do_conteudo, conteudo, mensagem=False):
    body={}
    body[nome_do_conteudo] = conteudo

    if(mensagem):
        body['mensagem'] = mensagem

    return Response(json.dumps(body), status=status, mimetype='application/json')

# Dumps - Converte o dicionário criado (body) em Json (json.dumps)

app.run(port=5000, host='localhost', debug=True)
