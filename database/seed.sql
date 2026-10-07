-- ============================================================================
-- 🏍️ MOTOPRO WORKSHOP ERP & POS SYSTEM
-- Archivo: seed.sql (PostgreSQL 14+)
-- Descripción: Datos demo completos y consistentes para pruebas del ecosistema MotoPro:
--              - Sedes y usuarios operativos (Carlos M., Laura Gómez, Andrés López)
--              - Bahías de trabajo y elevadores
--              - Clientes y motocicletas (KTM 1290 Super Adventure S / Placa JKL-92D)
--              - Catálogo baremo y catálogo de repuestos OEM con Kardex
--              - Orden de Trabajo OT-1048 con peritaje 360°, tiempos y repuestos
--              - Liquidación Split Payment y Factura Electrónica DIAN
--              - Turno de Caja POS con Arqueo Ciego (Reporte Z) y Vales de Caja Menor
-- ============================================================================

BEGIN;

-- ============================================================================
-- 1. INFRAESTRUCTURA ORGANIZACIONAL (SEDES & ACCESOS)
-- ============================================================================

INSERT INTO sedes (id, nombre, nit_identificacion, direccion, telefono, email, ciudad, pais, prefijo_facturacion, consecutivo_factura_actual, resolucion_dian, fecha_limite_resolucion, activo)
VALUES 
(
    'SEDE-CENTRAL-01',
    'Sede Central - Taller & POS Norte',
    '901.482.903-1',
    'Calle 127 # 45-19, Polo Club',
    '+57 1 745 9000',
    'contacto@motopro.com.co',
    'Bogotá D.C.',
    'Colombia',
    'SETT',
    99000148,
    'DIAN Res. No. 18764029104 de 2023-01-15 (Rango 99000001 al 99050000)',
    '2025-01-15',
    TRUE
),
(
    'SEDE-OCCIDENTE-02',
    'Sede Calle 80 - Express & Flotas',
    '901.482.903-1',
    'Av. Calle 80 # 69-45',
    '+57 1 745 9002',
    'sede80@motopro.com.co',
    'Bogotá D.C.',
    'Colombia',
    'SETO',
    1001,
    'DIAN Res. No. 18764029881 de 2023-06-20 (Rango 1001 al 50000)',
    '2025-06-20',
    TRUE
)
ON CONFLICT (id) DO NOTHING;

-- Usuarios y Operarios del Sistema
-- Passwords hasheadas con bcrypt ($2a$10$...) equivalentes a 'MotoPro2024*'
INSERT INTO usuarios (id, username, password_hash, pin_supervisor, nombre_completo, email, telefono, rol, sede_id, tarifa_costo_hora, activo)
VALUES 
(
    'USR-001',
    'carlos.m@motopro.com',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Carlos M. (Jefe de Taller / Supervisor)
    '8921',
    'Carlos Mendoza',
    'carlos.m@motopro.com',
    '+57 310 892 1100',
    'JEFE_TALLER',
    'SEDE-CENTRAL-01',
    35.00,
    TRUE
),
(
    'USR-892',
    'laura.gomez',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Laura Gómez (Cajera POS)
    NULL,
    'Laura Gómez',
    'laura.gomez@motopro.com',
    '+57 315 442 8891',
    'CAJERO_POS',
    'SEDE-CENTRAL-01',
    18.50,
    TRUE
),
(
    'USR-415',
    'andres.lopez',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Andrés López (Mecánico Líder Bahía B-04)
    NULL,
    'Andrés López',
    'andres.lopez@motopro.com',
    '+57 320 611 7482',
    'MECANICO',
    'SEDE-CENTRAL-01',
    25.00,
    TRUE
),
(
    'USR-102',
    'felipe.sarmiento',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Asesor de Servicio Recepción
    NULL,
    'Felipe Sarmiento',
    'felipe.s@motopro.com',
    '+57 311 980 2314',
    'ASESOR_SERVICIO',
    'SEDE-CENTRAL-01',
    22.00,
    TRUE
),
(
    'USR-205',
    'jorge.bodega',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Almacenista Kardex
    NULL,
    'Jorge Morales',
    'jorge.m@motopro.com',
    '+57 318 733 9012',
    'ALMACENISTA',
    'SEDE-CENTRAL-01',
    20.00,
    TRUE
),
(
    'USR-900',
    'guardia.porteria',
    '$2a$10$wT0X8P2K8YV1eFm6XoVq2eS8A3YpEaJ9Xb1QW9L2KmN4OpQrStUvW', -- Vigilante Control Pase Salida
    NULL,
    'Héctor Fabio Ruiz',
    'porteria@motopro.com',
    '+57 300 211 4455',
    'VIGILANTE_PORTERIA',
    'SEDE-CENTRAL-01',
    15.00,
    TRUE
)
ON CONFLICT (id) DO NOTHING;

