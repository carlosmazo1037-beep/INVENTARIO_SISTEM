---
name: Apex Utilitarian
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#584237'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#8c7164'
  outline-variant: '#e0c0b1'
  surface-tint: '#9d4300'
  primary: '#9d4300'
  on-primary: '#ffffff'
  primary-container: '#f97316'
  on-primary-container: '#582200'
  inverse-primary: '#ffb690'
  secondary: '#565e74'
  on-secondary: '#ffffff'
  secondary-container: '#dae2fd'
  on-secondary-container: '#5c647a'
  tertiary: '#006398'
  on-tertiary: '#ffffff'
  tertiary-container: '#40a2e7'
  on-tertiary-container: '#003655'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdbca'
  primary-fixed-dim: '#ffb690'
  on-primary-fixed: '#341100'
  on-primary-fixed-variant: '#783200'
  secondary-fixed: '#dae2fd'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3f465c'
  tertiary-fixed: '#cce5ff'
  tertiary-fixed-dim: '#93ccff'
  on-tertiary-fixed: '#001d31'
  on-tertiary-fixed-variant: '#004b73'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.01em
  headline-xl:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.015em
  headline-lg:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.005em
  body-lg:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: 0em
  body-md:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.01em
  tabular-mono-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  tabular-mono-md:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '500'
    lineHeight: 18px
    letterSpacing: 0em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-xs:
    fontFamily: Inter
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.05em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-dense: 0.5rem
  margin: 1.5rem
  margin-mobile: 0.75rem
  space-2xs: 0.125rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 0.75rem
  space-lg: 1rem
  space-xl: 1.5rem
  space-2xl: 2rem
---

## Brand & Style

This design system embodies a disciplined, industrial-grade operational environment engineered for fast-paced motorcycle workshops, dealership service bays, and high-turnover parts counters. The aesthetic reflects mechanical precision, tool-grade reliability, and situational clarity. It borrows the utilitarian confidence of automotive diagnostics and the rapid scanning ergonomics of flight deck avionics.

### Design Movements & Visual Language
- **Utilitarian Dashboard Architecture:** High-density, high-legibility structures prioritizing functional data over decorative flourish. Every container, cell, and divider serves to orient the technician, service writer, or parts manager.
- **Engineered Restraint:** Surfaces are dominated by cool neutral slates and clean white workspace tiles, allowing vibrant motorsport safety amber to function as an unambiguous signal for active selections, critical actions, and key states.
- **Tactile Precision:** Crisp 1px structural borders, subtle surface elevations, and tight mechanical radiuses (`rounded-sm` to `rounded-md`) establish an organized, rugged software tool that feels as solid and dependable as a calibrated torque wrench.

### Target Audience & Emotional Intent
- **Technicians & Shop Foremen:** Demanding instant status visibility, clear repair ticket workflows, and smudge-tolerant, high-contrast readability under variable shop lighting.
- **Service Advisors & Parts Clerks:** Requiring rapid POS entry, instant VIN/chassis search, high-density inventory tables, and fast branch switching without visual friction.
- **Tone:** Methodical, high-velocity, reliable, unyielding.

## Colors

The system uses a calibrated palette combining deep architectural slates with high-visibility safety orange accents. While the interface is light-mode first for maximum contrast in illuminated service desks and parts departments, deep tones form the structural scaffolding (navigation headers, dark mode sidebars, and critical table footers).

### Color Roles & Tonal Palette

- **Primary (`#F97316` / `#EA580C`):** High-visibility motorsport safety amber. Reserved for primary operational CTAs ("Clock In Job", "Finalize Repair Order", "Commit Inventory"), active state indicators, focus rings, and high-priority system alerts.
- **Secondary (`#0F172A` / `#1E293B`):** Deep carbon slate. Used for structural frame boundaries, top-level navigation, table header text, and high-impact numerical readouts.
- **Tertiary (`#0284C7`):** Precision technical cyan/blue. Used for informational indicators, diagnostic statuses, barcode scan highlights, and branch-switching selectors.
- **Neutral System:**
  - `Canvas / Background`: `#F8FAFC` (Slate 50) - Neutral industrial floor.
  - `Surface / Card`: `#FFFFFF` - Crisp work surface.
  - `Subtle Surface`: `#F1F5F9` (Slate 100) - Inactive cell fills, zebra stripes, input backings.
  - `Structural Border`: `#E2E8F0` (Slate 200) - Standard 1px divisional boundaries.
  - `Emphasized Border`: `#CBD5E1` (Slate 300) - Focused or hovered separators.
  - `Muted Text`: `#64748B` (Slate 500) - Metadata, SKU descriptions, secondary timestamps.
  - `Body Text`: `#334155` (Slate 700) - Primary reading, tabular values.
  - `Title & Display`: `#0F172A` (Slate 900) - High-contrast headers.

