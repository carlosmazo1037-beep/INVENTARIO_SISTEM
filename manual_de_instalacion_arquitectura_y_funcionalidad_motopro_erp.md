# 📦 PAQUETE DE IMPLEMENTACIÓN & MANUALES TÉCNICOS
## MotoPro Workshop ERP & POS System v2.4 (Producción & Sandbox)

---

### 📋 ÍNDICE GENERAL DE LA ENTREGA
1. **Alcance Global del Proyecto y Módulos Desarrollados**
2. **Estructura del Repositorio de Archivos (Frontend, Base de Datos, Docs)**
3. **Manual de Instalación y Despliegue Paso a Paso**
   - 3.1. Prueba Local Inmediata (Zero-Config / Sin Servidor)
   - 3.2. Despliegue en Servidor Web (Nginx / Apache / GitHub Pages / Vercel)
   - 3.3. Despliegue y Migración de Base de Datos PostgreSQL 14+ (`schema.sql` y `seed.sql`)
4. **Manual de Integración Backend & API REST (`window.MOTOPRO_CONFIG` y OpenAPI 3.0.3)**
5. **Manual de Hardware de Taller y Punto de Venta (POS)**
   - 5.1. Impresoras Térmicas 80mm ESC/POS (Epson / Star / Bixolon)
   - 5.2. Gaveta de Dinero Monedero (Pulso Eléctrico RJ11)
   - 5.3. Datáfonos SmartPOS (Redeban / Credibanco) y QRs
   - 5.4. Escáner Óptico de Código de Barras / QR USB & Bluetooth
6. **Manual Funcional por Roles y Flujos Guiados (End-to-End)**
   - 6.1. Asesor de Servicio: Recepción 360° ➔ Cotización Baremo ➔ Aprobación Digital WhatsApp
   - 6.2. Mecánico de Bahía: PWA Táctil ➔ Cronómetro ➔ Evidencias Foto/Voz ➔ Despacho Kardex
   - 6.3. Cajero POS: Liquidación Split Payment ➔ Tirilla ➔ Factura DIAN ➔ Arqueo Ciego Reporte Z
   - 6.4. Almacenista: Kardex, Galería OEM con Zoom y Command Palette (`Ctrl + K`)
   - 6.5. Jefe de Taller & Admin: Garantías Fábrica, Tarifas de Sedes y Bahías
7. **Credenciales de Acceso Demo & Entorno de Pruebas**

---

## 1. 🎯 ALCANCE GLOBAL DEL PROYECTO HASTA EL MOMENTO

El proyecto **MotoPro Workshop ERP** comprende un ecosistema integral y modular con **24 interfaces visuales interconectadas**, persistencia relacional SQL, especificación formal OpenAPI y directivas de hardware:

