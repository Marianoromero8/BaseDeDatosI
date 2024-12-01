DELIMITER $$

CREATE PROCEDURE ajustar_cantidad_producto(IN producto_id INT, IN cantidad_maxima INT)
BEGIN
    -- Declarar una variable para controlar el fin del cursor
    DECLARE done INT DEFAULT FALSE;
    
    -- Declarar las variables que almacenarán los resultados de cada fila del cursor
    DECLARE orden_idV INT;
    DECLARE cantidadV INT; 
    
    -- Crear el cursor que selecciona las órdenes relacionadas con el producto_id
    DECLARE cursor_ajustar_ordenes CURSOR FOR 
        SELECT o.orden_id, o.cantidad
        FROM Ordenes o
        WHERE o.producto_id = producto_id;

    -- Manejar el caso cuando ya no hay más filas que procesar en el cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_ajustar_ordenes;
    
    -- Obtener la primera fila del cursor antes de empezar el bucle
    FETCH cursor_ajustar_ordenes INTO orden_idV, cantidadV;
    
    WHILE NOT done DO
        -- Si la cantidad en la orden excede el límite máximo, ajustarla
        IF cantidadV > cantidad_maxima THEN
            UPDATE Ordenes
            SET cantidad = cantidad_maxima
            WHERE orden_id = orden_idV;
            
            -- Mostrar mensaje indicando que la cantidad fue ajustada
            SELECT CONCAT('Orden ID: ', orden_idV, ' | Cantidad original: ', cantidadV, ' ajustada a ', cantidad_maxima) AS resultado;
        ELSE
            -- Si la cantidad no excede el límite, mostrar que no hubo cambios
            SELECT CONCAT('Orden ID: ', orden_idV, ' | Cantidad: ', cantidadV, ' (sin cambios).') AS resultado;
        END IF;
        
        -- Obtener la siguiente fila del cursor
        FETCH cursor_ajustar_ordenes INTO orden_idV, cantidadV;
    END WHILE;

    -- Cerrar el cursor una vez que hemos procesado todas las filas
    CLOSE cursor_ajustar_ordenes;
END $$

DELIMITER ;