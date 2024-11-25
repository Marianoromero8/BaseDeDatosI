import mysql.connector


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Goliat97.",
  database="ventasEnLinea"
)

mycursor = mydb.cursor()

def ListarClientes():
    mycursor.execute("SELECT * FROM clientes")
    resultados = mycursor.fetchall()
    for registro in resultados:
        print(registro)

def AgregarCliente(nombre, apellido, telefono, direccion, email):
    sql = 'INSERT INTO clientes (nombre, apellido, telefono, direccion, email) VALUES (%s, %s, %s, %s, %s)'
    valores = (nombre, apellido, telefono, direccion, email)
    mycursor.execute(sql, valores)
    mydb.commit()
    print("cliente agregado")

def ModificarCliente(cliente_id, nombre, apellido, telefono, direccion, email):
    sql = 'UPDATE clientes SET nombre=%s, apellido = %s, telefono = %s, direccion = %s, email = %s WHERE cliente_id = %s'
    valores = (nombre, apellido, telefono, direccion, email, cliente_id)
    mycursor.execute(sql, valores)
    mydb.commit()
    print("cliente modificado")

def EliminarCliente(cliente_id):
    sql = f'DELETE FROM clientes WHERE cliente_id = {cliente_id}'
    mycursor.execute(sql)
    mydb.commit()
    print("cliente eliminado")

def menuClientes():
    while True:
        print("1. Listar clientes")
        print("2. Agregar cliente")
        print("3. Modificar cliente")
        print("4. Eliminar cliente")
        print("5. Salir")
        opcion = int(input("Elija su opción: "))
        if opcion == 1:
            ListarClientes()
        elif opcion == 2:
            nombre = input("Ingrese el nombre del cliente: ")
            apellido = input("Ingrese el apellido del cliente: ")
            telefono = input("Ingrese el telefono del cliente: ")
            direccion = input("Ingrese la direccion del cliente: ")
            email = input("Ingrese el email del cliente: ")
            AgregarCliente(nombre, apellido, telefono, direccion, email)
        elif opcion == 3:
            ListarClientes()
            cliente_id = input("Ingrese el id del cliente a modificar: ")
            nombre = input("Ingrese el nombre del cliente: ")
            apellido = input("Ingrese el apellido del cliente: ")
            telefono = input("Ingrese el telefono del cliente: ")
            direccion = input("Ingrese la direccion del cliente: ")
            email = input("Ingrese el email del cliente: ")
            ModificarCliente(cliente_id, nombre, apellido, telefono, direccion, email)
        elif opcion == 4:
            ListarClientes()
            id = input("Ingrese el id del cliente a eliminar: ")
            EliminarCliente(cliente_id)
        elif opcion == 5:
            break