### Módulos Implementados en Frontend & Lógica:
1. **Acceso & Seguridad Multiusuario (`login-multiusuario.html`):** Autenticación basada en roles (RBAC), selector dinámico de sedes y PIN supervisor para autorizaciones críticas.
2. **Terminal de Caja POS & Dashboard (`dashboard-pos.html`):** Resumen de facturación del día, órdenes listas para retiro, monitoreo de periféricos de hardware en tiempo real.
3. **Tablero Kanban de Taller (`ordenes-taller.html`):** Supervisión en vivo de bahías (`B-01` a `B-08`), estados de trabajo, mecánicos asignados y alertas de tiempo.
4. **Recepción con Peritaje Visual 360° (`recepcion-inspeccion.html`):** Checklist de inventario (combustible, accesorios, odómetro), marcado pericial sobre silueta técnica con coordenadas interactivas y firma digital de custodia.
5. **Diagnóstico Técnico y Baremo (`diagnostico-cotizacion.html`):** Liquidación con baremo de tiempos estándar (*Flat Rate* por cilindraje), repuestos OEM con margen de ganancia y generación de token seguro para WhatsApp.
6. **Portal Cliente en WhatsApp (`portal-cliente-whatsapp.html`):** Interfaz ligera móvil sin instalación previa para visualización de evidencias multimedia (fotos de desgaste y audio del mecánico) con aprobación ítem por ítem.
7. **Confirmación Exitosa & Firma Criptográfica (`confirmacion-firma-digital.html`):** Captura de firma manuscrita digitalizada, generación de hash de seguridad SHA-256 y emisión de acta de aprobación.
8. **Bahía Táctil de Mecánico (`bahia-mecanico-tactil.html`):** Modo de alto contraste para tablets/smartphones en elevadores: cronómetro en vivo de labor (*Clock-in / Clock-out*), checklist táctil (≥48px) y solicitud a bodega.
9. **Captura de Evidencias de Bahía (`captura-evidencias-voz.html`):** Disparador de cámara para registrar piezas averiadas y grabador de notas de voz técnicas de hasta 60s.
10. **Kardex & Inventario con Galería Técnica OEM (`inventario-movimientos.html`):** Catálogo multisede, trazabilidad de remisiones físicas, visor modal con zoom dinámico de 2.5x para detalles de molde e inspección de autenticidad.
11. **Búsqueda Rápida Universal (`Ctrl + K` Command Palette):** Atajo predictivo multicriterio por placa, cliente, SKU o repuesto compatible, con sincronización de lector de código de barras.
12. **Entrada de Compras a Proveedores (`entrada-compra.html`):** Ingreso con lote, orden de compra, ubicación en estante y costeo promedio ponderado.
13. **Salida / Despacho a Bahía (`salida-despacho.html`):** Descarga blindada contra OT activa con firma de recepción del operario.
14. **Liquidación Final de Caja (`factura-liquidacion.html`):** Pago mixto (*Split Payment*) combinando efectivo bimoneda (USD / COP con TRM), datáfonos Redeban/Credibanco y código QR de **Pase de Salida / Portería**.
15. **Tirilla Térmica de Caja POS 80mm (`tirilla-pos-80mm.html`):** Formato ESC/POS para impresoras térmicas con QR fiscal, CUFE y talón desprendible.
16. **Factura Electrónica Fiscal DIAN PDF A4 (`factura-dian-pdf-a4.html`):** Cumplimiento formal fiscal estándar UBL 2.1 con firma digital XML, QR de validación y retenciones de ley.
17. **Arqueo Ciego & Cierre Fiscal - Reporte Z (`arqueo-cierre-reporte-z.html`):** Conteo tangible por denominación de billetes y monedas sin ver saldo del sistema, conciliación de vouchers y bloqueo de terminal.
18. **Egresos y Vales de Caja Menor (`egresos-caja-menor.html` / `Ctrl + M`):** Salida express de caja para insumos urgentes autorizada con PIN de supervisor.
19. **Gestión de Formas de Pago (`formas-de-pago.html`):** Parametrización de pasarelas, comisiones bancarias y latencia de periféricos.
20. **Garantías y Reclamos a Ensambladora (`garantias-reclamos.html`):** Módulo de seguimiento de piezas con falla de fábrica, notas de crédito y cuarentena.
21. **Modal Radicar Garantía (`modal-radicar-garantia.html`):** Expediente técnico con volcado de diagnóstico OBD2 Texa IDC5 Bike y fotos periciales.
22. **Configuración de Sedes, Tarifas & Usuarios (`configuracion-sedes.html`):** Gestión de sedes, tarifas horarias por segmento de cilindraje y permisos.
23. **Modal de Bahías y Elevadores (`modal-bahias-elevadores.html`):** Configuración de equipamiento técnico por elevador (capacidad en kg y tipo).
24. **Portal Principal y Directorio Interactivo (`index.html`):** Directorio interactivo con explorador de vistas, consola de OpenAPI/Swagger UI interactiva y guías de despliegue.

---

## 2. 🗂️ ESTRUCTURA DEL REPOSITORIO DE ARCHIVOS

