#!/usr/bin/env bash
# ==============================================================================
#  🏍️ MOTOPRO WORKSHOP ERP & POS SYSTEM v2.4
#  Script de Automatización, Despliegue Local, Migración SQL y Empaquetado
# ==============================================================================

set -e

# Colores de terminal para interfaz amigable
C_RESET='\033[0m'
C_BOLD='\033[1m'
C_ORANGE='\033[38;5;208m'
C_GREEN='\033[32m'
C_BLUE='\033[34m'
C_YELLOW='\033[33m'
C_RED='\033[31m'
C_CYAN='\033[36m'

clear

echo -e "${C_ORANGE}${C_BOLD}"
echo "  __  __       _       _____             ______ _____  _____  "
echo " |  \/  |     | |     |  __ \           |  ____|  __ \|  __ \ "
echo " | \  / | ___ | |_ ___| |__) | __ ___   | |__  | |__) | |__) |"
echo " | |\/| |/ _ \| __/ _ \  ___/ '__/ _ \  |  __| |  _  /|  ___/ "
echo " | |  | | (_) | || (_) | |   | | | (_) | | |____| | \ \| |     "
echo " |_|  |_|\___/ \__\___/|_|   |_|  \___/  |______|_|  \_\_|     "
echo -e "${C_RESET}"
echo -e "${C_BOLD}  Suite de Taller Mecánico, Inventario Kardex & Caja POS Multi-Sede v2.4${C_RESET}"
echo -e "${C_CYAN}  ======================================================================${C_RESET}\n"

# Obtener directorio del script
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

show_menu() {
    echo -e "${C_BOLD}Selecciona una opción:${C_RESET}"
    echo -e "  ${C_ORANGE}[1]${C_RESET} ${C_BOLD}Iniciar Servidor Web Local Inmediato${C_RESET} (Python / PHP / Node / Caddy)"
    echo -e "  ${C_ORANGE}[2]${C_RESET} ${C_BOLD}Configurar y Migrar Base de Datos PostgreSQL${C_RESET} (schema.sql + seed.sql)"
    echo -e "  ${C_ORANGE}[3]${C_RESET} ${C_BOLD}Empaquetar Suite en Archivo .ZIP para Distribución${C_RESET}"
    echo -e "  ${C_ORANGE}[4]${C_RESET} ${C_BOLD}Auditar Integridad de Pantallas y Archivos del Proyecto${C_RESET}"
    echo -e "  ${C_ORANGE}[5]${C_RESET} ${C_BOLD}Ver Credenciales y Datos Demo de Prueba${C_RESET}"
    echo -e "  ${C_ORANGE}[0]${C_RESET} Salir"
    echo ""
    read -p "Ingresa tu opción [0-5]: " OPCION
}

start_local_server() {
    echo -e "\n${C_BLUE}🔍 Detectando servidor web local disponible...${C_RESET}"
    PORT=8080
    
    if command -v python3 &>/dev/null; then
        echo -e "${C_GREEN}✓ Python 3 detectado.${C_RESET} Iniciando servidor HTTP en puerto ${PORT}..."
        echo -e "${C_BOLD}${C_ORANGE}➔ Abre en tu navegador: http://localhost:${PORT}/index.html${C_RESET}\n"
        echo -e "Presiona ${C_YELLOW}Ctrl + C${C_RESET} para detener el servidor.\n"
        python3 -m http.server $PORT
    elif command -v php &>/dev/null; then
        echo -e "${C_GREEN}✓ PHP CLI detectado.${C_RESET} Iniciando servidor web en puerto ${PORT}..."
        echo -e "${C_BOLD}${C_ORANGE}➔ Abre en tu navegador: http://localhost:${PORT}/index.html${C_RESET}\n"
        echo -e "Presiona ${C_YELLOW}Ctrl + C${C_RESET} para detener el servidor.\n"
        php -S localhost:$PORT
    elif command -v npx &>/dev/null; then
        echo -e "${C_GREEN}✓ Node.js / npx detectado.${C_RESET} Iniciando 'serve' en puerto ${PORT}..."
        echo -e "${C_BOLD}${C_ORANGE}➔ Abre en tu navegador: http://localhost:${PORT}/index.html${C_RESET}\n"
        npx serve -l $PORT .
    elif command -v caddy &>/dev/null; then
        echo -e "${C_GREEN}✓ Caddy Server detectado.${C_RESET} Iniciando servidor en puerto ${PORT}..."
        caddy file-server --listen :$PORT --browse
    else
        echo -e "${C_YELLOW}⚠ No se encontró Python, PHP ni Node.js.${C_RESET}"
        echo -e "No hay problema: Abre directamente el archivo ${C_BOLD}index.html${C_RESET} en tu navegador web con doble clic."
    fi
}