### Functional Status Indicators
- **Operational Green (`#16A34A` / Fill: `#DCFCE7`):** "Job Complete", "In Stock", "Ready for Pickup".
- **Attention Amber (`#F59E0B` / Fill: `#FEF3C7`):** "Awaiting Parts", "Bay Idle", "Estimate Pending".
- **Critical Red (`#DC2626` / Fill: `#FEE2E2`):** "Safety Hold", "Out of Stock", "Recall Notice".
- **Diagnostic Purple (`#7C3AED` / Fill: `#EDE9FE`):** "Warranty Claim", "OEM Inspection Required".

## Typography

Typography prioritizes scan speed, optical density, and zero ambiguity between numerals and glyphs. Using **Inter** systematically across all roles guarantees uniform rendering, extensive metric weights, and comprehensive OpenType tabular figures.

### Tabular Formatting Rules
- **Financial & Quantity Data:** All financial amounts, hourly job timers, inventory quantities, and parts SKU numbers must enforce `font-feature-settings: "tnum" 1, "zero" 1` (tabular numerals with slashed zero) to maintain perfect vertical column alignment in high-density data tables.
- **Labels & Tags:** Small badge labels and table column indicators use uppercase micro-typography (`label-xs`, 10px, weight 700, tracked out at `+0.05em`) to ensure legibility when rendered in colored container pills.
- **Chassis & Part Identifiers:** Barcodes, VINs, and OEM serial strings pair `body-sm` with tabular spacing or dedicated monospaced glyph sets to avoid confusion between `0` and `O`, `1` and `I`.

## Layout & Spacing

The layout is built upon an uncompromising 4px / 8px incremental scale optimized for dense multi-pane interfaces. It accommodates side-by-side diagnostic schematics, active job boards, POS cash drawers, and warehouse bin lookups.

### Layout Philosophy
- **Modular Fluid Multi-Pane:** The canvas uses a dynamic split-pane architecture. The global system shell reserves a collapsed 64px (or expanded 220px) navigation sidebar, an omnipresent 48px top status utility bar (branch switcher, active clock-in status, scanner listener), and fluid work surfaces that scale to multi-monitor workshop displays.
- **Data-Dense Grids:** Standard dashboards use a 12-column fluid grid with `1rem` (16px) gutters. Complex sub-panels (e.g., Parts Picker, Repair Order Work Order items) transition into a high-density layout mode utilizing `0.5rem` (8px) gutters to compress maximum interactive line items into the vertical viewport.
- **Adaptive Breakpoints:**
  - `Desktop Wide (≥1440px)`: Three-column layout (e.g., Navigation | Work Order Queue | Job Detail & Parts Bin).
  - `Desktop Standard (1024px - 1439px)`: Two-column split layout with slide-out drawer sheets.
  - `Tablet / Bay Terminal (768px - 1023px)`: Single column main view with touch-optimized 44px minimum tap targets for technician tablets.
  - `Mobile Handheld (<768px)`: Stacked vertical flow, docked bottom utility bar for barcode scanning and quick job clocking.

## Elevation & Depth

Visual hierarchy is established through structural layering and crisp tonal containment rather than high-blur floating shadows. In harsh garage environments or under bright terminal lighting, diffuse shadows lose definition; razor-sharp structural lines and low-offset elevation cues preserve optical boundaries.

### Elevation Levels

1. **Surface 0 (Floor Canvas - `#F8FAFC`):** The master application shell and grid underlay. Flat, non-elevated.
2. **Surface 1 (Card & Module Workspace - `#FFFFFF`):** Work order panels, inventory summary modules, and line-item lists. Surrounded by a crisp 1px border (`#E2E8F0`) with a tight structural shadow:
   - `box-shadow: 0 1px 2px 0 rgba(15, 23, 42, 0.05)`
