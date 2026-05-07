import psycopg2
from flask import Flask, render_template

app = Flask(__name__)

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host='localhost',
            database='tienda_ropa',
            user='postgres',        
            password='1234',
        )
        return conn
    except Exception as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None

@app.route('/')
def home():
    conn = get_db_connection()
    productos = []
    
    if conn is not None:
        cur = conn.cursor()
        cur.execute('SELECT nombre, precio_venta, stock FROM productos;')
        productos = cur.fetchall()
        cur.close()
        conn.close()
    
    return render_template('index.html', productos=productos)

if __name__ == '__main__':
    app.run(debug=True)