# 🏍️ MotoPro Workshop ERP & POS System

[![License: MIT](https://img.shields.io/badge/License-MIT-orange.svg)](LICENSE)
[![Status: Production Ready](https://img.shields.io/badge/Status-Production%20Ready-success.svg)]()
[![Tailwind CSS: v3.x](https://img.shields.io/badge/TailwindCSS-v3.x-38B2AC.svg)](https://tailwindcss.com/)
[![DIAN: Facturación Electrónica](https://img.shields.io/badge/DIAN-UBL%202.1%20Compliant-blue.svg)]()
[![Hardware: ESC/POS 80mm](https://img.shields.io/badge/Hardware-Epson%20ESC%2FPOS%2080mm-black.svg)]()

> **MotoPro Workshop ERP** es una plataforma integral de gestión operativa, técnica y financiera diseñada específicamente para talleres mecánicos de motocicletas, centros de servicio multimarcas y redes multi-sede. Integra control de inventarios (Kardex), recepción pericial 360°, diagnóstico y baremo de tiempos, punto de venta (POS) con tirilla térmica y arqueo ciego, facturación electrónica fiscal y portal móvil en tiempo real para mecánicos y clientes vía WhatsApp.

---

## 📑 Tabla de Contenidos
- [Características Principales](#-características-principales)
- [Arquitectura y Estructura del Repositorio](#-arquitectura-y-estructura-del-repositorio)
- [Mapeo Completo de Pantallas y Módulos](#-mapeo-completo-de-pantallas-y-módulos)
  - [1. Módulos Desktop (Administración, Taller & POS)](#1-módulos-desktop-administración-taller--pos)
  - [2. Módulos Mobile & PWA (Operarios & Clientes)](#2-módulos-mobile--pwa-operarios--clientes)
- [Integración de Hardware POS](#-integración-de-hardware-pos)
- [Atajos de Teclado Operativos](#-atajos-de-teclado-operativos)
- [Credenciales y Datos Demo](#-credenciales-y-datos-demo)
- [Guía de Instalación y Despliegue Rápido](#-guía-de-instalación-y-despliegue-rápido)
  - [Prueba Local sin Servidor](#prueba-local-sin-servidor)
  - [Despliegue Gratis en GitHub Pages](#despliegue-gratis-en-github-pages)
  - [Despliegue en Vercel / Netlify](#despliegue-en-vercel--netlify)
- [Variables y Parámetros de Configuración](#-variables-y-parámetros-de-configuración)
- [Licencia y Contribuciones](#-licencia-y-contribuciones)

---

## ⚡ Características Principales

- **Multi-Sede Centralizado:** Control de sedes independientes con consolidación en tiempo real (ej. *Sede Central - Taller Norte*, *Sede Occidente*, etc.).
- **Recepción con Peritaje Visual 360°:** Checklist táctil con marcado de rayones, abolladuras, accesorios y nivel de combustible. Firma de consentimiento digital al ingreso.
- **Baremo Técnico & Diagnóstico:** Cotizaciones estructuradas con cálculo de tiempos de mano de obra (flat rate), repuestos OEM y consumibles.
- **Control de Inventario Kardex:** Entradas por compra con soporte de código de barras, despachos blindados con validación de OT y alertas de stock crítico.
- **Terminal de Caja POS & Pagos Mixtos (Split Payment):**
  - Múltiples formas de cobro por orden: Efectivo (bimoneda USD / COP con TRM en vivo), Datáfonos Redeban/Credibanco (SmartPOS LAN/USB), QR Bancolombia/Bre-B/Nequi, pasarelas remotas (Wompi/WhatsApp Pay) y crédito de flotas.
  - Apertura automática de gaveta monedero mediante pulso eléctrico RJ11.
  - Vales rápidos de salida y caja menor con atajo `Ctrl + M`.
  - Arqueo y Cierre Fiscal (Reporte Z) con protocolo ciego de denominaciones físicas.
- **Impresión Fiscal & Comprobantes:**
  - Factura Electrónica fiscal formato A4 / PDF (compatible normativa DIAN UBL 2.1).
  - Simulador térmico de tirilla ESC/POS 80mm con código QR, CUFE y talón desprendible para guardia/portería.
- **Flujo Táctil Móvil Bahía:** Vista simplificada para mecánicos en elevador con registro de tiempos de labor, toma de fotos y notas de voz periciales.
- **Portal Cliente en WhatsApp:** Enlace seguro para que el cliente revise evidencias fotográficas, desglose presupuestario y autorice o rechace servicios con firma digital vinculante.

---

## 📁 Arquitectura y Estructura del Repositorio

El proyecto está diseñado bajo estándares web puros (HTML5, Tailwind CSS, FontAwesome/Lucide Icons y JavaScript vanilla), lo que permite ejecutarlo directamente en cualquier navegador moderno sin requerir compiladores o runtimes pesados:

```text
motopro-erp/
├── index.html                           # Portal principal de acceso y directorio interactivo
├── README.md                            # Documentación técnica completa del proyecto
│
├── desktop/                             # Vistas de Escritorio (ERP, Taller & POS)
│   ├── login-multiusuario.html          # Acceso de usuarios, selección de sede y roles
│   ├── dashboard-pos.html               # Terminal de Caja POS, métricas y órdenes activas
│   ├── ordenes-taller.html              # Tablero Kanban de OT por bahías y mecánicos
│   ├── recepcion-inspeccion.html        # Recepción 360° y checklist de daños de la moto
│   ├── diagnostico-cotizacion.html      # Cotización técnica, repuestos y tiempos de labor
│   ├── inventario-movimientos.html      # Kardex multi-sede, catálogo y stock valorizado
│   ├── entrada-compra.html              # Formulario de ingreso de compras a proveedores
│   ├── salida-despacho.html             # Registro de salida/despacho de piezas a OT
│   ├── facturacion-contabilidad.html    # Facturación masiva, cartera y clientes
│   ├── factura-liquidacion.html         # Liquidación final de caja al retirar la moto
│   ├── factura-dian-pdf-a4.html         # Factura electrónica oficial DIAN en formato A4
│   ├── tirilla-pos-80mm.html            # Simulador de ticket térmico 80mm Epson ESC/POS
│   ├── arqueo-cierre-reporte-z.html     # Arqueo físico, conciliación bancaria y Reporte Z
│   ├── egresos-caja-menor.html          # Registro de vales de salida de efectivo (Ctrl+M)
│   ├── formas-de-pago.html              # Parametrización de métodos y simulación Split
│   ├── garantias-reclamos.html          # Control de garantías y reclamos a ensambladora
│   ├── modal-radicar-garantia.html      # Modal radicación de garantía y diagnóstico Texa
│   ├── configuracion-sedes.html         # Sedes, tarifas de mano de obra y usuarios
│   └── modal-bahias-elevadores.html     # Modal de equipamiento de bahías y elevadores
│
├── mobile/                              # Vistas Optimizadas para Móvil y PWA
│   ├── bahia-mecanico-tactil.html       # Terminal táctil del mecánico en elevador
│   ├── captura-evidencias-voz.html      # Cámara de bahía y grabación de audio técnico
│   ├── portal-cliente-whatsapp.html     # Vista cliente: visor de evidencias y presupuesto
│   └── confirmacion-firma-digital.html  # Comprobante de aprobación con firma criptográfica
│
└── assets/                              # Recursos gráficos y multimedia
    ├── logo-motopro.png                 # Logotipo institucional vectorial
    ├── avatar-carlos-supervisor.png     # Avatar demo del jefe de taller
    └── favicon.ico                      # Ícono del navegador
```

---

## 🖥️ Mapeo Completo de Pantallas y Módulos

### 1. Módulos Desktop (Administración, Taller & POS)

| Pantalla / Archivo | Función Principal | Perfil Sugerido |
| :--- | :--- | :--- |
| `login-multiusuario.html` | Selector de sede activa, autenticación y políticas de acceso. | Todos los usuarios |
| `dashboard-pos.html` | Panel principal de caja, resumen de ingresos diarios y búsqueda de OT. | Cajero / Administrador |
| `ordenes-taller.html` | Monitoreo Kanban de bahías (`B-01` a `B-08`), estados de trabajo y técnicos. | Jefe de Taller / Asesor |
| `recepcion-inspeccion.html` | Inspección pericial 360° con silueta de moto, fotos previas e inventario de accesorios. | Asesor de Servicio |
| `diagnostico-cotizacion.html` | Desglose de piezas OEM solicitadas, cálculo de margen y mano de obra. | Asesor / Jefe Técnico |
| `inventario-movimientos.html` | Kardex de repuestos, cálculo de costo promedio ponderado y stock mínimo. | Almacenista / Inventarios |
| `entrada-compra.html` | Registro de facturas de compras a proveedores con lote y ubicación en bodega. | Almacenista |
| `salida-despacho.html` | Despacho controlado a mecánicos con validación de número de orden. | Almacenista |
| `factura-liquidacion.html` | Retiro de la moto, cobro mixto (efectivo, tarjetas, QR) y pase de portería. | Cajero Mostrador |
| `tirilla-pos-80mm.html` | Previsualizador de impresión térmica Epson ESC/POS 80mm con código CUFE y QR. | Cajero / Auditoría |
| `factura-dian-pdf-a4.html` | Plantilla formal fiscal para impresión A4 o envío por correo electrónico. | Contabilidad / Clientes |
| `arqueo-cierre-reporte-z.html` | Cuadre ciego por denominación de billetes, vouchers datáfono y Reporte Z. | Cajero / Supervisor |
| `egresos-caja-menor.html` | Registro de compras de emergencia, refrigerios y fletes con atajo `Ctrl+M`. | Cajero |
| `formas-de-pago.html` | Configuración de pasarelas, comisiones bancarias y datáfonos en red. | Administrador |
| `garantias-reclamos.html` | Seguimiento de piezas defectuosas reclamadas a ensambladora o fabricante. | Jefe de Taller |
| `configuracion-sedes.html` | Parámetros de sedes, tarifas horarias de mano de obra y permisos. | Administrador General |

### 2. Módulos Mobile & PWA (Operarios & Clientes)

| Pantalla / Archivo | Función Principal | Perfil Sugerido |
| :--- | :--- | :--- |
| `bahia-mecanico-tactil.html` | Cronómetro de labor en tiempo real, checklist técnico y llamado a bodega. | Mecánico de Bahía |
| `captura-evidencias-voz.html` | Captura de fotografías de piezas dañadas y dictado de nota de voz técnica. | Mecánico de Bahía |
| `portal-cliente-whatsapp.html` | Portal web ligero que recibe el cliente por WhatsApp para aprobar cotización. | Propietario de la Moto |
| `confirmacion-firma-digital.html` | Pantalla de confirmación con firma manuscrita digitalizada y comprobante. | Propietario de la Moto |

---

## 🖨️ Integración de Hardware POS

MotoPro Workshop ERP cuenta con soporte para directivas de hardware estándar de la industria del retail y automotriz:

- **Impresoras Térmicas de Recibos:**
  - Compatibilidad nativa: **Epson TM-T20III**, **Star Micronics**, **Bixolon** (80mm / 48 o 64 columnas).
  - Protocolos de enlace: Raw TCP/IP Socket (`Puerto 9100`), USB Virtual COM o Spooler de sistema.
  - Comandos directos: Corte de guillotina (`GS V 66 0`), Densidad térmica (100% High Contrast) y código QR bidimensional.
- **Gaveta de Dinero Monedero:**
  - Puerto RJ11 conectado a la impresora de recibos.
  - Pulso estándar de apertura eléctrica: `DLE DC4 1` (24V, 50ms) accionado automáticamente al liquidar o con tecla `F9`.
- **Datáfonos & Terminales de Pago:**
  - Enlace LAN SmartPOS (Redeban / Credibanco) en el puerto local `8088`.
  - Pasarelas web con webhook instantáneo para validación de QRs interoperables.
- **Escáner de Código de Barras / QR:**
  - Emulación de teclado HID (USB / Bluetooth) para lectura instantánea de SKU de repuestos, cédulas y números de chasis (VIN).

---

## ⌨️ Atajos de Teclado Operativos

Diseñado para operar en mostradores de alto tráfico sin necesidad de usar el ratón:

| Atajo | Acción en el Sistema |
| :---: | :--- |
| <kbd>Ctrl</kbd> + <kbd>K</kbd> | Búsqueda rápida global (OT, Placa, VIN, Cliente o SKU de Repuesto). |
| <kbd>Ctrl</kbd> + <kbd>M</kbd> | Apertura instantánea del modal de **Egresos y Vales de Caja Menor**. |
| <kbd>Ctrl</kbd> + <kbd>P</kbd> | Imprimir tirilla térmica actual o factura activa. |
| <kbd>F9</kbd> | Disparo manual de apertura eléctrica de la **Gaveta de Dinero**. |
| <kbd>Esc</kbd> | Cerrar cualquier modal, visor o menú flotante activo. |

---

## 🔑 Credenciales y Datos Demo

Para pruebas y navegación de demostración del sistema se han configurado los siguientes datos por defecto:

### Usuarios y Roles
- **Jefe de Taller / Administrador:**
  - Usuario: `carlos.m@motopro.com`
  - PIN de Supervisor: `8921`
  - Perfil: Acceso total a configuración, arqueos, garantías y tarifas.
- **Cajera Principal (Mostrador):**
  - Usuario: `laura.gomez`
  - Código: `USR-892`
  - Perfil: Facturación, cobros mixtos, vales de caja y cierre Reporte Z.
- **Mecánico Especialista Bahía:**
  - Usuario: `andres.lopez`
  - Bahía asignada: `Bahía B-04 (Elevador Hidráulico #2)`

### Orden de Trabajo Demo en Contexto
- **Orden de Trabajo:** `OT-1048`
- **Vehículo:** `KTM 1290 Super Adventure S 2023` (Placa: `JKL-92D` • 11,452 km).
- **Propietario:** `Roberto Valencia Ospina` (Tel: `+57 312 458 9021`).
- **Monto de Liquidación:** `$311.15 USD` (Equivalente oficial TRM `$4,001.20 COP` = `$1'245.000 COP`).

---

## 🚀 Guía de Instalación y Despliegue Rápido

### Prueba Local sin Servidor
1. Clona el repositorio o descarga el archivo `.zip`:
   ```bash
   git clone https://github.com/TU_USUARIO/motopro-erp.git
   cd motopro-erp
   ```
2. Abre cualquier archivo `.html` (por ejemplo `index.html` o `desktop/dashboard-pos.html`) haciendo doble clic o arrastrándolo a Google Chrome, Firefox, Safari o Microsoft Edge. No se requiere Node.js, PHP ni bases de datos para previsualizar los flujos.

---

### Despliegue Gratis en GitHub Pages
1. Sube tu código a un repositorio público o privado en GitHub:
   ```bash
   git init
   git add .
   git commit -m "feat: Despliegue inicial MotoPro ERP"
   git branch -M main
   git remote add origin https://github.com/TU_USUARIO/motopro-erp.git
   git push -u origin main
   ```
2. En GitHub, ingresa a la pestaña **Settings > Pages**.
3. En la sección **Build and deployment > Source**, selecciona:
   - Branch: `main`
   - Folder: `/ (root)`
4. Haz clic en **Save**. En un par de minutos tu proyecto estará disponible en:
   ```text
   https://TU_USUARIO.github.io/motopro-erp/
   ```

---

### Despliegue en Vercel / Netlify
- **Con Vercel CLI:**
  ```bash
  npm i -g vercel
  vercel
  ```
- **Con Netlify:** Simplemente arrastra la carpeta `motopro-erp/` a la consola web de [app.netlify.com/drop](https://app.netlify.com/drop).

---

## ⚙️ Variables y Parámetros de Configuración

Si conectas esta plantilla a un backend API (Node.js, Laravel, Python FastAPI o Django), puedes configurar los siguientes endpoints y tokens en tu script de entorno o cabecera:

```javascript
// Configuración global MotoPro ERP
window.MOTOPRO_CONFIG = {
  API_BASE_URL: "https://api.tu-taller.com/v1",
  SEDE_ID: "SEDE-CENTRAL-01",
  TERMINAL_POS_ID: "POS-01-MOSTRADOR",
  EPSON_PRINTER_IP: "192.168.1.150",
  EPSON_PRINTER_PORT: 9100,
  REDEBAN_POS_IP: "192.168.1.180:8088",
  TRM_DEFAULT_COP_USD: 4001.20,
  ENABLE_AUTO_DRAWER_PULSE: true
};
```

---

## 📄 Licencia y Contribuciones

Este proyecto está bajo la Licencia **MIT**. Eres libre de usarlo, modificarlo e implementarlo en talleres comerciales, concesionarios y proyectos privados.

Desarrollado con pasión para la comunidad de especialistas en dos ruedas y gestión automotriz. 🏍️💨
