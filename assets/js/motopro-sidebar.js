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
<!-- STITCH_THREEJS_START:ANIMATION_86 class="fixed inset-0 w-full h-full bg-transparent" -->
<div class="fixed inset-0 w-full h-full bg-transparent" style="display:block;">
<script src="https://ajax.googleapis.com/ajax/libs/threejs/r125/three.min.js"></script>
<div id="threejs-container-ANIMATION_86" style="width:100%;height:100%"></div>
<script>
(function() {
  const container = document.getElementById('threejs-container-ANIMATION_86');
  const devicePixelRatio = window.devicePixelRatio || 1;
  /**
 * ==============================================================================
 * 🏍️ MOTOPRO WORKSHOP ERP & POS SYSTEM - NÚCLEO MODULAR DE APLICACIÓN
 * Archivo: assets/js/motopro-core.js
 * Funciones transversales de negocio: sincronización Supabase/Local,
 * formateo monetario (USD/COP con TRM), notificaciones Toast, atajos globales.
 * ==============================================================================
 */

window.MotoPro = (function () {
  'use strict';

  // Configuración predeterminada
  const config = {
    TRM: 4001.20,
    sedeId: 'SEDE-CENTRAL-01',
    sedeNombre: 'Sede Central - Principal Norte',
    pinSupervisor: '8921'
  };

  function formatUSD(amount) {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(amount || 0);
  }

  function formatCOP(amount) {
    return new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0 }).format(amount || 0);
  }

  function showToast(message, type = 'success') {
    const toast = document.createElement('div');
    const colors = {
      success: 'bg-slate-900 border-l-4 border-orange-500 text-white',
      error: 'bg-rose-950 border-l-4 border-rose-500 text-white',
      info: 'bg-slate-900 border-l-4 border-blue-500 text-white'
    };

    toast.className = `motopro-toast fixed bottom-6 right-6 ${colors[type] || colors.success} px-4 py-3 rounded-xl shadow-2xl z-50 flex items-center gap-3 text-sm font-medium border border-slate-700/50`;
    toast.innerHTML = `
      <span class="w-6 h-6 rounded-full bg-orange-500/20 text-orange-400 flex items-center justify-center font-bold text-xs">✓</span>
      <span>${message}</span>
    `;
    document.body.appendChild(toast);
    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transition = 'opacity 0.3s';
      setTimeout(() => toast.remove(), 300);
    }, 3500);
  }

  function setupGlobalShortcuts() {
    window.addEventListener('keydown', (e) => {
      // Ctrl+M: Registro rápido de vales
      if (e.ctrlKey && e.key.toLowerCase() === 'm') {
        e.preventDefault();
        showToast("Atajo Ctrl+M: Accediendo a Vales de Caja Menor...", "info");
        setTimeout(() => {
          const prefix = window.location.pathname.includes('/desktop/') ? '' : 'desktop/';
          window.location.href = prefix + 'egresos-caja-menor.html';
        }, 300);
      }

      // F9: Apertura simulada de gaveta de dinero
      if (e.key === 'F9') {
        e.preventDefault();
        showToast("⚡ Pulso RJ11 24V emitido: Gaveta de dinero abierta.");
      }
    });
  }

  setupGlobalShortcuts();

  return {
    config,
    formatUSD,
    formatCOP,
    showToast
  };
})();

})();
</script>
</div>
<!-- STITCH_THREEJS_END:ANIMATION_86 -->
</body>
</html>
