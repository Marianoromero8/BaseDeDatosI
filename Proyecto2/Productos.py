import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Goliat97.",
  database="ventasEnLinea"
)

mycursor = mydb.cursor()

def ListarProductos():
    mycursor.execute("SELECT * FROM productos")
    resultados = mycursor.fetchall()
    for registro in resultados:
        print(registro)

def AgregarProducto(nombre_producto, stock, precio):
    sql = 'INSERT INTO Productos (nombre_producto, stock, precio) VALUES (%s, %s, %s)'
    valores = (nombre_producto, stock, precio)
    mycursor.execute(sql, valores)
    mydb.commit()
    print("producto agregado")

def ModificarProducto(producto_id, nombre_producto, stock, precio):
    sql = 'UPDATE Productos SET nombre_producto=%s, stock = %s, precio = %s WHERE producto_id = %s'
    valores = (nombre_producto, stock, precio, producto_id)
    mycursor.execute(sql, valores)
    mydb.commit()
    print("producto modificado")


def EliminarProducto(id):
    sql = f'DELETE FROM productos WHERE producto_id = {id}'
    mycursor.execute(sql)
    mydb.commit()
    print("producto eliminado")

def menuProductos():
    while True:
        print("1. Listar productos")
        print("2. Agregar producto")
        print("3. Modificar producto")
        print("4. Eliminar producto")
        print("5. Salir")
        opcion = int(input("Elija su opción: "))
        if opcion == 1:
            ListarProductos()
        elif opcion == 2:
            nombre_producto = input("Ingrese el nombre del producto: ")
            stock = input("Ingrese el stock del producto: ")
            precio = input("Ingrese el precio del producto: ")
            AgregarProducto(nombre_producto, stock, precio)
        elif opcion == 3:
            ListarProductos()
            producto_id = input("Ingrese el id del producto a modificar: ")
            nombre_producto = input("Ingrese el nombre del producto: ")
            stock = input("Ingrese el stock del producto: ")
            precio = input("Ingrese el precio del producto: ")
            ModificarProducto(producto_id, nombre_producto, stock, precio)
        elif opcion == 4:
            ListarProductos()
            id = input("Ingrese el id del producto a eliminar: ")
            EliminarProducto(id)
        elif opcion == 5:
            break