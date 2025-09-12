# pip install flask
from flask import Flask, request, make_response, jsonify

# Importação da base de dados
from bd import Carros

# Esse móduo do Flask vai subir a nossa API localmente
# Vamos instanciar o módulo Flask na nossa variável app
app = Flask('Carro')

# MÉTODO 1 - VISUALIZAÇÃO DE DADOS (GET)
# 1 - O que esste método vai fazer?
# 2 - Onde ele vai fazer?
@app.route('/carro', methods=['GET'])
def get_carros():
    return Carros

# MÉTODO 1.1 - VISUALIZAÇÃO DE DADOS POR ID (GET)
@app.route('/carro/<int:id>', methods=['GET'])
def get_id(id):
    for i in Carros:
        if i.get('id') == id:
            return jsonify(i)

# MÉTODO 2 - CRIAR NOVOS REGISTROS (POST)
# Verificar os dados que estão passados na requisição e armazernar na nossa base
@app.route('/carro', methods=['POST'])
def criar_carro():
    novoCarro = request.get_json()
    Carros.append(novoCarro)
    return make_response(
        jsonify(
            mensagem = 'Carro cadastrado com sucesso',
            carro = novoCarro
        )
    )

# MÉTODO 3 - DELETAR REGISTROS (DELETE)
@app.route('/carro/<int:id>', methods=['DELETE'])
def excluir_carro(id):
    for indice, carro in enumerate(Carros):
        if carro.get('id') == id:
            del Carros[indice]
            return jsonify(
                {'mensagem':'Carro excluído com sucesso!'}
            )

# MÉTODO 4 - EDITAR REGISTROS (PUT)
@app.route('/carro/<int:id>', methods=['PUT'])
def editar_carro(id):
    carroAlterado = request.get_json()
    for indice, carro in enumerate(Carros):
        if carro.get('id') == id:
            Carros[indice].update(carroAlterado)
            return jsonify(
                Carros[indice]
                )

app.run(port=5000, host='localhost', debug=True)