migrate_postgres() {
    echo -e "\n${C_BLUE}🗄️  Configuración y Despliegue de Base de Datos PostgreSQL${C_RESET}"
    echo -e "--------------------------------------------------------"
    
    read -p "Nombre de usuario PostgreSQL [postgres]: " PG_USER
    PG_USER=${PG_USER:-postgres}

    read -p "Host de base de datos [localhost]: " PG_HOST
    PG_HOST=${PG_HOST:-localhost}

    read -p "Puerto [5432]: " PG_PORT
    PG_PORT=${PG_PORT:-5432}

    read -p "Nombre de la base de datos [motopro_db]: " PG_DB
    PG_DB=${PG_DB:-motopro_db}

    echo -e "\n${C_YELLOW}Intentando crear base de datos '${PG_DB}' (si no existe)...${C_RESET}"
    createdb -U "$PG_USER" -h "$PG_HOST" -p "$PG_PORT" "$PG_DB" 2>/dev/null || echo -e "  (La base de datos '${PG_DB}' ya existe o no se requirió creación)."

    echo -e "${C_BLUE}Ejecutando DDL: database/schema.sql (Tablas, ENUMs, Triggers y Vistas)...${C_RESET}"
    if [ -f "database/schema.sql" ]; then
        psql -U "$PG_USER" -h "$PG_HOST" -p "$PG_PORT" -d "$PG_DB" -f database/schema.sql
        echo -e "${C_GREEN}✓ Esquema relacional ejecutado exitosamente.${C_RESET}"
    else
        echo -e "${C_RED}✗ Error: database/schema.sql no encontrado en $PROJECT_DIR${C_RESET}"
        return 1
    fi

    echo -e "${C_BLUE}Cargando datos demo: database/seed.sql (KTM 1290, Laura Gómez, Kardex)...${C_RESET}"
    if [ -f "database/seed.sql" ]; then
        psql -U "$PG_USER" -h "$PG_HOST" -p "$PG_PORT" -d "$PG_DB" -f database/seed.sql
        echo -e "${C_GREEN}✓ Datos de prueba (seed.sql) cargados exitosamente.${C_RESET}"
    else
        echo -e "${C_RED}✗ Error: database/seed.sql no encontrado.${C_RESET}"
        return 1
    fi

    echo -e "\n${C_GREEN}${C_BOLD}🎉 Base de datos '${PG_DB}' desplegada y lista para operar con la API.${C_RESET}\n"
}

create_zip_package() {
    echo -e "\n${C_BLUE}📦 Empaquetando MotoPro Workshop ERP en archivo ZIP...${C_RESET}"
    ZIP_NAME="motopro-workshop-erp-v2.4.zip"

    if command -v zip &>/dev/null; then
        rm -f "$ZIP_NAME"
        zip -r "$ZIP_NAME" . \
            -x "*.git*" \
            -x "*.DS_Store" \
            -x "node_modules/*" \
            -x "*.log" \
            -x "$ZIP_NAME"
        echo -e "${C_GREEN}${C_BOLD}✓ Paquete generado con éxito: ${ZIP_NAME}${C_RESET}"
        echo -e "Tamaño: $(du -h "$ZIP_NAME" | cut -f1)"
        echo -e "Ubicación: ${PROJECT_DIR}/${ZIP_NAME}\n"
    else
        echo -e "${C_RED}✗ Herramienta 'zip' no encontrada en el sistema.${C_RESET}"
        echo -e "En Ubuntu/Debian instala con: ${C_YELLOW}sudo apt-get install zip${C_RESET}"
        echo -e "En macOS o Windows usa la opción de compresión nativa del explorador."
    fi
}