-- Bahías y Elevadores de Trabajo
INSERT INTO bahias (id, sede_id, codigo_visual, tipo_elevador, mecanico_asignado_id, estado)
VALUES 
('B-01', 'SEDE-CENTRAL-01', 'Elevador 1 - Mantenimiento Rápido', 'Pneumático Plataforma 600kg', 'USR-415', 'LIBRE'),
('B-02', 'SEDE-CENTRAL-01', 'Elevador 2 - Diagnóstico & Scanner', 'Tijera Hidráulica 800kg', NULL, 'LIBRE'),
('B-03', 'SEDE-CENTRAL-01', 'Elevador 3 - Motor & Cajas', 'Hidráulico 2 Postes 1000kg', NULL, 'OCUPADA'),
('B-04', 'SEDE-CENTRAL-01', 'Elevador 4 - Bahía Principal Big Trail', 'Hidráulico 2 Postes (800 kg)', 'USR-415', 'OCUPADA'),
('B-05', 'SEDE-CENTRAL-01', 'Elevador 5 - Suspensiones & Frenos', 'Plataforma Elevadora 700kg', NULL, 'LIBRE'),
('B-06', 'SEDE-CENTRAL-01', 'Elevador 6 - Eléctrico & Calibración', 'Tijera Pantógrafo 500kg', NULL, 'MANTENIMIENTO')
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- 2. CLIENTES & MOTOCICLETAS (PARQUE AUTOMOTOR)
-- ============================================================================

-- Clientes Principales Demo
INSERT INTO clientes (id, tipo_documento, documento, nombre, email, telefono_whatsapp, direccion, ciudad, es_flota_comercial, cupo_credito_flota, saldo_pendiente_credito, activo)
VALUES 
(
    'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d',
    'CC',
    '79.845.120',
    'Roberto Valencia Ospina',
    'roberto.valencia@gmail.com',
    '+573124589021',
    'Carrera 15 # 98-42 Apto 502',
    'Bogotá D.C.',
    FALSE,
    0.00,
    0.00,
    TRUE
),
(
    'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e',
    'NIT',
    '900.812.345-9',
    'Logística & Domicilios Express S.A.S.',
    'operaciones@domiexpress.co',
    '+573105559812',
    'Av. El Dorado # 68C-61 Bodega 4',
    'Bogotá D.C.',
    TRUE,
    15000000.00,
    2840000.00,
    TRUE
),
(
    'c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f',
    'CC',
    '1.018.452.990',
    'Mariana Gómez Restrepo',
    'mariana.gomez@outlook.com',
    '+573007891234',
    'Calle 140 # 11-20',
    'Bogotá D.C.',
    FALSE,
    0.00,
    0.00,
    TRUE
)
ON CONFLICT (documento) DO NOTHING;

