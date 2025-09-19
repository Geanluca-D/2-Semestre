# CRUD ========================================================================================================================
# Clinica vet - tb_clientes ===================================================================================================
from flask import Flask, Response, request
from flask_sqlalchemy import SQLAlchemy
import json

app = Flask('CURD')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Senai%40134@127.0.0.1/clinicavetbd'

mydb = SQLAlchemy(app)

class clientes(mydb.Model):
    __tablename__ = 'tb_clientes'
    id_cliente = mydb.Column(mydb.Integer, primary_key = True)
    nome = mydb.Column(mydb.String(255))
    endereco = mydb.Column(mydb.String(255))
    telefone = mydb.Column(mydb.String(15))

    def to_json(self):
        return{
            'id_cliente': self.id_cliente,
            'nome': self.nome,
            'endereco': self.endereco,
            'telefone': self.telefone
        }

# Resposta padrão =============================================================================================================
def resposta(status, nome_conteudo, conteudo, mensagem=False):
    body = {}
    body[nome_conteudo] = conteudo
    if(mensagem):
        body['mensagem'] = mensagem
    
    return Response(json.dumps(body), status = status, mimetype = 'application/json') 

# Create - (POST) =============================================================================================================
@app.route('/cliente', methods = ['POST'])
def add_cliente():
    requisicao = request.get_json()

    try:
        cliente = clientes(
            id_cliente = requisicao['id_cliente'],
            nome = requisicao['nome'],
            endereco = requisicao['endereco'],
            telefone = requisicao['telefone']
        )

        mydb.session.add(cliente)
        mydb.session.commit()

        return resposta(201, 'Cliente adicionado com sucesso!', cliente.to_json())
    
    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao cadastrar cliente.', {})
    
# Read (GET) ==================================================================================================================
@app.route('/cliente', methods = ['GET'])
def seleciona_cliente():
    cliente_selec = clientes.query.all()
    cliente_json = [cliente.to_json()
                    for cliente in cliente_selec]
    return resposta(200, 'Todos os clientes', cliente_json)

# Por ID
@app.route('/cliente/<id_cliente_pam>', methods = ['GET'])
def seleciona_clienteID(id_cliente_pam):
    cliente_selec = clientes.query.filter_by(id_cliente = id_cliente_pam).first()
    cliente_json = cliente_selec.to_json()
    return resposta(200, 'Cliente retornado', cliente_json)

# Update (PUT) ================================================================================================================
@app.route('/cliente/<id_cliente_pam>', methods = ['PUT'])
def atualiza_cliente(id_cliente_pam):
    cliente = clientes.query.filter_by(id_cliente = id_cliente_pam).first()
    requisicao = request.get_json()

    try:
        if('nome' in requisicao):
            cliente.nome = requisicao['nome']
        if('endereco' in requisicao):
            cliente.endereco = requisicao['endereco']
        if('telefone' in requisicao):
            cliente.telefone = requisicao['telefone']

        mydb.session.add(cliente)
        mydb.session.commit()

        return resposta(200, 'Dados atualizados!', cliente.to_json())
    
    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao atualizar', {})

# Delete (DELETE) =============================================================================================================
@app.route('/cliente/<id_cliente_pam>', methods = ['DELETE'])
def deleta_cliente(id_cliente_pam):
    cliente = clientes.query.filter_by(id_cliente = id_cliente_pam).first()

    try:
        mydb.session.delete(cliente)
        mydb.session.commit()
        return resposta(200, 'Cliente deletado com sucesso!', cliente.to_json())

    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao deletar.', {})

# CRUD ========================================================================================================================
# Clinica vet - tb_pets =======================================================================================================
class pets(mydb.Model):
    __tablename__ = 'tb_pets'
    id_pet = mydb.Column(mydb.Integer, primary_key = True, autoincrement = True)
    nome = mydb.Column(mydb.String(255))
    tipo = mydb.Column(mydb.String(255))
    raca = mydb.Column(mydb.String(255))
    data_nascimento = mydb.Column(mydb.Date)
    id_cliente = mydb.Column(mydb.Integer, mydb.ForeignKey('tb_clientes.id_cliente'), nullable = False)

    def to_json_pet(self):
        return {
            'id_pet': self.id_pet,
            'nome': self.nome,
            'tipo': self.tipo,
            'raca': self.raca,
            'data_nascimento': str(self.data_nascimento),
            'id_cliente': self.id_cliente
        }
    
# Create - (POST) =============================================================================================================
@app.route('/pet', methods = ['POST'])
def add_pet():
    requisicao = request.get_json()

    try:
        pet = pets(
            id_pet = requisicao['id_pet'],
            nome = requisicao['nome'],
            tipo = requisicao['tipo'],
            raca = requisicao['raca'],
            data_nascimento = requisicao['data_nascimento'],
            id_cliente = requisicao['id_cliente']
        )

        mydb.session.add(pet)
        mydb.session.commit()

        return resposta(201, 'Pet adicionado', pet.to_json_pet())
    
    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao adicionar pet', {})

# Read (GET) ==================================================================================================================
@app.route('/pet', methods = ['GET'])
def seleciona_pet():
    pet_selec = pets.query.all()
    pet_json = [pet.to_json_pet()
                for pet in pet_selec]
    return resposta(200, 'Todos os pets:', pet_json)

# Por id
@app.route('/pet/<id_pet_pam>', methods = ['GET'])
def seleciona_petID(id_pet_pam):
    pet_selec = pets.query.filter_by(id_pet = id_pet_pam).first()
    pet_json = pet_selec.to_json_pet()
    return resposta(200, 'Pet selecionado:', pet_json)

# Update (PUT) ================================================================================================================
@app.route('/pet/<id_pet_pam>', methods = ['PUT'])
def atualiza_pet(id_pet_pam):
    pet = pets.query.filter_by(id_pet = id_pet_pam).first()
    requisicao = request.get_json()

    try:
        if('nome' in requisicao):
            pet.nome = requisicao['nome']
        if('tipo' in requisicao):
            pet.tipo = requisicao['tipo']
        if('raca' in requisicao):
            pet.raca = requisicao['raca']
        if('data_nascimento' in requisicao):
            pet.data_nascimento = requisicao['data_nascimento']
        if('id_cliente' in requisicao):
            pet.id_cliente = requisicao['id_cliente']

        mydb.session.add(pet)
        mydb.session.commit()

        return resposta(200, 'Dados atualizados', pet.to_json_pet())
    
    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao atualizar', {})

# Delete (DELETE) =============================================================================================================
@app.route('/pet/<id_pet_pam>', methods = ['DELETE'])
def deleta_pet(id_pet_pam):
    pet = pets.query.filter_by(id_pet = id_pet_pam).first()
    
    try:
        mydb.session.delete(pet)
        mydb.session.commit()
        return resposta(200, 'Pet deletado com sucesso', pet.to_json_pet())
    
    except Exception as e:
        print('Erro', e)
        return resposta(400, 'Erro ao deletar', {})
# =============================================================================================================================
app.run(port = 5000, host = 'localhost', debug = True)