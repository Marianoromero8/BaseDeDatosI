DELIMITER //
CREATE PROCEDURE RegistrarCambiosInventario()
BEGIN
    DECLARE ProductoIdV INT;
    DECLARE CambioV INT;
    DECLARE MotivoV VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    
    -- Declaramos el cursor para seleccionar el ProductoId, Cantidad en Inventario
    DECLARE cursor_HistorialInventario CURSOR FOR
    SELECT I.ProductoId, CI.Cantidad, CI.Motivo
    FROM Inventario AS I 
    INNER JOIN CambiosInventario AS CI ON I.ProductoId = CI.ProductoId;
    
    -- Declaramos un manejador para detectar cuando no hay más filas en el cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Abrimos el cursor
    OPEN cursor_HistorialInventario;
    
    -- Obtenemos el primer registro
    FETCH cursor_HistorialInventario INTO ProductoIdV, CambioV, MotivoV;
    
    WHILE NOT done DO
        -- Código del cursor
        BEGIN
            -- Actualizar la cantidad en Inventario
            UPDATE Inventario
            SET Cantidad = Cantidad + CambioV
            WHERE ProductoId = ProductoIdV;
            
            -- Insertar un registro en la tabla HistorialInventario y Motivo, Cambio de HistorialInventario
            INSERT INTO HistorialInventario (ProductoId, FechaCambio, Cambio, Motivo)
            VALUES (ProductoIdV, NOW(), CambioV, MotivoV);
            
            -- Obtener el siguiente registro
            FETCH cursor_HistorialInventario INTO ProductoIdV, CambioV, MotivoV;
        END;
    END WHILE;
    
    -- Cerrar el cursor
    CLOSE cursor_HistorialInventario;
END//
DELIMITER ;