-- Motocicletas Vinculadas
INSERT INTO vehiculos (id, placa, vin_chasis, marca, modelo, anio_modelo, cilindraje_cc, color, propietario_id, odometro_ultimo_km)
VALUES 
(
    'f1e2d3c4-b5a6-7980-1234-56789abcdef0',
    'JKL-92D',
    'VBKVA9400PM128941',
    'KTM',
    '1290 Super Adventure S',
    2023,
    1301,
    'Naranja / Negro Mate',
    'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d',
    11452
),
(
    'f2e3d4c5-b6a7-8091-2345-6789abcdef01',
    'WXY-45F',
    'JYARN29E8HA012984',
    'Yamaha',
    'MT-09 SP',
    2022,
    890,
    'Icon Blue / Silver',
    'c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f',
    18200
),
(
    'f3e4d5c6-b7a8-9102-3456-789abcdef012',
    'QRT-18E',
    'WB10J9109PZ984102',
    'BMW',
    'R 1250 GS Adventure HP',
    2021,
    1254,
    'Motorsport Rallye',
    'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e',
    34150
)
ON CONFLICT (placa) DO NOTHING;

-- ============================================================================
-- 3. CATÁLOGO BAREMO (TIEMPOS ESTÁNDAR) & PRODUCTOS REPUESTOS (KARDEX)
-- ============================================================================

INSERT INTO catalogo_baremo (id, codigo_interno, descripcion, categoria_servicio, cilindraje_segmento, horas_estandar, tarifa_base_usd, activo)
VALUES 
('MO-MANT-10K', 'BAR-LC8-10K', 'Mantenimiento preventivo mayor 10.000 km KTM LC8', 'Motor & General', 'MAYOR_600CC', 3.50, 25.00, TRUE),
('BAR-FREN-DEL', 'BAR-BRK-FRT', 'Cambio de pastillas delanteras + purga hidráulica con DOT 5.1', 'Frenos', 'MAYOR_600CC', 0.80, 25.00, TRUE),
('BAR-SINC-INY', 'BAR-INJ-SYN', 'Sincronización de cuerpos de aceleración y bujías Iridium', 'Alimentación', 'MAYOR_600CC', 1.50, 25.00, TRUE),
('BAR-KIT-ARRA', 'BAR-DRV-KIT', 'Sustitución de kit de arrastre (cadena, piñón y corona) + torque', 'Transmisión', 'MAYOR_600CC', 1.20, 25.00, TRUE),
('BAR-RET-SUSP', 'BAR-SUS-SEAL', 'Cambio de retenedores y aceite de barras invertidas WP 48mm', 'Suspensión', 'MAYOR_600CC', 2.50, 25.00, TRUE)
ON CONFLICT (id) DO NOTHING;

-- Catálogo de Repuestos e Insumos
INSERT INTO productos_repuestos (sku, codigo_barras, descripcion, categoria, marca_fabricante, unidad_medida, precio_venta_usd, porcentaje_iva, aplica_garantia_fabrica)
VALUES 
('KTM-6030-8015', '7613317058291', 'Kit Filtro de Aceite OEM KTM LC8 (Filtro + Tamices + O-rings)', 'Filtros', 'KTM PowerParts', 'KIT', 45.00, 19.00, TRUE),
('MOTUL-7100-10W50', '3374650247261', 'Aceite Sintético Motul 7100 4T 10W50 Ester (Litro)', 'Lubricantes', 'Motul', 'LITRO', 22.50, 19.00, TRUE),
('BREMBO-07BB38SA', '8020584518392', 'Juego Pastillas de Freno Delanteras Brembo Sinterizadas SA', 'Frenos', 'Brembo', 'KIT', 68.00, 19.00, TRUE),
('MOTUL-DOT51-500', '3374650005120', 'Líquido de Frenos Sintético Motul Brake Fluid DOT 5.1 (500ml)', 'Químicos & Fluidos', 'Motul', 'UNIDAD', 14.50, 19.00, TRUE),
('NGK-LMAR9AI8', '087295193080', 'Bujía Láser Iridium NGK LMAR9AI-8 KTM 1290', 'Encendido', 'NGK Spark Plugs', 'UNIDAD', 26.00, 19.00, TRUE),
('KTM-6030-1002', '7613317094812', 'Filtro de Aire de Alto Rendimiento KTM Adventure 1290', 'Filtros', 'KTM PowerParts', 'UNIDAD', 54.00, 19.00, TRUE)
ON CONFLICT (sku) DO NOTHING;

