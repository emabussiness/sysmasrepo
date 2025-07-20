# Roadmap de Desarrollo del Sistema de Gestión Empresarial (SYSMAS)

Este documento detalla la ruta de desarrollo propuesta para el sistema SYSMAS, dividida por módulos funcionales y sus componentes.

## 1. MÓDULO DE COMPRAS

### 1.1. Entidades y Relaciones
- `Proveedores`
- `PedidosCompra` (relación con `Proveedores`)
- `PedidosCompraDetalles` (relación con `PedidosCompra`, `Productos`)
- `OrdenesCompra` (relación con `PedidosCompra`)
- `OrdenesCompraDetalles` (relación con `OrdenesCompra`, `Productos`)
- `Compras` (relación con `Proveedores`, `OrdenesCompra`, `TiposDocumento`)
- `ComprasDetalles` (relación con `Compras`, `Productos`)
- `CuentasPorPagar` (relación con `Compras`)
- `CuentasPorPagarPagos` (relación con `CuentasPorPagar`, `FormasPago`, `Bancos`)
- `LibroIvaCompras` (relación con `Compras`)
- `NotasRemisionCompra` (relación con `Compras`)
- `NotasCreditoDebitoCompra` (relación con `Compras`)

### 1.2. Repositorios (Spring Data JPA)
- `ProveedorRepository`
- `ProductoRepository`
- `PedidoCompraRepository`
- `OrdenCompraRepository`
- `FacturaCompraRepository`
- `NotaRemisionCompraRepository`
- `NotaCreditoCompraRepository`
- `NotaDebitoCompraRepository`
- `CuentaPagarRepository`

### 1.3. Servicios (Lógica de Negocio)
- `ProveedorService`
- `ProductoService`
- `PedidoCompraService` (incluye lógica para generar `OrdenCompra`)
- `CompraService` (incluye lógica para registrar `FacturaCompra`, `NotaRemisionCompra`, `NotaCreditoCompra`, `NotaDebitoCompra`)
- `StockService` (actualización de stock al confirmar compra)
- `CuentaPagarService`
- `LibroIVAService` (para IVA compras)
- `InformeCompraService`

### 1.4. Controladores (MVC con Thymeleaf)
- `ProveedorController`
- `ProductoController`
- `PedidoCompraController`
- `CompraController`
- `CuentaPagarController`
- `InformeCompraController`

### 1.5. Vistas y Formularios (HTML con Bootstrap)
- Formularios para CRUD de `Proveedor`, `Producto`
- Formularios para `PedidoCompra`, `OrdenCompra`, `FacturaCompra`
- Vistas de listado y detalle para cada entidad
- Vistas para informes de compras

### 1.6. Scripts de Base de Datos (PostgreSQL)
- Scripts para creación de tablas y datos de ejemplo para el módulo de compras.

## 2. MÓDULO DE SERVICIOS TÉCNICOS

### 2.1. Entidades y Relaciones
- `RecepcionEquipos` (relación con `Clientes`)
- `Diagnosticos` (relación con `RecepcionEquipos`, `Usuarios`)
- `PresupuestosServicio` (relación con `RecepcionEquipos`, `Diagnosticos`)
- `PresupuestosServicioDetalles` (relación con `PresupuestosServicio`, `Productos`)
- `OrdenesServicio` (relación con `PresupuestosServicio`)
- `ServiciosRealizados` (relación con `OrdenesServicio`, `Usuarios`)
- `ServiciosInsumosUtilizados` (relación con `ServiciosRealizados`, `Productos`)
- `RetirosEquipos` (relación con `RecepcionEquipos`)
- `GarantiasServicio` (relación con `ServiciosRealizados`)
- `ReclamosServicio` (relación con `Clientes`, `ServiciosRealizados`)

### 2.2. Repositorios
- `ClienteRepository`
- `EquipoRepository`
- `RecepcionEquipoRepository`
- `DiagnosticoRepository`
- `PresupuestoServicioRepository`
- `OrdenServicioRepository`
- `ServicioRealizadoRepository`
- `InsumoRepository`
- `RetiroEquipoRepository`
- `GarantiaServicioRepository`
- `ReclamoTecnicoRepository`
- `TecnicoRepository`

### 2.3. Servicios
- `ClienteService`
- `EquipoService`
- `RecepcionEquipoService`
- `DiagnosticoService`
- `PresupuestoServicioService`
- `OrdenServicioService`
- `ServicioRealizadoService`
- `InsumoService`
- `RetiroEquipoService`
- `GarantiaServicioService`
- `ReclamoTecnicoService`
- `TecnicoService`
- `InformeServicioService`