3. **Surface 2 (Interactive Floating / Active Row Selection):** Hovered parts items, drag-active repair tickets, and dropdown containers:
   - `box-shadow: 0 4px 6px -1px rgba(15, 23, 42, 0.08), 0 2px 4px -2px rgba(15, 23, 42, 0.04)`
   - Border: `#CBD5E1`
4. **Surface 3 (Overlays, Modals, & Scanner HUDs):** Diagnostic scanners, branch switch popovers, checkout settlement dialogs:
   - `box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.12), 0 4px 6px -4px rgba(15, 23, 42, 0.06)`
   - Border: `#94A3B8`

## Shapes

The design system standardizes on **Level 1 (Soft)** roundedness. Edges are tight, disciplined, and mechanical, reflecting machined automotive components and industrial tool screens.

### Shape Scale
- **Micro Radii (`0.125rem` / 2px):** Checkbox boxes, progress bar segments, status pip markers.
- **Base Radii (`0.25rem` / 4px):** Form inputs, buttons, table cell selections, badge chips, barcode labels.
- **Container Radii (`0.375rem` - `0.5rem` / 6px - 8px):** Cards, workshop kanban tiles, modal frames, POS summary sidebars.
- **Circular (`9999px`):** Avatar indicators, operational presence dots, counter pills. Circular styling is strictly excluded from actionable buttons to preserve an authoritative, non-toy aesthetic.

## Components

### Buttons & Action Triggers
- **Primary Action (Safety Amber):** Solid `#F97316` background, `#FFFFFF` text, `0.25rem` radius, `0.5rem 1rem` padding. States: Hover `#EA580C`, Active `#C2410C`, Focus ring 2px `#F97316` offset 2px. Font: 13px, Weight 600.
- **Secondary Action (Structural Slate):** Solid `#0F172A` background, `#FFFFFF` text. Used for terminal actions (e.g., "Print Invoice", "Post to Ledger").
- **Auxiliary Outline:** `#FFFFFF` background, 1px `#E2E8F0` border, `#334155` text. Hover: `#F8FAFC` background, `#0F172A` text.
- **Destructive:** Border `#FCA5A5`, text `#DC2626`, hover background `#FEE2E2`.

### Inputs & Data Capture
- **Standard Input:** Height 36px, background `#FFFFFF`, border 1px `#CBD5E1`, border-radius `0.25rem`, padding `0 0.75rem`. Text: `13px Inter`. Placeholder: `#94A3B8`. Focus: Border `#F97316`, shadow ring `0 0 0 1px #F97316`.
- **Barcode / Scanner Input:** Height 40px, tinted `#F0F9FF` (Sky 50) fill, border 1px `#0284C7` (Sky 600), tabular monospace font. Left icon features an optic scan beam glyph.
- **Tabular Data Grid Inputs:** Height 28px inline table editing inputs. Zero outer shadow, subtle `#E2E8F0` border, tabular numerals.

### Badges, Motorcycle Brand Chips & Status Indicators
- **Vehicle Identifier Badge:** Dedicated pill displaying brand metadata (e.g., "YAMAHA MT-09", "DUCATI V4S"). Background `#F1F5F9`, border 1px `#E2E8F0`, text `#1E293B`, uppercase `11px Inter 700`.
- **Status Pills:** Background tinted at 10% opacity, border 1px tinted at 25% opacity, text in full status saturation:
  - *In Service Bay:* Background `#FEF3C7`, Text `#B45309`, Border `#FDE68A`.
  - *Completed:* Background `#DCFCE7`, Text `#15803D`, Border `#BBF7D0`.
  - *Parts Backorder:* Background `#FEE2E2`, Text `#B91C1C`, Border `#FECACA`.

### Multi-Branch Switcher & Header Bar
- Prominent header component pinned at top-left. Dropdown trigger displaying active location name, branch ID code, and inventory synchronization beacon (green pulse dot).
- Quick keyboard access (`Cmd/Ctrl + K`) to switch between Main Showroom, Service Workshop, and Remote Warehouse.

### POS & Parts Register Module
- **Split Screen Transaction Architecture:** Left pane contains active line item register; right pane contains numeric keypad, tender options, and quick-add parts bins.
- **Register Line Items:** Compressed 32px height rows with SKU, description, quantity stepper (- / +), unit price (tabular mono), and trash trigger.
- **Order Total Readout:** High-contrast `#0F172A` slate container with safety amber emphasized final sum in `32px display-lg` tabular numerals.