-- Stock por Sede
INSERT INTO inventario_stock_sedes (sku, sede_id, ubicacion_estanteria, stock_actual, stock_minimo_alerta, stock_maximo, costo_promedio_ponderado_cop, costo_promedio_ponderado_usd)
VALUES 
('KTM-6030-8015', 'SEDE-CENTRAL-01', 'Pasillo C - Estante 04 - Gaveta 12', 14.00, 4.00, 25.00, 125000.00, 31.25),
('MOTUL-7100-10W50', 'SEDE-CENTRAL-01', 'Pasillo A - Estante 01 - Nivel Suelo', 48.00, 12.00, 100.00, 62000.00, 15.50),
('BREMBO-07BB38SA', 'SEDE-CENTRAL-01', 'Pasillo C - Estante 02 - Gaveta 08', 8.00, 2.00, 16.00, 192000.00, 48.00),
('MOTUL-DOT51-500', 'SEDE-CENTRAL-01', 'Pasillo A - Estante 03 - Gaveta 04', 18.00, 5.00, 30.00, 38000.00, 9.50),
('NGK-LMAR9AI8', 'SEDE-CENTRAL-01', 'Pasillo B - Estante 01 - Gaveta 19', 24.00, 8.00, 40.00, 72000.00, 18.00),
('KTM-6030-1002', 'SEDE-CENTRAL-01', 'Pasillo C - Estante 03 - Gaveta 01', 6.00, 2.00, 12.00, 148000.00, 37.00)
ON CONFLICT (sku, sede_id) DO NOTHING;

-- ============================================================================
-- 4. ORDEN DE TRABAJO PRINCIPAL (OT-1048) Y DETALLE PERICIAL 360°
-- ============================================================================

INSERT INTO ordenes_trabajo (
    id, sede_id, vehiculo_id, cliente_id, asesor_id, mecanico_lider_id, bahia_id,
    estado, odometro_entrada_km, nivel_combustible, motivo_ingreso_falla, diagnostico_inicial,
    accesorios_inventario,
    total_mano_obra_estimada, total_repuestos_estimado, descuento_valor, subtotal_usd,
    impuesto_iva_usd, total_general_usd, trm_aplicada, total_general_cop,
    token_aprobacion_whatsapp, aprobada_por_cliente, fecha_aprobacion_cliente,
    firma_digital_aprobacion_hash, pase_porteria_qr_token, salida_autorizada_porteria,
    created_at, fecha_promesa_entrega
)
VALUES 
(
    'OT-1048',
    'SEDE-CENTRAL-01',
    'f1e2d3c4-b5a6-7980-1234-56789abcdef0',
    'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d',
    'USR-102',
    'USR-415',
    'B-04',
    'LIQUIDADO_PAGADO',
    11452,
    '1_2',
    'Mantenimiento programado de 10.000 km, vibración leve en tren delantero al frenar fuerte y revisión de niveles generales.',
    'Se evidencia desgaste en pastillas delanteras Brembo (espesor crítico 1.2 mm). Aceite de motor degradado con 6.200 km de uso. Se recomienda cambio de kit de filtros LC8, aceite Motul 7100 y purga completa de líquido DOT 5.1.',
    '["Maletero Top Case Givi Trekker 58L", "Defensas Altas Outback Motortek", "Faros Exploradoras LED Denali D4", "Soporte GPS Garmin"]'::jsonb,
    107.50, -- Mano de obra (3.5h mant + 0.8h frenos = 4.3h * $25)
    154.00, -- Repuestos ($45 filtro + $3.6L aceite $78.75 + $14.50 DOT + $15.75 arandelas/miscelaneos)
    0.00,
    261.50,
    49.65,  -- IVA 19%
    311.15, -- Total USD
    4001.20,
    1245000.00, -- Total COP redond.
    'wapp-tok-7e9b0e3f81e3a6a9dbfe0f82d2f782c5a2c4e976',
    TRUE,
    CURRENT_TIMESTAMP - INTERVAL '4 hours',
    'sha256-8c92f1b4a83e0c4b6f1295b9c025da1e71239845ab3d19827401dce9048a12bc',
    'MOTOPRO-PASS-OT1048-VALID-2023',
    TRUE,
    CURRENT_TIMESTAMP - INTERVAL '6 hours',
    CURRENT_TIMESTAMP + INTERVAL '2 hours'
)
ON CONFLICT (id) DO NOTHING;