```text
motopro-workshop-erp/
│
├── index.html                           # Portal interactivo, consola Swagger UI y showcase
├── README.md                            # Documentación integral del repositorio en GitHub
│
├── desktop/                             # Vistas de Escritorio (ERP, Taller & POS)
│   ├── login-multiusuario.html          # Login multi-sede y selector de rol
│   ├── dashboard-pos.html               # Terminal POS, órdenes listas y balance diario
│   ├── ordenes-taller.html              # Tablero Kanban de taller y bahías
│   ├── recepcion-inspeccion.html        # Recepción 360°, checklist visual e inventario
│   ├── diagnostico-cotizacion.html      # Baremo técnico, repuestos y margen
│   ├── inventario-movimientos.html      # Kardex, galería multi-foto OEM con zoom
│   ├── entrada-compra.html              # Ingreso de mercancía por compra a proveedores
│   ├── salida-despacho.html             # Registro de salida/despacho de piezas a OT
│   ├── facturacion-contabilidad.html    # Facturación, cartera y clientes
│   ├── factura-liquidacion.html         # Liquidación de caja POS y emisión de pase salida
│   ├── factura-dian-pdf-a4.html         # Factura electrónica oficial DIAN en A4
│   ├── tirilla-pos-80mm.html            # Tirilla térmica de 80mm para Epson ESC/POS
│   ├── arqueo-cierre-reporte-z.html     # Arqueo físico ciego y Cierre Fiscal Reporte Z
│   ├── egresos-caja-menor.html          # Vales rápidos de salida de efectivo (Ctrl+M)
│   ├── formas-de-pago.html              # Parametrización de pasarelas y Split Payment
│   ├── garantias-reclamos.html          # Seguimiento de garantías a ensambladora
│   ├── modal-radicar-garantia.html      # Modal de expediente técnico y escáner Texa
│   ├── configuracion-sedes.html         # Sedes, tarifas de mano de obra y accesos
│   └── modal-bahias-elevadores.html     # Modal de equipamiento de bahías
│
├── mobile/                              # Vistas Optimizadas para Móvil y PWA
│   ├── bahia-mecanico-tactil.html       # Terminal táctil del mecánico en elevador con cronómetro
│   ├── captura-evidencias-voz.html      # Cámara pericial de bahía y notas de voz
│   ├── portal-cliente-whatsapp.html     # Visor web ligero para clientes vía WhatsApp
│   └── confirmacion-firma-digital.html  # Comprobante de aprobación con firma criptográfica
│
├── database/                            # Scripts de Base de Datos Relacional PostgreSQL 14+
│   ├── schema.sql                       # DDL: Tipos ENUM, 14 tablas, índices y triggers
│   └── seed.sql                         # DML: Datos demo KTM 1290, Laura Gómez, Carlos M.
│
├── api/                                 # Especificación de Arquitectura de Servicios REST
│   └── openapi-motopro-erp-v2.4.yaml   # Especificación OpenAPI 3.0.3 / Swagger
│
└── assets/                              # Recursos gráficos institucionales
    ├── logo-motopro.png                 # Logotipo vectorial naranja #f97316 y grafito
    └── avatar-carlos-supervisor.png     # Avatar de usuario del jefe de taller
```

---

## 3. 🚀 MANUAL DE INSTALACIÓN Y DESPLIEGUE

### 3.1. Prueba Local Inmediata (Zero-Config)
No requiere Node.js, compiladores ni Docker para la previsualización:
1. Clonar o descomprimir la carpeta del proyecto.
2. Hacer doble clic en `index.html` o abrirlo en cualquier navegador (Chrome, Edge, Safari, Firefox).
3. Toda la suite de pantallas, formularios, Command Palette (`Ctrl+K`), atajos (`Ctrl+M`) y modales funcionarán de forma autónoma.

### 3.2. Despliegue en Servidores Web y Nube
- **GitHub Pages:**
  1. Crear repositorio en GitHub y subir los archivos (`git push origin main`).
  2. En GitHub: **Settings > Pages > Source: Deploy from a branch (`main` / `/ root`)**.
  3. En 2 minutos estará activo en: `https://<tu-usuario>.github.io/<tu-repo>/`.
- **Servidor Nginx (Producción On-Premise en Taller):**
  ```nginx
  server {
      listen 80;
      server_name taller.motopro.local;
      root /var/www/motopro-erp;
      index index.html;

      location / {
          try_files $uri $uri/ /index.html;
      }
      
      # Redirección de llamadas API hacia el backend
      location /api/v1/ {
          proxy_pass http://localhost:8000/v1/;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
      }
  }
  ```

### 3.3. Despliegue de Base de Datos PostgreSQL 14+
El sistema incluye los scripts SQL listos para ejecución en PostgreSQL (con extensiones `uuid-ossp` y `pgcrypto`):

