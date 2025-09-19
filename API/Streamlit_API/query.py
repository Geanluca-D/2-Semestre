# pip install streamlit
# pip install mysql-connector-python

import mysql.connector
import pandas as pd

def conexao(query):

    conn = mysql.connector.connect(
        host = 'localhost',
        port = '3306',
        user = 'root',
        password = 'Senai@134',
        db = 'db_carro'
    )

    # Executar o SQL e armazenar o resultado no dataframe
    dataframe = pd.read_sql(query, conn)
    
    conn.close()
    
    return dataframe