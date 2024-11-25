from Productos import menuProductos
from Clientes import menuClientes
from Ordenes import menuOrdenes

def main():
    while True:
        print("--- Bienvenido a ventas en linea ---")
        print("1- Interaccion con Productos")
        print("2- Interaccion con Clientes")
        print("3- Interaccion con Ordenes")
        print("0- Salir")
        
        opcion = int(input("Elija con que quiere interactuar de nuestra tienda: "))

        if opcion == 1:
            menuProductos()
        elif opcion == 2:
            menuClientes()
        elif opcion == 3:
            menuOrdenes()
        elif opcion == 0:
            break

if "__main__" == __name__:
    main()