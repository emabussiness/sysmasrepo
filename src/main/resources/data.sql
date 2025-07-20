INSERT INTO categorias_productos (id, nombre) VALUES (1, 'Electrónica');
INSERT INTO categorias_productos (id, nombre) VALUES (2, 'Alimentos');
INSERT INTO categorias_productos (id, nombre) VALUES (3, 'Ropa');

INSERT INTO unidades_medida (id, nombre, simbolo) VALUES (1, 'Unidad', 'u');
INSERT INTO unidades_medida (id, nombre, simbolo) VALUES (2, 'Kilogramo', 'kg');
INSERT INTO unidades_medida (id, nombre, simbolo) VALUES (3, 'Litro', 'L');

INSERT INTO tipos_documento (id, nombre) VALUES (1, 'IVA 10%');
INSERT INTO tipos_documento (id, nombre) VALUES (2, 'IVA 5%');
INSERT INTO tipos_documento (id, nombre) VALUES (3, 'Exento');

INSERT INTO producto (id, nombre, descripcion, categoria_id, unidad_medida_id, precio_referencia, codigo_interno, codigo_barra, iva_tipo, costo_promedio) VALUES (1, 'Laptop', 'Laptop de 15 pulgadas', 1, 1, 1200.00, 'PROD001', '1234567890123', 'IVA 10%', 800.00);
INSERT INTO producto (id, nombre, descripcion, categoria_id, unidad_medida_id, precio_referencia, codigo_interno, codigo_barra, iva_tipo, costo_promedio) VALUES (2, 'Manzanas', 'Manzanas rojas', 2, 2, 2.50, 'PROD002', '0987654321098', 'IVA 5%', 1.50);
INSERT INTO producto (id, nombre, descripcion, categoria_id, unidad_medida_id, precio_referencia, codigo_interno, codigo_barra, iva_tipo, costo_promedio) VALUES (3, 'Camiseta', 'Camiseta de algodón', 3, 1, 25.00, 'PROD003', '5432109876543', 'IVA 10%', 10.00);