```bash
# 1. Crear base de datos en PostgreSQL
createdb -U postgres motopro_db

# 2. Ejecutar esquema relacional (Tablas, ENUMs, Triggers y Vistas)
psql -U postgres -d motopro_db -f database/schema.sql

# 3. Cargar datos demo completos (Sedes, Usuarios, KTM 1290, Kardex y Caja)
psql -U postgres -d motopro_db -f database/seed.sql
```

---

## 4. 🔌 MANUAL DE INTEGRACIÓN BACKEND & API REST

La suite frontend está desacoplada y se conecta al backend mediante el objeto global `window.MOTOPRO_CONFIG`:

```javascript
window.MOTOPRO_CONFIG = {
  API_BASE_URL: "https://api.tu-taller.com/v1", // O http://localhost:8000/v1
  SEDE_ID: "SEDE-CENTRAL-01",
  TERMINAL_POS_ID: "POS-01-MOSTRADOR",
  EPSON_PRINTER_IP: "192.168.1.150",
  EPSON_PRINTER_PORT: 9100,
  REDEBAN_POS_IP: "192.168.1.180:8088",
  TRM_DEFAULT_COP_USD: 4001.20,
  ENABLE_AUTO_DRAWER_PULSE: true
};
```

La especificación **OpenAPI 3.0.3** contenida en `api/openapi-motopro-erp-v2.4.yaml` documenta los endpoints para:
- `/auth/login`: Autenticación con JWT y sede.
- `/ordenes`: Consulta y seguimiento Kanban.
- `/ordenes/{otId}/labor`: Sincronización del cronómetro de operarios.
- `/inventario/despacho`: Salidas automáticas de Kardex con descuento de stock.
- `/caja/liquidaciones`: Split Payment multimoneda y emisión de código QR de portería.
- `/caja/cierres/reporte-z`: Cierre fiscal con arqueo ciego.
- `/fiscal/dian/facturas`: Validación y timbrado UBL 2.1 con generación de CUFE.

---

## 5. 🖨️ MANUAL DE HARDWARE DE TALLER & POS

### 5.1. Impresoras Térmicas 80mm ESC/POS
- **Modelos Homologados:** Epson TM-T20III, Star TSP143, Bixolon SRP-330II.
- **Protocolo de Impresión:** Raw TCP/IP Socket en puerto `9100` o Spooler nativo del sistema operativo.
- **Comando de Corte Automático:** `GS V 66 0` (Corte total de guillotina tras imprimir el talón de portería).

### 5.2. Gaveta de Dinero Monedero (RJ11)
- Conectada directamente a la toma RJ11 de la impresora térmica.
- Se abre automáticamente tras confirmar la liquidación enviando el pulso hexadecimal: `\x1B\x70\x00\x19\xFA` (24V, 50ms).
- Atajo de emergencia manual en mostrador: Tecla `<kbd>F9</kbd>`.

### 5.3. Datáfonos SmartPOS (Redeban / Credibanco)
- Comunicación por red LAN/Ethernet en el puerto local `8088`.
- El sistema envía el monto (`USD` o `COP`), espera la autorización del cliente y captura el número de voucher (`AUTH-892182`) para vincularlo a la liquidación.

### 5.4. Escáner Óptico de Código de Barras / QR
- Conexión USB o Bluetooth bajo emulación HID (Keyboard Wedge).
- Permite la lectura instantánea en la barra global (`Ctrl + K`), en el módulo de entrada de compras y en la terminal de bahía para registrar los SKU de los repuestos consumidos.

---

## 6. 📖 MANUAL FUNCIONAL POR ROLES

### 6.1. Rol: Asesor de Servicio
1. **Ingreso:** Acceder con usuario (`felipe.sarmiento`) a `recepcion-inspeccion.html`.
2. **Inspección 360°:** Registrar kilometraje, nivel de combustible y tocar en la silueta de la moto para colocar marcadores de daños (rayones, golpes) y adjuntar fotos iniciales.
3. **Firma:** Solicitar firma de custodia al cliente en pantalla táctil y generar orden preliminar.
4. **Cotización:** Ingresar a `diagnostico-cotizacion.html`, seleccionar tareas baremadas y piezas sugeridas. Presionar **«Enviar Enlace WhatsApp»**.
5. **Aprobación:** El cliente recibe la cotización en `portal-cliente-whatsapp.html`, escucha la nota de voz del mecánico, aprueba los ítems y firma digitalmente (`confirmacion-firma-digital.html`).

