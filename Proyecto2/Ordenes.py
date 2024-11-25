import mysql.connector
from Clientes import ListarClientes
from Productos import ListarProductos
from dotenv import load_dotenv
import os
import mysql.connector

load_dotenv()

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password=os.getenv('DB_PASSWORD'),
  database="ventasEnLinea"
)

mycursor = mydb.cursor()

def ListarOrdenes():
    mycursor.execute("SELECT * FROM ordenes")
    resultados = mycursor.fetchall()
    for registro in resultados:
        print(registro)

def listarOrdenesPorCliente(nombre, apellido):
    sql =  """
        SELECT o.orden_id, o.cantidad, o.motivo, o.fecha, p.nombre_producto
        FROM Ordenes o
        JOIN Productos p ON o.producto_id = p.producto_id
        JOIN Clientes c ON o.cliente_id = c.cliente_id
        WHERE c.nombre = %s AND c.apellido = %s;
    """
    mycursor.execute(sql, (nombre, apellido))
    ordenes = mycursor.fetchall()

    if ordenes:
        print(f"Órdenes realizadas por {nombre} {apellido}:")
        for orden in ordenes:
            orden_id, cantidad, motivo, fecha, nombre_producto = orden
            print(f"Orden ID: {orden_id}, Producto: {nombre_producto}, Cantidad: {cantidad}, Motivo: {motivo}, Fecha: {fecha}")
    else:
        print(f"No se encontraron órdenes para el cliente {nombre} {apellido}.")

def productos_mas_vendidos(limite):
    sql = """
    SELECT P.nombre_producto, SUM(O.cantidad) AS total_vendido
    FROM Ordenes O
    JOIN Productos P ON O.producto_id = P.producto_id
    GROUP BY P.producto_id, P.nombre_producto
    ORDER BY total_vendido DESC
    LIMIT %s
    """
    mycursor.execute(sql, (limite,))  # Ejecutamos la consulta con un límite para mostrar los primeros N productos más vendidos
    productos = mycursor.fetchall()

    if productos:
        print(f"Los {limite} productos más vendidos:")
        for producto in productos:
            print(f"Nombre: {producto[0]}, Total Vendido: {producto[1]} unidades")
    else:
        print("No se encontraron ventas registradas.")

def ajustar_cantidad_producto(producto_id, cantidad_maxima):
        query = """
        SELECT o.orden_id, o.cantidad
        FROM Ordenes o
        WHERE o.producto_id = %s;
        """

        mycursor.execute(query, (producto_id,))
        ordenes = mycursor.fetchall()

        if ordenes:
            print(f"Órdenes actuales del Producto ID {producto_id}:")
            for orden in ordenes:
                orden_id, cantidad = orden

                # Si la cantidad en la orden excede el límite máximo, la ajustamos
                if cantidad > cantidad_maxima:
                    print(f"  Orden ID: {orden_id} | Cantidad original: {cantidad} ajustada a {cantidad_maxima}.")
                    # Actualizar la cantidad en la base de datos
                    sql = """
                    UPDATE Ordenes
                    SET cantidad = %s
                    WHERE orden_id = %s;
                    """
                    mycursor.execute(sql, (cantidad_maxima, orden_id))
                    mydb.commit()
                else:
                    print(f"  Orden ID: {orden_id} | Cantidad: {cantidad} (sin cambios).")
        else:
            print(f"No se encontraron órdenes para el Producto ID {producto_id}.")

def mostrarOrdenesdeProducto(producto_id):
    sql = """
    SELECT o.orden_id, o.cantidad, o.motivo, o.fecha, c.nombre, c.apellido
    FROM Ordenes o
    JOIN Productos p ON o.producto_id = p.producto_id
    JOIN Clientes c ON o.cliente_id = c.cliente_id
    WHERE p.producto_id = %s;
    """
    mycursor.execute(sql, (producto_id,))
    ordenes = mycursor.fetchall()

    if ordenes:
        print(f"Órdenes del Producto ID {producto_id}:")
        for orden in ordenes:
            orden_id, cantidad, motivo, fecha, nombre, apellido = orden
            print(f"Orden ID: {orden_id}, Cantidad: {cantidad}, Motivo: {motivo}, Fecha: {fecha}, Cliente: {nombre} {apellido}")
    else:
        print(f"No se encontraron órdenes para el Producto ID {producto_id}.")

def menuOrdenes():
    while True:
        print("1. Mostrar orden por cliente")
        print("2. Mostrar productos mas vendidos")
        print("3. Ajustar cantidad de productos")
        print("4. Mostrar orden por productos")
        print("5. Salir")
        opcion = input("Elija su opción: ")
        if opcion == '1':
            print("Lista de clientes:")
            ListarClientes()
            nombre = input("Ingrese el nombre del cliente: ")
            apellido = input("Ingrese el apellido del cliente: ")
            listarOrdenesPorCliente(nombre, apellido)
        elif opcion == '2':
            limite = int(input("Ingrese el número de productos mas vendidos a mostrar: "))
            productos_mas_vendidos(limite)
        elif opcion == '3':
            ListarProductos()
            producto_id = int(input("Ingrese el id del producto: "))
            mostrarOrdenesdeProducto(producto_id)
            cantidad_maxima = int(input("Ingrese la cantidad máxima de productos por orden: "))
            ajustar_cantidad_producto(producto_id, cantidad_maxima)
        elif opcion == '4':
            ListarProductos()
            producto_id = int(input("Ingrese el id del producto: "))
            mostrarOrdenesdeProducto(producto_id)
        elif opcion == '5':
            break