### 2.4. Controladores
- `ClienteController`
- `RecepcionEquipoController`
- `DiagnosticoController`
- `PresupuestoServicioController`
- `OrdenServicioController`
- `ServicioRealizadoController`
- `RetiroEquipoController`
- `InformeServicioController`

### 2.5. Vistas y Formularios
- Formularios para CRUD de `Cliente`, `Equipo`, `Tecnico`, `Insumo`
- Formularios para `RecepcionEquipo`, `Diagnostico`, `PresupuestoServicio`, `OrdenServicio`, `ServicioRealizado`, `RetiroEquipo`
- Vistas de listado y detalle
- Vistas para informes de servicios técnicos

### 2.6. Scripts de Base de Datos
- Scripts para creación de tablas y datos de ejemplo para el módulo de servicios técnicos.

## 3. MÓDULO DE VENTA Y FACTURACIÓN

### 3.1. Entidades y Relaciones
- `PresupuestosVenta` (relación con `Clientes`, `PedidosVenta`)
- `PresupuestosVentaDetalles` (relación con `PresupuestosVenta`, `Productos`)
- `PedidosVenta` (relación con `Clientes`)
- `PedidosVentaDetalles` (relación con `PedidosVenta`, `Productos`)
- `Ventas` (relación con `Clientes`, `TiposDocumento`, `PresupuestosVenta`, `PedidosVenta`)
- `DetalleVentas` (relación con `Ventas`, `Productos`)
- `NotasRemision` (relación con `Ventas`, `Usuarios`, `Personal`, `Clientes`, `Vehiculos`)
- `NotasRemisionDetalles` (relación con `NotasRemision`, `Productos`)
- `Facturas` (relación con `Ventas`, `Clientes`, `TiposDocumento`, `ConfiguracionTimbrados`)
- `DetalleFacturas` (relación con `Facturas`, `Productos`)
- `LibroIvaVentas` (relación con `Ventas`)
- `NotasCreditoDebitoVenta` (relación con `Ventas`)
- `ConfiguracionTimbrados` (relación con `Sucursales`, `TiposDocumento`)
- `Cobros` (relación con `Ventas`, `ServiciosRealizados`)
- `DetalleCobros` (relación con `Cobros`, `FormasPago`, `Bancos`)
- `ComprobantesPago` (relación con `Cobros`, `TiposDocumento`)
- `Cajas` (relación con `Sucursales`)
- `SesionesCaja` (relación con `Usuarios`, `Cajas`)
- `AperturaCaja` (relación con `SesionesCaja`)
- `CierreCaja` (relación con `SesionesCaja`)
- `MovimientosCaja` (relación con `SesionesCaja`, `FormasPago`, `Bancos`)
- `ArqueoCaja` (relación con `SesionesCaja`)
- `Recaudaciones` (relación con `SesionesCaja`, `Bancos`, `FormasPago`)

### 3.2. Repositorios
- `CajaRepository`
- `SesionCajaRepository`
- `PedidoVentaRepository`
- `PresupuestoVentaRepository`
- `CobroRepository`
- `TipoCobroRepository`
- `EntidadBancariaRepository`
- `FacturaVentaRepository`
- `NotaRemisionVentaRepository`
- `NotaCreditoVentaRepository`
- `NotaDebitoVentaRepository`
- `ArqueoCajaRepository`
- `CierreCajaRepository`

### 3.3. Servicios
- `CajaService` (apertura, cierre, arqueo)
- `SesionCajaService`
- `PedidoVentaService`
- `PresupuestoVentaService`
- `CobroService` (manejo de diferentes tipos de cobro)
- `FacturacionService` (generación de `FacturaVenta`, `NotaRemisionVenta`, `NotaCreditoVenta`, `NotaDebitoVenta`)
- `StockService` (resta productos al vender)
- `LibroIVAService` (para IVA ventas)
- `InformeVentaService`

### 3.4. Controladores
- `CajaController`
- `PedidoVentaController`
- `PresupuestoVentaController`
- `CobroController`
- `FacturacionController`
- `InformeVentaController`

### 3.5. Vistas y Formularios
- Formularios para apertura/cierre de caja, registro de cobros
- Formularios para `PedidoVenta`, `PresupuestoVenta`, `FacturaVenta`
- Vistas de listado y detalle
- Vistas para arqueo y cierre de caja
- Vistas para informes de ventas

