import mysql.connector
from Clientes import ListarClientes

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Goliat97.",
  database="ventasEnLinea"
)

mycursor = mydb.cursor()

# 100 entradas son demasiadas mejor hacer busqueda por cliente id
def ListarOrdenes():
    mycursor.execute("SELECT * FROM ordenes")
    resultados = mycursor.fetchall()
    for registro in resultados:
        print(registro)

def listarOrdenesPorCliente(cliente_id):
    sql = """
        SELECT O.orden_id, O.cantidad, O.motivo, O.fecha, P.nombre_producto AS producto, C.nombre AS cliente, C.cliente_id
        FROM Ordenes O
        JOIN productos P ON O.producto_id = P.producto_id
        JOIN Clientes C ON O.cliente_id = C.cliente_id
        WHERE O.cliente_id = %s
    """
    
    mycursor.execute(sql, (cliente_id,))
    resultados = mycursor.fetchall()
    
    if resultados:
        print(f"Órdenes para el cliente con ID {cliente_id}:")
        for orden in resultados:
            print(f"CienteID:{orden[6]}, Orden ID: {orden[0]}, Producto: {orden[4]}, Cantidad: {orden[1]}, Motivo: {orden[2]}, Fecha: {orden[3]}")
    else:
        print(f"No se encontraron órdenes para el cliente con ID {cliente_id}.")

def mostrarOrdenesPorCliente(cliente_id):
    query = "SELECT * FROM ordenes WHERE cliente_id = %s"
    mycursor.execute(query, (cliente_id,)) 
    resultados = mycursor.fetchall()

    if resultados:
        for resultado in resultados:
            print(resultado)
    else:
        print(f"No se encontró un cliente con ID {cliente_id}.")

def productos_mas_vendidos(limite=5):
    query = """
    SELECT P.nombre_producto, SUM(O.cantidad) AS total_vendido
    FROM Ordenes O
    JOIN Productos P ON O.producto_id = P.producto_id
    GROUP BY P.producto_id, P.nombre_producto
    ORDER BY total_vendido DESC
    LIMIT %s
    """
    mycursor.execute(query, (limite,))  # Ejecutamos la consulta con un límite para mostrar los primeros N productos más vendidos
    productos = mycursor.fetchall() 

    if productos:
        print(f"Los {limite} productos más vendidos:")
        for producto in productos:
            print(f"Nombre: {producto[0]}, Total Vendido: {producto[1]} unidades")
    else:
        print("No se encontraron ventas registradas.")

def menuOrdenes():
    while True:
        print("1. Listar ordenes")
        print("2. Mostrar orden por cliente")
        print("3. Mostrar productos mas vendidos")
        print("4. Salir")
        opcion = int(input("Elija su opción: "))
        if opcion == 1:
            ListarOrdenes()
        elif opcion == 2:
            ListarClientes()
            cliente_id = input("Ingrese el id del cliente: ")
            listarOrdenesPorCliente(cliente_id)
        elif opcion == 3:
            limite = int(input("Ingrese el número de productos a mostrar: "))
            productos_mas_vendidos(limite)
        elif opcion == 4:
            break