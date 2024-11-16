# TP 5 Normalizacion

### DEPENDENCIAS FUNCIONALES

1) `dniCliente` -> `nombreCliente`, `ciudadCliente`
    Cada cliente se identifica por su DNI y tiene un Nombre y ciudadCliente

2) `dniGerente` -> `nombreGerente`
    Cada gerente tiene un unico DNI u tiene un nombre. Sin embarrgo, un gerente puede gerenciar mas de un hotel por lo que `DNIGerente` no esta 
    en la clave candidata

3)	`codHotel` → `direccionHotel`, `ciudadHotel`, `cantidadHabitaciones`, `dniGerente`
    El `codHotel` es único, por lo que sirve para identificarlo; ya que puede haber más de un hotel en la misma direcciónHotel de una ciudadHotel.

4)	`dniCliente`, `codHotel`, `NumeroHabitacion`, `fechaInicioHospedaje` → `cantDiasHospedaje`
    Con el `DNICliente` se puede identificar quien realiza la estadía, a su vez que con el `codHotel`, `NumeroHabitacion` y `fechaInicioHospedaje` se sabe dónde y cuándo se realiza dicha estadía.

## CLAVES CANDIDATAS (Tabla: (clave_candidata))

-**Clientes**: (dniCliente)
-**Gerentes**: (dniGerente)
-**Hoteles**: (codHotel)
-**Estadías**: (dniCliente, codHotel, NumeroHabitacion, fechaInicioHospedaje)

Clave candidata compuesta para la Tabla Estadías, para que cada registro sea único, sería:
    `dniCliente`, `codHotel`, `NumeroHabitacion`, `fechaInicioHospedaje`

## DISEÑO EN TERCERA FORMA0 NORMAL (3FN)

**Tabla `Clientes`**
-   `dniCliente` (clave primaria)
-   `nombreCliente`
-	`ciudadCliente`

**Tabla `Gerentes`**
-	`dniGerente` (clave primaria)
-	`nombreGerente`


**Tabla `Hoteles`**
-	`codHotel` (clave primaria)
-	`direccionHotel`
-	`ciudadHotel`
-	`cantidadHabitaciones`
-	`dniGerente` (Clave foránea que referencia a Gerentes)

**Tabla `Estadías`**
-	`dniCliente` (Clave foránea que referencia a Clientes)
-	`codHotel` (Clave foránea que referencia a Hoteles)
-	`fechaInicioHospedaje`
-	`cantDiasHospedaje` 
-	`NumeroHabitacion`
-	Clave primaria compuesta: (`dniCliente`, `codHotel`, `NumeroHabitacion`, `fechaInicioHospedaje`)