### 3.6. Scripts de Base de Datos
- Scripts para creación de tablas y datos de ejemplo para el módulo de venta y facturación.

## 4. FUNCIONALIDADES TRANSVERSALES y GLOBALES

### 4.1. Sistema de Stock Único y Centralizado
- `StockActual` (relación con `Productos`, `Depositos`)
- `StockMovimientos` (relación con `Productos`, `Depositos`)
- `TransferenciasStock` (relación con `Productos`, `Depositos`, `Usuarios`)
- `Depositos` (relación con `Sucursales`)
- `Productos` (relación con `CategoriasProductos`, `UnidadesMedida`)
- `CategoriasProductos`
- `UnidadesMedida`
- `StockService` (métodos para sumar, restar, ajustar stock)

### 4.2. Sistema de Usuarios con Roles y Permisos
- `Usuarios` (relación con `Empresa`)
- `Roles`
- `Permisos`
- `UsuariosRoles` (relación con `Usuarios`, `Roles`)
- `UsuariosPermisos` (relación con `Usuarios`, `Permisos`)
- `RolesPermisos` (relación con `Roles`, `Permisos`)
- `Personal` (relación con `Usuarios`)
- `Empresa`
- `Sucursales` (relación con `Empresa`)
- `Vehiculos` (relación con `Sucursales`)
- `UsuarioRepository`, `RolRepository`, `PermisoRepository`
- `UsuarioService`, `RolService`, `PermisoService`
- `SecurityConfig` (Spring Security)
- Controladores para gestión de usuarios y roles
- Vistas para login, gestión de usuarios y roles

### 4.3. Gestión de Sesiones de Caja
- Asegurar que cada movimiento monetario esté vinculado a una `SesionCaja` activa.

### 4.4. Emisión de Facturas Condicional
- Lógica en `FacturacionService` para emitir o no facturas según configuración y cliente.

### 4.5. Registro de Transacciones Bancarias
- Campos en `Cobro` para `entidadBancaria` y `numeroTransaccion`.

### 4.6. Resumen de Cierre de Caja
- Lógica en `CierreCajaService` para agrupar cobros por tipo.

### 4.7. Cálculo Automático de IVA
- Lógica en servicios de compras y ventas para calcular IVA.

## 5. MÓDULO DE SEGURIDAD, AUDITORÍA Y LOGS

### 5.1. Entidades y Relaciones
- `AuditoriaMovimientos` (relación con `Usuarios`)
- `LogErroresSistema`
- `HistorialAccesos` (relación con `Usuarios`)

### 5.2. Repositorios
- `AuditoriaMovimientosRepository`
- `LogErroresSistemaRepository`
- `HistorialAccesosRepository`

### 5.3. Servicios
- `AuditoriaService`
- `LogService`
- `AccesoService`

### 5.4. Controladores
- Controladores para visualización de logs y auditorías (posiblemente solo para roles administrativos).

### 5.5. Vistas y Formularios
- Vistas para consultar registros de auditoría, errores y accesos.

### 5.6. Scripts de Base de Datos
- Scripts para creación de tablas y datos de ejemplo para el módulo de seguridad, auditoría y logs.

## 5. TECNOLOGÍAS Y CONFIGURACIÓN

### 5.1. Backend (Java + Spring Boot)
- Configuración de `application.properties` para base de datos.
- Configuración de Spring Security.
- Implementación de validaciones (`@Valid`).

### 5.2. Base de Datos (PostgreSQL)
- Asegurar la creación de la base de datos `bd_sysmas`.
- Scripts iniciales para tablas y datos maestros.

### 5.3. Frontend (Thymeleaf + Bootstrap 5)
- Integración de Bootstrap en `static` folder.
- Creación de layouts base para Thymeleaf.

### 5.4. Informes
- Implementación de vistas HTML para informes.
- Considerar librerías para exportación a PDF/Excel (ej. iText, Apache POI) en fases posteriores.

## Próximos Pasos Inmediatos

1.  **Crear la entidad `Cliente`** como base para los módulos de Servicios Técnicos y Ventas.
2.  **Implementar CRUD básico para `Cliente`** utilizando Spring Data JPA, un `ClienteService` y un `ClienteController` con vistas Thymeleaf.
3.  **Integrar Bootstrap 5** en las plantillas Thymeleaf para una interfaz básica.