### 6.2. Rol: Mecánico en Bahía (PWA Táctil)
1. **Inicio de Labor:** En la tablet del elevador (`bahia-mecanico-tactil.html`), el mecánico Andrés López visualiza la moto asignada (`KTM 1290`).
2. **Cronómetro:** Presiona **«Iniciar Labor»** al comenzar los trabajos. El cronómetro registra horas reales para contrastar contra el baremo oficial.
3. **Evidencias:** Si halla desgaste crítico (ej. pastillas de freno en 1.2mm), presiona **«Capturar Evidencia»** (`captura-evidencias-voz.html`), toma la foto pericial y graba una nota de voz explicativa de 30 segundos.
4. **Repuestos:** Solicita las piezas a almacén con un tap en la lista de repuestos.

### 6.3. Rol: Almacenista (Kardex & Repuestos)
1. **Búsqueda Rápida:** Presionar `<kbd>Ctrl</kbd> + <kbd>K</kbd>` en cualquier pantalla para consultar existencias, ubicación en estantería (`Pasillo C-04-12`) y stock crítico.
2. **Inspección Visual OEM:** En `inventario-movimientos.html`, abrir el modal de inspección técnica con zoom `2.5x` para verificar hologramas, sellos de empaque y código troquelado en la pieza.
3. **Despacho:** En `salida-despacho.html`, registrar la salida hacia la orden (`OT-1048`), firmar con el mecánico y descargar el stock en tiempo real.

### 6.4. Rol: Cajera POS Mostrador
1. **Terminal:** En `dashboard-pos.html`, ubicar la orden lista para retiro.
2. **Liquidación Mixta:** En `factura-liquidacion.html`, registrar los métodos de pago (Split Payment): $100 USD en efectivo + balance en datáfono Redeban.
3. **Comprobantes:** Se acciona la gaveta monedero, se imprime la tirilla térmica de 80mm (`tirilla-pos-80mm.html`) con el código QR de **Pase de Salida** y se genera la Factura Electrónica DIAN A4 (`factura-dian-pdf-a4.html`).
4. **Vales de Emergencia:** Con `<kbd>Ctrl</kbd> + <kbd>M</kbd>` (`egresos-caja-menor.html`), registrar salidas rápidas de caja menor con PIN del supervisor.
5. **Cierre de Turno:** Al culminar el turno, acceder a `arqueo-cierre-reporte-z.html`, ingresar el conteo ciego de billetes y vouchers físicos, verificar cuadre exacto ($0.00 de diferencia) y generar el Reporte Z definitivo con bloqueo de terminal.

---

## 7. 🔑 CREDENCIALES Y DATOS DEMO PARA AUDITORÍA

| Rol / Perfil | Usuario | Contraseña / PIN | Funcionalidad Clave |
| :--- | :--- | :--- | :--- |
| **Jefe de Taller / Supervisor** | `carlos.m@motopro.com` | `MotoPro2024*` • PIN: `8921` | Gestión total, desbloqueo de arqueo y garantías |
| **Cajera Principal POS** | `laura.gomez` | `MotoPro2024*` | Cobros mixtos, vales menores y Reporte Z |
| **Mecánico Bahía B-04** | `andres.lopez` | `MotoPro2024*` | Cronómetro de labor y evidencias periciales |
| **Asesor de Servicio** | `felipe.sarmiento` | `MotoPro2024*` | Recepción 360°, baremo y enlace WhatsApp |
| **Almacenista Kardex** | `jorge.bodega` | `MotoPro2024*` | Entradas de compras y galería OEM con zoom |
| **Guardia de Portería** | `guardia.porteria` | `MotoPro2024*` | Validación de QR y autorización de salida |

- **Vehículo Demo en Orden:** `KTM 1290 Super Adventure S 2023` • Placa `JKL-92D` • Orden `OT-1048`.
- **Propietario Demo:** Roberto Valencia Ospina (`+57 312 458 9021`).
- **Monto de Liquidación:** `$311.15 USD` (TRM oficial `$4,001.20 COP` = `$1'245,000 COP`).

---
*Manual generado y certificado para el paquete de entrega e implementación de MotoPro Workshop ERP.* 🏍️💨
