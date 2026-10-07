# 📦 MANIFIESTO OFICIAL DE ARCHIVOS Y RUTAS - MOTOPRO WORKSHOP ERP v2.5

Este documento define la asignación canónica de carpetas y nombres exactos para cada uno de los archivos del repositorio, garantizando cero errores 404, rutas relativas impecables e integración total con Netlify, GitHub Pages o servidores locales.

---

## 🗂️ ÁRBOL DE DIRECTORIOS Y ARCHIVOS CANÓNICOS

```text
motopro-workshop-erp/
│
├── index.html                                 # Portal interactivo, consola Swagger y directorio
├── README.md                                  # Documentación técnica completa
├── LEEME.txt                                  # Guía rápida de comandos de terminal
├── setup.sh                                   # Script de automatización y despliegue
│
├── assets/                                    # Recursos transversales del sistema
│   ├── css/
│   │   └── motopro-global.css                 # Estilos centralizados y variables corporativas (#f97316)
│   ├── js/
│   │   ├── motopro-sidebar.js                # Componente único del Menú Lateral colapsable
│   │   └── motopro-core.js                   # Lógica central (TRM, atajos Ctrl+M/F9, toasts, Supabase)
│   └── images/
│       ├── logo-motopro.png                   # Logotipo oficial MotoPro ERP
│       └── avatar-carlos-supervisor.png       # Avatar del supervisor de taller
│
├── desktop/                                   # Pantallas ERP y POS de escritorio (usan motopro-sidebar.js)
│   ├── login-multiusuario.html                # Acceso multi-sede, selección de roles y PIN
│   ├── perfil-usuario.html                    # Ficha de perfil de usuario, PIN y métricas
│   ├── dashboard-pos.html                     # Terminal de caja POS y monitoreo de periféricos
│   ├── ordenes-taller.html                    # Tablero Kanban de órdenes, bahías y elevadores
│   ├── recepcion-inspeccion.html              # Recepción pericial 360° con silueta de daños
│   ├── diagnostico-cotizacion.html            # Cotización técnica, baremo flat-rate y repuestos
│   ├── inventario-movimientos.html            # Kardex multisede y galería técnica OEM con zoom 2.5x
│   ├── entrada-compra.html                    # Registro de recepción de compra a proveedor
│   ├── salida-despacho.html                   # Despacho controlado de repuestos a OT
│   ├── factura-liquidacion.html               # Liquidación final Split Payment y pase de portería
│   ├── factura-dian-pdf-a4.html               # Factura electrónica oficial DIAN en formato A4
│   ├── tirilla-pos-80mm.html                  # Tirilla térmica de 80mm para Epson ESC/POS
│   ├── arqueo-cierre-reporte-z.html           # Arqueo físico ciego y Reporte Z fiscal
│   ├── egresos-caja-menor.html                # Registro rápido de vales de caja menor (Ctrl+M)
│   ├── formas-de-pago.html                    # Configuración de medios de pago y pasarelas
│   ├── garantias-reclamos.html                # Gestión de garantías y reclamos a ensambladora
│   └── configuracion-sedes.html               # Configuración de sedes, tarifas horarias y personal
│
├── mobile/                                    # Vistas móviles PWA y WhatsApp táctiles
│   ├── bahia-mecanico-tactil.html             # Terminal táctil de mecánico con cronómetro de labor
│   ├── captura-evidencias-voz.html            # Visor pericial de fotos y grabación de audio
│   ├── portal-cliente-whatsapp.html           # Visor web de cotización y evidencias para el cliente
│   └── confirmacion-firma-digital.html        # Confirmación de aprobación con firma criptográfica
│
├── database/                                  # Persistencia relacional PostgreSQL 15+ / Supabase
│   ├── schema.sql                             # DDL: 14 tablas, ENUMs, triggers y vistas
│   └── seed.sql                               # DML: Datos demo KTM 1290, Laura Gómez y Carlos M.
│
└── api/                                       # Especificación de microservicios REST
    └── openapi-motopro-erp-v2.4.yaml          # Especificación Swagger / OpenAPI 3.0.3
```

---

## 📋 TABLA MAESTRA DE EQUIVALENCIA: NOMBRE EN REPOSITORIO VS PANTALLA EN CANVAS

