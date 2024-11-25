# Justificacion del diseño

### Dependencias Funcionales

2) `producto_id` -> `nombre_producto`, `precio`, `stock` 
    Cada producto tiene su id unico y tiene un nombre, precio y stock. Este puede pertenecer a muchas ordenes

1) `cliente_id` -> `nombre`, `apellido`, `telefono`, `direccion`, `email`
    Cada cliente se identifica por su id y tiene un nombre, apellido, telefono, direccion y email. Este puede tener muchos productos y muchas ordenes 


3) `orden_id` ->  `producto_id`, `cliente_id`, `cantidad`, `motivo`, `fecha`
    Cada orden se identifica por su `orden_id` y tiene un producto (`producto_id`), un cliente (`cliente_id`), cantidad del producto que compra, motivo y fecha de la compra

## CLAVES CANDIDATAS (Tabla: (clave_candidatas))

-**Productos**: (producto_id)
-**Clientes**: (cliente_id)
-**Ordenes**: (orden_id)

## DISEÑO EN TERCERA FORMA NORMAL (3FN)

**Tabla `Productos`**
-`producto_id` (Clave primaria)
-`nombre_producto`
-`stock`
-`precio`

**Tabla `Clientes`**
-`cliente_id` (Clave primaria)
-`nombre`
-`apellido`
-`telefono`
-`direccion`
-`email`

**CREATE `Ordenes`**
-`orden_id` (Clave primaria)
-`producto_id` (Clave foránea que referencia a Productos)
-`cliente_id` (Clave foránea que referencia a Clientes)
-`cantidad`
-`motivo`
-`fecha`