-- Marcadores del Peritaje Visual 360° sobre la KTM 1290
INSERT INTO peritaje_danos_360 (ot_id, zona_silueta, coordenada_x_pct, coordenada_y_pct, tipo_dano, severidad, observacion, foto_evidencia_url)
VALUES 
(
    'OT-1048',
    'lateral_izquierdo_carenaje',
    34.50,
    42.00,
    'RAYON',
    'LEVE',
    'Rayón superficial en adhesivo gráfico KTM Ready to Race por roce de bota off-road',
    'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80'
),
(
    'OT-1048',
    'defensa_tubular_derecha',
    62.10,
    58.40,
    'GOLPE',
    'LEVE',
    'Raspadura de pintura en tubo inferior de defensa por caída en parado sobre gravilla',
    'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80'
),
(
    'OT-1048',
    'protector_escape_akrapovic',
    78.20,
    68.90,
    'RAYON',
    'LEVE',
    'Marcas térmicas leves en protector de fibra de carbono',
    NULL
);

-- Evidencias Multimedia de Bahía (Fotos periciales y Notas de Voz)
INSERT INTO evidencias_bahia (ot_id, operario_id, tipo_archivo, url_almacenamiento, duracion_segundos, tamano_bytes, descripcion, compartido_al_cliente_whatsapp)
VALUES 
(
    'OT-1048',
    'USR-415',
    'FOTO_DESGASTE',
    'https://images.unsplash.com/photo-1486006920555-c77dce18193b?auto=format&fit=crop&w=800&q=80',
    NULL,
    2450890,
    'Pastillas de freno delanteras originales con desgaste en canal testigo al límite de tolerancia (1.2mm)',
    TRUE
),
(
    'OT-1048',
    'USR-415',
    'AUDIO_VOZ_TECNICA',
    'https://api.motopro.com.co/storage/audio/nota-voz-ot1048-andres.mp3',
    42,
    512000,
    'Explicación técnica del mecánico Andrés López detallando necesidad de sustitución de fluido DOT 5.1 y pastillas',
    TRUE
);

-- Mano de Obra Desglosada en la OT
INSERT INTO ot_mano_obra_items (ot_id, baremo_id, descripcion_tarea, horas_cotizadas, tarifa_hora_usd, subtotal_usd, mecanico_asignado_id, aprobado_por_cliente, completado)
VALUES 
('OT-1048', 'MO-MANT-10K', 'Mantenimiento preventivo mayor 10.000 km KTM LC8', 3.50, 25.00, 87.50, 'USR-415', TRUE, TRUE),
('OT-1048', 'BAR-FREN-DEL', 'Cambio de pastillas delanteras + purga hidráulica con DOT 5.1', 0.80, 25.00, 20.00, 'USR-415', TRUE, TRUE);

