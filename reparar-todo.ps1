# 1. Crear carpetas de la nueva arquitectura
"desktop", "mobile", "assets\css", "assets\js", "database", "api" | ForEach-Object { if (-not (Test-Path $_)) { New-Item -ItemType Directory -Path $_ -Force | Out-Null } }

# 2. Extraer index.html a la raiz
Get-ChildItem -Recurse -Filter "code.html" | Where-Object { $_.FullName -like "*index*" } | Select-Object -First 1 | ForEach-Object { Copy-Item $_.FullName "index.html" -Force }

# 3. Mapear y mover pantallas a la carpeta desktop/
$map = @{
    "*taller*ordenes*"         = "desktop\ordenes-taller.html"
    "*dashboard*pos*"          = "desktop\dashboard-pos.html"
    "*perfil*usuario*"         = "desktop\perfil-usuario.html"
    "*inventario*movimientos*" = "desktop\inventario-movimientos.html"
    "*recepcion*inspeccion*"   = "desktop\recepcion-inspeccion.html"
    "*diagnostico*cotizacion*" = "desktop\diagnostico-cotizacion.html"
    "*factura*liquidacion*"    = "desktop\factura-liquidacion.html"
    "*arqueo*cierre*"          = "desktop\arqueo-cierre-reporte-z.html"
    "*egresos*caja*"           = "desktop\egresos-caja-menor.html"
    "*formas*pago*"            = "desktop\formas-de-pago.html"
    "*garantias*reclamos*"     = "desktop\garantias-reclamos.html"
    "*configuracion*sedes*"    = "desktop\configuracion-sedes.html"
    "*login*"                  = "desktop\login-multiusuario.html"
}
foreach ($pattern in $map.Keys) {
    Get-ChildItem -Recurse -Filter "code.html" | Where-Object { $_.DirectoryName -like $pattern } | Select-Object -First 1 | ForEach-Object { Copy-Item $_.FullName $map[$pattern] -Force }
}

# 4. Mapear pantallas moviles a mobile/
$mobileMap = @{
    "*portal*cliente*whatsapp*" = "mobile\portal-cliente-whatsapp.html"
    "*bahia*mecanico*tactil*"   = "mobile\bahia-mecanico-tactil.html"
    "*captura*evidencias*voz*"  = "mobile\captura-evidencias-voz.html"
}
foreach ($pattern in $mobileMap.Keys) {
    Get-ChildItem -Recurse -Filter "code.html" | Where-Object { $_.DirectoryName -like $pattern } | Select-Object -First 1 | ForEach-Object { Copy-Item $_.FullName $mobileMap[$pattern] -Force }
}