audit_files() {
    echo -e "\n${C_BLUE}🔍 Verificando integridad de módulos y pantallas...${C_RESET}"
    FILES=(
        "index.html"
        "README.md"
        "LEEME.txt"
        "desktop/login-multiusuario.html"
        "desktop/dashboard-pos.html"
        "desktop/ordenes-taller.html"
        "desktop/recepcion-inspeccion.html"
        "desktop/diagnostico-cotizacion.html"
        "desktop/inventario-movimientos.html"
        "desktop/entrada-compra.html"
        "desktop/salida-despacho.html"
        "desktop/factura-liquidacion.html"
        "desktop/factura-dian-pdf-a4.html"
        "desktop/tirilla-pos-80mm.html"
        "desktop/arqueo-cierre-reporte-z.html"
        "desktop/egresos-caja-menor.html"
        "desktop/formas-de-pago.html"
        "desktop/garantias-reclamos.html"
        "desktop/configuracion-sedes.html"
        "mobile/bahia-mecanico-tactil.html"
        "mobile/captura-evidencias-voz.html"
        "mobile/portal-cliente-whatsapp.html"
        "mobile/confirmacion-firma-digital.html"
        "database/schema.sql"
        "database/seed.sql"
        "api/openapi-motopro-erp-v2.4.yaml"
    )

    TOTAL=0
    FOUND=0

    for file in "${FILES[@]}"; do
        TOTAL=$((TOTAL+1))
        if [ -f "$file" ]; then
            echo -e "  ${C_GREEN}✓${C_RESET} $file"
            FOUND=$((FOUND+1))
        else
            echo -e "  ${C_RED}✗ Falta:${C_RESET} $file"
        fi
    done

    echo -e "\n${C_BOLD}Resultado: ${FOUND} de ${TOTAL} archivos validados.${C_RESET}"
    if [ "$FOUND" -eq "$TOTAL" ]; then
        echo -e "${C_GREEN}${C_BOLD}✨ Suite completa e íntegra. Lista para producción.${C_RESET}\n"
    else
        echo -e "${C_YELLOW}⚠ Faltan algunos archivos en el directorio local.${C_RESET}\n"
    fi
}

show_credentials() {
    echo -e "\n${C_ORANGE}${C_BOLD}🔑 CREDENCIALES Y DATOS DEMO DE PRUEBA:${C_RESET}"
    echo -e "--------------------------------------------------------"
    echo -e "• ${C_BOLD}Jefe de Taller / Supervisor:${C_RESET}"
    echo -e "  Usuario: carlos.m@motopro.com"
    echo -e "  Clave:   MotoPro2024*   |   PIN Supervisor: ${C_YELLOW}8921${C_RESET}"
    echo -e "• ${C_BOLD}Cajera Principal POS Mostrador:${C_RESET}"
    echo -e "  Usuario: laura.gomez"
    echo -e "  Clave:   MotoPro2024*"
    echo -e "• ${C_BOLD}Mecánico Líder Bahía B-04:${C_RESET}"
    echo -e "  Usuario: andres.lopez"
    echo -e "  Clave:   MotoPro2024*"
    echo -e "• ${C_BOLD}Asesor de Recepción & WhatsApp:${C_RESET}"
    echo -e "  Usuario: felipe.sarmiento"
    echo -e "  Clave:   MotoPro2024*"
    echo -e "• ${C_BOLD}Almacenista Kardex & Compras:${C_RESET}"
    echo -e "  Usuario: jorge.bodega"
    echo -e "  Clave:   MotoPro2024*"
    echo -e "\n• ${C_BOLD}Caso de Prueba Activo:${C_RESET}"
    echo -e "  Moto:  KTM 1290 Super Adventure S 2023 (Placa JKL-92D)"
    echo -e "  OT:    OT-1048  |  Total: \$311.15 USD (\$1'245.000 COP)"
    echo -e "  Caja:  Split Payment (\$100 USD Cash + Datáfono Redeban)\n"
}

# Ejecución principal
show_menu

case $OPCION in
    1) start_local_server ;;
    2) migrate_postgres ;;
    3) create_zip_package ;;
    4) audit_files ;;
    5) show_credentials ;;
    0) echo "¡Hasta pronto! 🏍️"; exit 0 ;;
    *) echo -e "${C_RED}Opción inválida.${C_RESET}"; exit 1 ;;
esac