-- Cronómetro de Labor Operario (Clock-in / Clock-out)
INSERT INTO labor_operario_cronometro (ot_id, operario_id, bahia_id, hora_inicio, hora_fin, minutos_laborados, observacion_trabajo, costo_mano_obra_calculado)
VALUES 
('OT-1048', 'USR-415', 'B-04', CURRENT_TIMESTAMP - INTERVAL '5 hours', CURRENT_TIMESTAMP - INTERVAL '1 hour 45 minutes', 195, 'Ejecución completa de servicio de 10k km, cambio de filtros, aceite y purga de frenos delanteros y traseros', 81.25);

-- Ítems de Repuestos Despachados a la OT-1048
INSERT INTO ot_repuestos_items (ot_id, sku, cantidad, precio_unitario_usd, subtotal_usd, despachado_desde_almacen, fecha_despacho, almacenista_id, aprobado_por_cliente)
VALUES 
('OT-1048', 'KTM-6030-8015', 1.00, 45.00, 45.00, TRUE, CURRENT_TIMESTAMP - INTERVAL '4 hours', 'USR-205', TRUE),
('OT-1048', 'MOTUL-7100-10W50', 3.50, 22.50, 78.75, TRUE, CURRENT_TIMESTAMP - INTERVAL '4 hours', 'USR-205', TRUE),
('OT-1048', 'MOTUL-DOT51-500', 1.00, 14.50, 14.50, TRUE, CURRENT_TIMESTAMP - INTERVAL '4 hours', 'USR-205', TRUE),
('OT-1048', 'BREMBO-07BB38SA', 1.00, 68.00, 68.00, FALSE, NULL, NULL, FALSE); -- Cotizado como opcional para proximo cambio

-- Movimientos Kardex por el despacho a bahía
INSERT INTO kardex_movimientos (sede_id, sku, tipo_movimiento, cantidad, costo_unitario_usd, costo_total_usd, saldo_stock_resultante, ot_id, mecanico_solicitante_id, usuario_registro_id, motivo_detalle)
VALUES 
('SEDE-CENTRAL-01', 'KTM-6030-8015', 'SALIDA_DESPACHO_OT', 1.00, 31.25, 31.25, 14.00, 'OT-1048', 'USR-415', 'USR-205', 'Despacho a elevador Bahía B-04 para OT-1048'),
('SEDE-CENTRAL-01', 'MOTUL-7100-10W50', 'SALIDA_DESPACHO_OT', 3.50, 15.50, 54.25, 48.00, 'OT-1048', 'USR-415', 'USR-205', 'Aceite para motor LC8 1301cc OT-1048'),
('SEDE-CENTRAL-01', 'MOTUL-DOT51-500', 'SALIDA_DESPACHO_OT', 1.00, 9.50, 9.50, 18.00, 'OT-1048', 'USR-415', 'USR-205', 'Purga y cambio de líquido circuito frenos OT-1048');

-- ============================================================================
-- 5. CAJA POS, SPLIT PAYMENT, VALES DE CAJA MENOR Y REPORTE Z
-- ============================================================================

-- Turno de Caja del Día (Laura Gómez)
INSERT INTO caja_turnos (
    id, sede_id, terminal_codigo, cajero_id, fecha_apertura, saldo_base_apertura_usd, saldo_base_apertura_cop,
    fecha_cierre, supervisor_cierre_id, consecutivo_reporte_z,
    total_ventas_brutas_usd, total_vales_menores_usd, total_esperado_caja_usd, total_arqueado_fisico_usd, diferencia_cuadre_usd,
    estado_terminal
)
VALUES 
(
    'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b',
    'SEDE-CENTRAL-01',
    'POS-01-MOSTRADOR',
    'USR-892',
    CURRENT_TIMESTAMP - INTERVAL '8 hours',
    200.00,
    800000.00,
    CURRENT_TIMESTAMP - INTERVAL '15 minutes',
    'USR-001',
    'Z-2023-10-18-001',
    1845.50,
    65.00,
    1980.50, -- Base $200 + Ventas $1845.50 - Egresos $65 = $1,980.50
    1980.50,
    0.00,    -- Cuadre perfecto exacto
    'CERRADA_REPORTED_Z'
)
ON CONFLICT (consecutivo_reporte_z) DO NOTHING;