| Ruta Exacta en el Repositorio | Título de la Pantalla en el Sistema | Tipo | Propósito Principal |
| :--- | :--- | :--- | :--- |
| **`index.html`** | *Directorio Interactivo & Swagger UI* | HTML | Portal de acceso y selector de flujos guiados |
| **`assets/css/motopro-global.css`** | *Estilos Centralizados* | CSS | Paleta de colores, tipografía Inter y animación de colapso |
| **`assets/js/motopro-sidebar.js`** | *Componente Menú Lateral* | JS | Inyección dinámica de navegación, colapso y tooltips |
| **`assets/js/motopro-core.js`** | *Núcleo Modular MotoPro* | JS | TRM en vivo, atajos globales y toasts de notificación |
| **`desktop/perfil-usuario.html`** | *Mi Perfil de Usuario & Seguridad* | HTML | Ficha del operario, cambio de PIN supervisor y métricas |
| **`desktop/login-multiusuario.html`** | *Acceso Multiusuario & Sedes* | HTML | Autenticación con credenciales demo rápidas de 1 clic |
| **`desktop/dashboard-pos.html`** | *Dashboard & Terminal Caja POS* | HTML | Terminal de mostrador, saldo diario y periféricos |
| **`desktop/ordenes-taller.html`** | *Taller, Órdenes & Operarios* | HTML | Tablero Kanban en tiempo real con 8 bahías |
| **`desktop/recepcion-inspeccion.html`** | *Recepción e Inspección de Motocicletas* | HTML | Peritaje 360°, checklist de daños y custodia |
| **`desktop/diagnostico-cotizacion.html`** | *Diagnóstico Técnico y Cotización* | HTML | Cotización baremada, repuestos y token de WhatsApp |
| **`desktop/inventario-movimientos.html`** | *Inventario & Movimientos de Stock* | HTML | Kardex, visor de lote y modal de zoom OEM 2.5x |
| **`desktop/entrada-compra.html`** | *Registrar Entrada de Compra* | HTML | Ingreso de mercancía por factura de proveedor |
| **`desktop/salida-despacho.html`** | *Registrar Salida / Despacho a OT* | HTML | Salida blindada de almacén firmada por mecánico |
| **`desktop/factura-liquidacion.html`** | *Factura y Liquidación Final POS* | HTML | Cobro mixto multimoneda y generación de pase portería |
| **`desktop/factura-dian-pdf-a4.html`** | *Factura Electrónica DIAN PDF A4* | HTML | Plantilla UBL 2.1 con CUFE y QR fiscal |
| **`desktop/tirilla-pos-80mm.html`** | *Tirilla Térmica de Caja POS 80mm* | HTML | Simulación térmica Epson ESC/POS con corte guillotina |
| **`desktop/arqueo-cierre-reporte-z.html`** | *Arqueo y Cierre de Turno - Reporte Z* | HTML | Conteo ciego por billetes y bloqueo de caja |
| **`desktop/egresos-caja-menor.html`** | *Registro de Egresos y Vales (Ctrl+M)* | HTML | Salidas rápidas de efectivo con PIN supervisor |
| **`desktop/formas-de-pago.html`** | *Gestión de Formas de Pago POS* | HTML | Parametrización de datáfonos SmartPOS y pasarelas |
| **`desktop/garantias-reclamos.html`** | *Gestión de Garantías y Reclamos* | HTML | Trazabilidad de fallas de fábrica y cuarentena |
| **`desktop/configuracion-sedes.html`** | *Configuración de Sedes & Tarifas* | HTML | Gestión de sucursales físicas y baremos por cc |
| **`mobile/bahia-mecanico-tactil.html`** | *Bahía Mecánico - Modo Táctil OT* | HTML | PWA para operarios con cronómetro y checklist |
| **`mobile/captura-evidencias-voz.html`** | *Captura de Evidencias y Nota de Voz* | HTML | Cámara en elevador y grabadora de audio 60s |
| **`mobile/portal-cliente-whatsapp.html`** | *Portal Cliente WhatsApp* | HTML | Visor ligero de aprobación enviado al cliente |
| **`mobile/confirmacion-firma-digital.html`**| *Confirmación Exitosa Firma Digital* | HTML | Acta pericial y comprobante firmado con SHA-256 |
| **`database/schema.sql`** | *Base de Datos Relacional PostgreSQL* | SQL | Esquema relacional con 14 tablas, tipos e índices |
| **`database/seed.sql`** | *Datos Demo Completos* | SQL | Inserción de sedes, KTM 1290, usuarios y OT-1048 |
| **`api/openapi-motopro-erp-v2.4.yaml`** | *Especificación REST OpenAPI 3.0.3* | YAML | Definición completa de endpoints para backend |

---

## ⚙️ INSTRUCCIONES DE INTEGRACIÓN EN NETLIFY

1. Si al exportar desde la plataforma algún archivo se nombró `code.html`, renómbralo a **`index.html`** y colócalo en la raíz.
2. Crea las carpetas **`assets/css/`**, **`assets/js/`**, **`desktop/`**, **`mobile/`**, **`database/`** y **`api/`**.
3. Guarda cada archivo exactamente con el nombre de la tabla anterior.
4. En cada archivo dentro de `desktop/`, verifica que las rutas apunten a `../assets/css/motopro-global.css` y `../assets/js/motopro-sidebar.js`.
5. Arrastra la carpeta completa a Netlify (**Deploys > Drag & Drop**) y tu sitio funcionará de inmediato con navegación 100% fluida y sin pantallas en blanco ni 404.
