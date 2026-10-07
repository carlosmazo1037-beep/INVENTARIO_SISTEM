(function() {
  function initMotoProSidebar() {
    if (document.getElementById("motopro-sidebar-wrapper")) return;
    document.querySelectorAll("aside:not(#motopro-aside-panel), #motopro-sidebar, #sidebar").forEach(function(el) {
      if (!el.closest("#motopro-sidebar-wrapper")) el.style.display = "none";
    });

    var path = window.location.pathname || "";
    var isDesktop = path.indexOf("/desktop/") !== -1 || path.indexOf("\\desktop\\") !== -1;
    var isMobile = path.indexOf("/mobile/") !== -1 || path.indexOf("\\mobile\\") !== -1;
    var desktopBase = (isDesktop || isMobile) ? "" : "desktop/";
    var rootBase = (isDesktop || isMobile) ? "../" : "";
    var curFile = path.split("/").pop().split("\\").pop() || "index.html";
    var isCollapsed = localStorage.getItem("motopro_sb_collapsed") === "true";
    var isHidden = localStorage.getItem("motopro_sb_hidden") === "true";

    var menuSections = [
      {
        title: "Operaciones Taller",
        items: [
          { name: "Dashboard & Caja POS", file: "dashboard-pos.html", icon: "fa-cash-register", badge: "POS" },
          { name: "Kardex & Inventario", file: "inventario-movimientos.html", icon: "fa-boxes-stacked", badge: "OEM" },
          { name: "Taller & Bahías", file: "ordenes-taller.html", icon: "fa-wrench", badge: "14" },
          { name: "Recepción 360°", file: "recepcion-inspeccion.html", icon: "fa-clipboard-check" },
          { name: "Diagnóstico & Baremo", file: "diagnostico-cotizacion.html", icon: "fa-calculator" }
        ]
      },
      {
        title: "Punto de Venta & Fiscal",
        items: [
          { name: "Factura & Liquidación", file: "factura-liquidacion.html", icon: "fa-file-invoice-dollar", badge: "Split" },
          { name: "Tirilla ESC/POS 80mm", file: "tirilla-pos-80mm.html", icon: "fa-receipt" },
          { name: "Arqueo Z & Turnos", file: "arqueo-cierre-reporte-z.html", icon: "fa-vault" },
          { name: "Vales Caja Menor", file: "egresos-caja-menor.html", icon: "fa-hand-holding-dollar", badge: "Ctrl+M" },
          { name: "Garantías Fábrica", file: "garantias-reclamos.html", icon: "fa-shield-halved" }
        ]
      },
      {
        title: "Administración & Sistema",
        items: [
          { name: "Mi Perfil & Seguridad", file: "perfil-usuario.html", icon: "fa-user-gear", badge: "Activo" },
          { name: "Configuración & Sedes", file: "configuracion-sedes.html", icon: "fa-gears" },
          { name: "Acceso Multiusuario", file: "login-multiusuario.html", icon: "fa-right-to-bracket" }
        ]
      }
    ];

    var navHtml = "";
    menuSections.forEach(function(sec) {
      navHtml += '<div class="sb-sec-title px-3 pt-3 pb-1 text-[10px] font-black tracking-wider text-slate-400 uppercase' + (isCollapsed ? ' hidden' : '') + '">' + sec.title + '</div>';
      sec.items.forEach(function(item) {
        var isActive = curFile === item.file;
        var activeClass = isActive ? "bg-orange-50 text-orange-600 font-bold border-l-4 border-orange-500 shadow-sm" : "text-slate-600 hover:bg-slate-100 hover:text-slate-900 font-medium";
        navHtml += '<a href="' + desktopBase + item.file + '" title="' + item.name + '" class="flex items-center gap-3 px-3 py-2 rounded-lg text-xs transition-all ' + activeClass + '">' +
          '<i class="fa-solid ' + item.icon + ' w-4 text-center text-sm shrink-0 ' + (isActive ? 'text-orange-500' : 'text-slate-400') + '"></i>' +
          '<span class="sb-text truncate flex-1' + (isCollapsed ? ' hidden' : '') + '">' + item.name + '</span>' +
          (item.badge && !isCollapsed ? '<span class="sb-badge px-1.5 py-0.5 text-[9px] font-extrabold rounded-md ' + (isActive ? 'bg-orange-500 text-white' : 'bg-slate-200 text-slate-600') + '">' + item.badge + '</span>' : '') +
          '</a>';
      });
    });

    var logoSvg = '<svg class="w-5 h-5 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2"><circle cx="5.5" cy="17.5" r="3.5"/><circle cx="18.5" cy="17.5" r="3.5"/><path d="M15 6h-4l-3 6.5h7.5z"/><path d="M12 17.5V14l-2.5-4"/><path d="M18.5 14h-3.5"/></svg>';
    var wrapper = document.createElement("div");
    wrapper.id = "motopro-sidebar-wrapper";
    wrapper.className = "shrink-0 select-none z-50 relative";

    wrapper.innerHTML = 
      '<aside id="motopro-aside-panel" class="' + (isHidden ? '-translate-x-full ' : 'translate-x-0 ') + (isCollapsed ? 'w-16 ' : 'w-60 ') + 'h-screen sticky top-0 bg-white border-r border-slate-200 shadow-sm flex flex-col transition-all duration-200 ease-in-out">' +
        '<div class="h-14 px-3 border-b border-slate-100 flex items-center justify-between gap-2 shrink-0">' +
          '<a href="' + rootBase + 'index.html" class="flex items-center gap-2.5 overflow-hidden">' +
            '<div class="w-8 h-8 rounded-lg bg-orange-500 text-white flex items-center justify-center font-bold shadow-sm shadow-orange-500/40 shrink-0">' + logoSvg + '</div>' +
            '<div class="sb-brand flex flex-col' + (isCollapsed ? ' hidden' : '') + '">' +
              '<span class="font-black text-xs tracking-tight text-slate-900 leading-none">MOTOPRO</span>' +
              '<span class="text-[9px] font-bold text-orange-600 uppercase tracking-wider mt-0.5">Workshop ERP</span>' +
            '</div>' +
          '</a>' +
          '<button id="motopro-collapse-btn" title="Compactar a modo iconos" class="w-7 h-7 rounded-md hover:bg-slate-100 text-slate-400 hover:text-slate-700 flex items-center justify-center transition-colors shrink-0">' +
            '<i class="fa-solid ' + (isCollapsed ? 'fa-angles-right' : 'fa-angles-left') + ' text-xs"></i>' +
          '</button>' +
        '</div>' +
        '<nav class="flex-1 overflow-y-auto px-2 py-2 space-y-0.5">' + navHtml + '</nav>' +
        '<div class="p-2 border-t border-slate-100 flex items-center justify-between bg-slate-50/50">' +
          '<button id="motopro-hide-full-btn" title="Ocultar menú lateral" class="w-full flex items-center justify-center gap-2 py-1.5 px-2 rounded-lg text-[11px] font-semibold text-slate-500 hover:text-red-600 hover:bg-red-50 transition-colors">' +
            '<i class="fa-solid fa-eye-slash text-xs"></i>' +
            '<span class="sb-hide-lbl' + (isCollapsed ? ' hidden' : '') + '">Ocultar Menú</span>' +
          '</button>' +
        '</div>' +
        '<div class="p-2.5 border-t border-slate-100 bg-slate-50">' +
          '<a href="' + desktopBase + 'perfil-usuario.html" class="flex items-center gap-2.5 p-1 rounded-lg hover:bg-white border border-transparent hover:border-slate-200 transition-all">' +
            '<div class="w-7 h-7 rounded-full bg-slate-900 text-orange-400 font-black text-xs flex items-center justify-center shrink-0 border border-slate-300">CM</div>' +
            '<div class="sb-user' + (isCollapsed ? ' hidden' : '') + ' flex-1 min-w-0">' +
              '<p class="text-xs font-bold text-slate-900 truncate leading-tight">Carlos M.</p>' +
              '<p class="text-[9px] text-slate-500 truncate">Jefe de Taller</p>' +
            '</div>' +
          '</a>' +
        '</div>' +
      '</aside>' +
      '<button id="motopro-reopen-toggle-btn" title="Mostrar Menú de Navegación" class="fixed bottom-4 left-4 z-50 bg-slate-900 hover:bg-orange-600 text-white shadow-xl px-3 py-2 rounded-xl flex items-center gap-2 text-xs font-bold transition-all border border-slate-700 hover:scale-105 ' + (isHidden ? 'flex' : 'hidden') + '">' +
        '<i class="fa-solid fa-bars text-sm text-orange-400"></i>' +
        '<span>Mostrar Menú</span>' +
      '</button>';

    var mountPoint = document.getElementById("motopro-sidebar-container");
    if (mountPoint) {
      mountPoint.innerHTML = "";
      mountPoint.appendChild(wrapper);
    } else {
      var targetParent = document.querySelector("body > div.flex") || document.body;
      if (targetParent === document.body) document.body.classList.add("flex");
      targetParent.insertBefore(wrapper, targetParent.firstChild);
    }

    var collapseBtn = document.getElementById("motopro-collapse-btn");
    var hideBtn = document.getElementById("motopro-hide-full-btn");
    var reopenBtn = document.getElementById("motopro-reopen-toggle-btn");
    var asidePanel = document.getElementById("motopro-aside-panel");

    function updateView() {
      if (isCollapsed) {
        asidePanel.classList.remove("w-60"); asidePanel.classList.add("w-16");
        collapseBtn.innerHTML = '<i class="fa-solid fa-angles-right text-xs"></i>';
        collapseBtn.title = "Expandir menú lateral";
        document.querySelectorAll(".sb-text, .sb-badge, .sb-brand, .sb-sec-title, .sb-hide-lbl, .sb-user").forEach(function(el) { el.classList.add("hidden"); });
      } else {
        asidePanel.classList.remove("w-16"); asidePanel.classList.add("w-60");
        collapseBtn.innerHTML = '<i class="fa-solid fa-angles-left text-xs"></i>';
        collapseBtn.title = "Compactar a modo iconos";
        document.querySelectorAll(".sb-text, .sb-brand, .sb-sec-title, .sb-hide-lbl, .sb-user, .sb-badge").forEach(function(el) { el.classList.remove("hidden"); });
      }

      if (isHidden) {
        asidePanel.classList.add("-translate-x-full"); wrapper.classList.add("w-0"); wrapper.classList.remove("shrink-0");
        reopenBtn.classList.remove("hidden"); reopenBtn.classList.add("flex");
      } else {
        asidePanel.classList.remove("-translate-x-full"); wrapper.classList.remove("w-0"); wrapper.classList.add("shrink-0");
        reopenBtn.classList.add("hidden"); reopenBtn.classList.remove("flex");
      }

      localStorage.setItem("motopro_sb_collapsed", isCollapsed ? "true" : "false");
      localStorage.setItem("motopro_sb_hidden", isHidden ? "true" : "false");
    }

    if (collapseBtn) collapseBtn.onclick = function() { isCollapsed = !isCollapsed; updateView(); };
    if (hideBtn) hideBtn.onclick = function() { isHidden = true; updateView(); };
    if (reopenBtn) reopenBtn.onclick = function() { isHidden = false; updateView(); };
    updateView();
  }

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", initMotoProSidebar); else initMotoProSidebar();
})();