-- Arqueo Ciego Físico Registrado por Laura Gómez (Conteo tangible sin ver saldo del sistema)
INSERT INTO arqueo_ciego_denominaciones (
    caja_turno_id,
    denominacion_100_usd, denominacion_50_usd, denominacion_20_usd, denominacion_10_usd, denominacion_5_usd, denominacion_1_usd, total_conteo_usd,
    denominacion_100k_cop, denominacion_50k_cop, denominacion_20k_cop, denominacion_10k_cop, denominacion_5k_cop, denominacion_monedas_cop, total_conteo_cop,
    total_vouchers_redeban_usd, total_vouchers_credibanco_usd, total_qr_transferencias_usd, cantidad_comprobantes_vouchers
)
VALUES 
(
    'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b',
    4, 2, 8, 5, 0, 0, 710.00, -- Billetes USD ($400 + $100 + $160 + $50 = $710 USD)
    12, 14, 10, 0, 0, 0, 2100000.00, -- Billetes COP (1.2M + 700k + 200k = $2'100.000 COP ~ $525 USD)
    680.50, -- Redeban
    455.00, -- Credibanco
    65.00,  -- Nequi / Bancolombia QR
    14      -- 14 vouchers firmados
);

-- Egresos y Vales de Caja Menor (Ctrl+M)
INSERT INTO vales_caja_menor (caja_turno_id, sede_id, monto_usd, monto_cop, concepto_gasto, beneficiario, numero_comprobante, cajero_id, autorizado_supervisor_id, recibo_soporte_foto_url)
VALUES 
(
    'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b',
    'SEDE-CENTRAL-01',
    40.00,
    160048.00,
    'Compra de 2 aerosoles limpiador de frenos urgente Wurth 500ml',
    'Repuestos & Químicos El Motorista',
    'VALE-2023-0041',
    'USR-892',
    'USR-001',
    'https://images.unsplash.com/photo-1554415707-9e49666ff04e?auto=format&fit=crop&w=600&q=80'
),
(
    'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b',
    'SEDE-CENTRAL-01',
    25.00,
    100030.00,
    'Refrigerio e hidratación de operarios en jornada extendida de taller',
    'Panadería & Cafetería El Prado',
    'VALE-2023-0042',
    'USR-892',
    'USR-001',
    NULL
)
ON CONFLICT (numero_comprobante) DO NOTHING;

-- Liquidación de Caja para la OT-1048
INSERT INTO liquidaciones_caja (
    id, caja_turno_id, ot_id, numero_recibo, total_orden_usd, total_cobrado_usd, total_cobrado_cop,
    saldo_pendiente_usd, trm_cobro, apertura_gaveta_ejecutada, created_at
)
VALUES 
(
    'c1d2e3f4-a5b6-7c8d-9e0f-1a2b3c4d5e6f',
    'e1f2a3b4-c5d6-7e8f-9a0b-1c2d3e4f5a6b',
    'OT-1048',
    'REC-POS-00892',
    311.15,
    311.15,
    1245000.00,
    0.00,
    4001.20,
    TRUE,
    CURRENT_TIMESTAMP - INTERVAL '1 hour'
)
ON CONFLICT (numero_recibo) DO NOTHING;

-- Desglose Split Payment de la Liquidación (Efectivo bimoneda + Datáfono Redeban)
INSERT INTO liquidacion_pagos_split (liquidacion_id, metodo, monto_usd, monto_cop, referencia_voucher_autorizacion, entidad_financiera, porcentaje_sobre_total)
VALUES 
(
    'c1d2e3f4-a5b6-7c8d-9e0f-1a2b3c4d5e6f',
    'EFECTIVO_USD',
    100.00,
    400120.00,
    'BILLETES-100-USD-SERIE-LK89',
    'Caja Mostrador',
    32.14
),
(
    'c1d2e3f4-a5b6-7c8d-9e0f-1a2b3c4d5e6f',
    'DATAFONO_REDEBAN',
    211.15,
    844880.00,
    'AUTH-892182',
    'Redeban Visa Signature **** 4129',
    67.86
);

-- ============================================================================
-- 6. FACTURACIÓN ELECTRÓNICA DIAN (UBL 2.1 & CUFE)
-- ============================================================================

INSERT INTO facturas_electronicas_dian (
    sede_id, ot_id, cliente_id, liquidacion_id, numero_factura, prefijo, consecutivo,
    subtotal_bruto_cop, descuentos_cop, base_gravable_cop, iva_19_cop, retencion_fuente_cop, retencion_ica_cop, total_neto_factura_cop,
    cufe, algoritmo_firma, xml_ubl_firmado, qr_cadena_validacion, estado_dian, codigo_respuesta_dian, descripcion_respuesta_dian,
    url_pdf_a4_descarga, enviada_email_cliente, fecha_emision
)
VALUES 
(
    'SEDE-CENTRAL-01',
    'OT-1048',
    'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d',
    'c1d2e3f4-a5b6-7c8d-9e0f-1a2b3c4d5e6f',
    'SETT-99000148',
    'SETT',
    99000148,
    1046200.00,
    0.00,
    1046200.00,
    198800.00,
    0.00,
    0.00,
    1245000.00,
    '8c92f1b4a83e0c4b6f1295b9c025da1e71239845ab3d19827401dce9048a12bc8f42194619a90b4e2840c',
    'SHA-384',
    '<?xml version="1.0" encoding="UTF-8"?><Invoice xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"...><cbc:ID>SETT-99000148</cbc:ID></Invoice>',
    'NumFac=SETT-99000148&FecFac=2023-10-18&NitFac=901482903&DocAdq=79845120&ValFac=1046200.00&ValIva=198800.00&ValOtroIm=0.00&ValTolFac=1245000.00&CUFE=8c92f1b4a83e0c4b6f1295b9c025da1e71239845ab3d19827401dce9048a12bc8f42194619a90b4e2840c',
    'ACEPTADA_CON_NOTIFICACION',
    '00',
    'Documento recibido y validado satisfactoriamente por la DIAN con firma digital vigente.',
    'https://api.motopro.com.co/docs/facturas/factura-sett-99000148.pdf',
    TRUE,
    CURRENT_TIMESTAMP - INTERVAL '50 minutes'
)
ON CONFLICT (numero_factura) DO NOTHING;

-- ============================================================================
-- 7. GESTIÓN DE GARANTÍAS A FÁBRICA (DEMO COMPLEMENTARIO)
-- ============================================================================

INSERT INTO reclamos_garantia_fabrica (
    numero_radicado_expediente, sede_id, ot_id, sku_repuesto, marca_ensambladora,
    estado, descripcion_falla_defecto, diagnostico_escaner_texa, foto_pieza_averiada_url,
    etiqueta_qr_cuarentena, monto_reclamado_usd, monto_aprobado_usd, numero_nota_credito_proveedor, fecha_resolucion
)
VALUES 
(
    'GAR-KTM-2023-089',
    'SEDE-CENTRAL-01',
    'OT-1048',
    'KTM-6030-8015',
    'KTM Colombia / Auteco Mobility S.A.S.',
    'EN_EVALUACION_FABRICA',
    'Falla prematura de sensor de presión de aceite O-ring con microfisura de molde en lote 2023-Q2',
    'TEXA IDC5 BIKE - Código de error P0524: Presión de aceite baja intermitente en ralentí (0.8 bar)',
    'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=800&q=80',
    'QR-QUARANTINE-GAR-KTM-2023-089-SEC',
    115.00,
    0.00,
    NULL,
    NULL
)
ON CONFLICT (numero_radicado_expediente) DO NOTHING;

COMMIT;
