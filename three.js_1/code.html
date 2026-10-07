<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width,initial-scale=1.0" name="viewport"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      width: 100%;
      height: 100%;
      overflow: hidden;
      background: #000;
    }
  </style>
</head>
<body>
<!-- STITCH_THREEJS_START:ANIMATION_84 class="fixed inset-0 w-full h-full bg-transparent" -->
<div class="fixed inset-0 w-full h-full bg-transparent" style="display:block;">
<script src="https://ajax.googleapis.com/ajax/libs/threejs/r125/three.min.js"></script>
<div id="threejs-container-ANIMATION_84" style="width:100%;height:100%"></div>
<script>
(function() {
  const container = document.getElementById('threejs-container-ANIMATION_84');
  const devicePixelRatio = window.devicePixelRatio || 1;
  /**
 * ==============================================================================
 * 🏍️ MOTOPRO WORKSHOP ERP & POS SYSTEM - COMPONENTE SIDEBAR MODULAR
 * Archivo: assets/js/motopro-sidebar.js
 * Inyecta dinámicamente el sidebar unificado en todas las pantallas,
 * maneja el colapso con persistencia en localStorage y resalta la ruta activa.
 * ==============================================================================
 */

(function () {
  'use strict';

  // Configuración de rutas e items de navegación
  const navItems = [
    {
      group: "Operaciones Taller",
      links: [
        { id: "dashboard", title: "Dashboard & Caja POS", icon: "fa-cash-register", href: "dashboard-pos.html", badge: null },
        { id: "inventario", title: "Inventario & Kardex", icon: "fa-boxes-stacked", href: "inventario-movimientos.html", badge: "OEM" },
        { id: "ordenes", title: "Taller & Órdenes", icon: "fa-wrench", href: "ordenes-taller.html", badge: "14" },
        { id: "recepcion", title: "Recepción 360°", icon: "fa-clipboard-check", href: "recepcion-inspeccion.html", badge: null },
        { id: "diagnostico", title: "Diagnóstico & Cotización", icon: "fa-calculator", href: "diagnostico-cotizacion.html", badge: null },
      ]
    },
    {
      group: "Punto de Venta & Fiscal",
      links: [
        { id: "factura", title: "Factura & Liquidación", icon: "fa-file-invoice-dollar", href: "factura-liquidacion.html", badge: "POS" },
        { id: "arqueo", title: "Arqueo Z & Turnos", icon: "fa-vault", href: "arqueo-cierre-reporte-z.html", badge: null },
        { id: "egresos", title: "Vales Caja Menor", icon: "fa-receipt", href: "egresos-caja-menor.html", badge: "Ctrl+M" },
        { id: "garantias", title: "Garantías Ensambladora", icon: "fa-shield-halved", href: "garantias-reclamos.html", badge: null },
      ]
    },
    {
      group: "Administración & Cuenta",
      links: [
        { id: "perfil", title: "Mi Perfil & Seguridad", icon: "fa-user-gear", href: "perfil-usuario.html", badge: "Activo" },
        { id: "configuracion", title: "Configuración & Sedes", icon: "fa-gears", href: "configuracion-sedes.html", badge: null },
      ]
    }
  ];

  function getBasePrefix() {
    // Detecta si estamos en subcarpeta desktop/ o en la raíz
    const path = window.location.pathname;
    if (path.includes('/desktop/') || path.includes('/mobile/')) {
      return '';
    }
    return 'desktop/';
  }

  function getRootPrefix() {
    const path = window.location.pathname;
    if (path.includes('/desktop/') || path.includes('/mobile/')) {
      return '../';
    }
    return '';
  }

  function initSidebar() {
    const sidebarMount = document.getElementById('motopro-sidebar-container');
    if (!sidebarMount) return;

    const basePrefix = getBasePrefix();
    const rootPrefix = getRootPrefix();
    const currentFile = window.location.pathname.split('/').pop() || 'index.html';
    const isCollapsed = localStorage.getItem('motopro_sidebar_collapsed') === 'true';

    // Recuperar usuario activo de sesión (o Carlos M. por defecto)
    let userSession = {
      nombre: "Carlos Mendoza",
      rol: "Jefe de Taller / Admin",
      email: "carlos.m@motopro.com",
      sede: "Sede Central",
      avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&h=150&q=80"
    };

    try {
      const stored = localStorage.getItem('motopro_session');
      if (stored) {
        const parsed = JSON.parse(stored);
        userSession.nombre = parsed.nombre_completo || parsed.nombre || userSession.nombre;
        userSession.rol = parsed.rol || userSession.rol;
        userSession.email = parsed.email || userSession.email;
      }
    } catch (e) {
      console.warn("Using default session", e);
    }

    let linksHtml = '';
    navItems.forEach(section => {
      linksHtml += `
        <div class="sidebar-section mb-3">
          <p class="sidebar-section-title px-3 py-1.5 text-[10px] font-bold tracking-wider text-slate-400 uppercase">${section.group}</p>
          <div class="space-y-1">
      `;

      section.links.forEach(link => {
        const isCurrent = currentFile === link.href;
        const targetHref = `${basePrefix}${link.href}`;
        const activeClass = isCurrent
          ? "bg-orange-50 text-orange-600 font-semibold border-l-4 border-orange-500 shadow-sm"
          : "text-slate-600 hover:bg-slate-50 hover:text-orange-600 font-medium";

        linksHtml += `
          <a href="${targetHref}" 
             data-tooltip="${link.title}"
             class="sidebar-item flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm transition-all duration-150 ${activeClass}">
            <i class="fa-solid ${link.icon} sidebar-icon w-5 text-center text-slate-400 ${isCurrent ? 'text-orange-500' : ''}"></i>
            <span class="sidebar-text truncate">${link.title}</span>
            ${link.badge ? `<span class="sidebar-badge ml-auto px-1.5 py-0.5 text-[10px] font-bold rounded-full ${isCurrent ? 'bg-orange-500 text-white' : 'bg-slate-100 text-slate-600'}">${link.badge}</span>` : ''}
          </a>
        `;
      });

      linksHtml += `
          </div>
        </div>
      `;
    });

    const sidebarTemplate = `
      <aside id="motopro-sidebar" class="${isCollapsed ? 'collapsed' : ''} bg-white border-r border-slate-200 h-screen sticky top-0 flex flex-col shrink-0 z-40 select-none shadow-sm">
        <!-- HEADER SIDEBAR: LOGO + TOGGLE BUTTON -->
        <div class="h-16 px-4 border-b border-slate-100 flex items-center justify-between">
          <a href="${rootPrefix}index.html" class="flex items-center gap-2.5 overflow-hidden">
            <span class="w-9 h-9 rounded-xl bg-gradient-to-br from-orange-500 to-amber-600 text-white flex items-center justify-center font-black shadow-md shadow-orange-500/20 shrink-0">
              <i class="fa-solid fa-motorcycle text-base"></i>
            </span>
            <div class="sidebar-logo-text flex flex-col">
              <span class="font-extrabold text-sm tracking-tight text-slate-900 leading-none">MOTOPRO</span>
              <span class="text-[10px] font-semibold text-orange-600 uppercase tracking-widest mt-0.5">Workshop ERP</span>
            </div>
          </a>
          
          <button id="motopro-sidebar-toggle" title="Contraer / Expandir Menú" class="w-8 h-8 rounded-lg hover:bg-slate-100 text-slate-500 hover:text-slate-800 flex items-center justify-center transition-colors">
            <i class="fa-solid ${isCollapsed ? 'fa-angles-right' : 'fa-angles-left'} text-xs"></i>
          </button>
        </div>

        <!-- LISTA DE RUTAS -->
        <nav class="flex-1 overflow-y-auto px-3 py-3 overflow-x-hidden">
          ${linksHtml}
        </nav>

        <!-- FOOTER: PERFIL DEL USUARIO LOGUEADO -->
        <div class="p-3 border-t border-slate-100 bg-slate-50/50">
          <a href="${basePrefix}perfil-usuario.html" 
             data-tooltip="Ver Perfil de ${userSession.nombre}"
             class="sidebar-item flex items-center gap-3 p-2 rounded-xl hover:bg-white hover:shadow-sm border border-transparent hover:border-slate-200 transition-all">
            <div class="relative shrink-0">
              <img src="${userSession.avatar}" alt="Avatar" class="w-9 h-9 rounded-full object-cover border border-slate-200">
              <span class="absolute bottom-0 right-0 w-2.5 h-2.5 bg-emerald-500 border-2 border-white rounded-full"></span>
            </div>
            <div class="sidebar-footer-text flex-1 min-w-0">
              <p class="text-xs font-bold text-slate-900 truncate">${userSession.nombre}</p>
              <p class="text-[10px] font-medium text-slate-500 truncate">${userSession.rol}</p>
            </div>
            <i class="fa-solid fa-chevron-right sidebar-footer-text text-slate-300 text-[10px]"></i>
          </a>
          
          <div class="sidebar-footer-text mt-2 pt-2 border-t border-slate-200/60 flex items-center justify-between text-[11px] text-slate-500 px-1">
            <span class="flex items-center gap-1.5"><span class="w-2 h-2 rounded-full bg-emerald-500"></span> Online</span>
            <a href="${rootPrefix}index.html" class="hover:text-orange-600 font-semibold transition-colors" title="Volver al Portal General">
              <i class="fa-solid fa-house text-xs"></i>
            </a>
          </div>
        </div>
      </aside>
    `;

    sidebarMount.innerHTML = sidebarTemplate;

    // Listener para colapso interactivo
    const toggleBtn = document.getElementById('motopro-sidebar-toggle');
    const sidebarElem = document.getElementById('motopro-sidebar');

    if (toggleBtn && sidebarElem) {
      toggleBtn.addEventListener('click', () => {
        const willCollapse = !sidebarElem.classList.contains('collapsed');
        sidebarElem.classList.toggle('collapsed', willCollapse);
        localStorage.setItem('motopro_sidebar_collapsed', willCollapse);

        // Actualizar ícono
        const icon = toggleBtn.querySelector('i');
        if (icon) {
          icon.className = willCollapse ? 'fa-solid fa-angles-right text-xs' : 'fa-solid fa-angles-left text-xs';
        }
      });
    }
  }

  // Ejecución al cargar DOM
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initSidebar);
  } else {
    initSidebar();
  }
})();

})();
</script>
</div>
<!-- STITCH_THREEJS_END:ANIMATION_84 -->
</body>
</html>