# 5. Generar componente universal e infalible de Menú Lateral (assets/js/motopro-sidebar.js)
$sidebar = @'
(function() {
  function render() {
    var mount = document.getElementById("motopro-sidebar-container");
    if (!mount) return;
    var isDesktop = window.location.pathname.indexOf("/desktop/") !== -1;
    var base = isDesktop ? "" : "desktop/";
    var root = isDesktop ? "../" : "";
    var cur = window.location.pathname.split("/").pop() || "index.html";
    var isCol = localStorage.getItem("motopro_sidebar_collapsed") === "true";

    var links = [
      { sec: "Operaciones Taller" },
      { name: "Dashboard & Caja POS", href: "dashboard-pos.html", icon: "fa-cash-register" },
      { name: "Inventario & Kardex", href: "inventario-movimientos.html", icon: "fa-boxes-stacked", badge: "OEM" },
      { name: "Taller & Órdenes", href: "ordenes-taller.html", icon: "fa-wrench", badge: "14" },
      { name: "Recepción 360°", href: "recepcion-inspeccion.html", icon: "fa-clipboard-check" },
      { name: "Diagnóstico & Baremo", href: "diagnostico-cotizacion.html", icon: "fa-calculator" },
      { sec: "Punto de Venta & Fiscal" },
      { name: "Factura & Liquidación", href: "factura-liquidacion.html", icon: "fa-file-invoice-dollar", badge: "POS" },
      { name: "Arqueo Z & Turnos", href: "arqueo-cierre-reporte-z.html", icon: "fa-vault" },
      { name: "Vales Caja Menor", href: "egresos-caja-menor.html", icon: "fa-receipt", badge: "Ctrl+M" },
      { sec: "Administración" },
      { name: "Mi Perfil & Seguridad", href: "perfil-usuario.html", icon: "fa-user-gear", badge: "Activo" }
    ];

    var html = "";
    links.forEach(function(i) {
      if (i.sec) {
        html += '<div class="px-4 pt-3 pb-1 text-[10px] font-bold text-slate-400 uppercase tracking-wider' + (isCol ? ' hidden' : '') + '">' + i.sec + '</div>';
      } else {
        var act = cur === i.href;
        html += '<a href="' + base + i.href + '" class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all ' + (act ? 'bg-orange-50 text-orange-600 font-bold border-l-4 border-orange-500 shadow-sm' : 'text-slate-600 hover:bg-slate-50 hover:text-orange-600') + '">' +
          '<i class="fa-solid ' + i.icon + ' w-5 text-center ' + (act ? 'text-orange-500' : 'text-slate-400') + '"></i>' +
          '<span class="truncate flex-1' + (isCol ? ' hidden' : '') + '">' + i.name + '</span>' +
          (i.badge && !isCol ? '<span class="px-1.5 py-0.5 text-[10px] font-bold rounded-full ' + (act ? 'bg-orange-500 text-white' : 'bg-slate-100 text-slate-600') + '">' + i.badge + '</span>' : '') +
          '</a>';
      }
    });

    mount.innerHTML = '<aside id="motopro-sidebar" class="' + (isCol ? 'w-20' : 'w-64') + ' bg-white border-r border-slate-200 h-screen sticky top-0 flex flex-col shrink-0 z-40 transition-all select-none shadow-sm">' +
      '<div class="h-16 px-4 border-b border-slate-100 flex items-center justify-between">' +
        '<a href="' + root + 'index.html" class="flex items-center gap-2.5 overflow-hidden">' +
          '<span class="w-9 h-9 rounded-xl bg-orange-500 text-white flex items-center justify-center font-black shadow-md shadow-orange-500/30 shrink-0"><i class="fa-solid fa-motorcycle text-base"></i></span>' +
          '<div class="flex flex-col' + (isCol ? ' hidden' : '') + '"><span class="font-extrabold text-sm tracking-tight text-slate-900 leading-none">MOTOPRO</span><span class="text-[10px] font-semibold text-orange-600 tracking-widest mt-0.5">Workshop ERP</span></div>' +
        '</a>' +
        '<button id="sb-toggle" class="w-8 h-8 rounded-lg hover:bg-slate-100 text-slate-400 flex items-center justify-center"><i class="fa-solid ' + (isCol ? 'fa-angles-right' : 'fa-angles-left') + ' text-xs"></i></button>' +
      '</div>' +
      '<nav class="flex-1 overflow-y-auto px-2 py-3 space-y-1">' + html + '</nav>' +
      '<div class="p-3 border-t border-slate-100 bg-slate-50/70">' +
        '<a href="' + base + 'perfil-usuario.html" class="flex items-center gap-3 p-1.5 rounded-xl hover:bg-white transition-all">' +
          '<img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&h=150&q=80" alt="Avatar" class="w-8 h-8 rounded-full object-cover border border-slate-200 shrink-0">' +
          '<div class="' + (isCol ? ' hidden' : '') + ' flex-1 min-w-0"><p class="text-xs font-bold text-slate-900 truncate">Carlos Mendoza</p><p class="text-[10px] text-slate-500 truncate">Jefe de Taller</p></div>' +
        '</a>' +
      '</div>' +
    '</aside>';

    var btn = document.getElementById("sb-toggle");
    if (btn) btn.onclick = function() {
      var next = localStorage.getItem("motopro_sidebar_collapsed") === "true" ? "false" : "true";
      localStorage.setItem("motopro_sidebar_collapsed", next);
      render();
    };
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", render); else render();
})();
'@
Set-Content -Path "assets\js\motopro-sidebar.js" -Value $sidebar -Encoding UTF8

Write-Host "`n[✓] ¡Listo! Carpetas organizadas, index.html extraído y menú JS reparado." -ForegroundColor Green
Write-Host "Arrastra la carpeta completa a Netlify ahora." -ForegroundColor Yellow