create database CasaAndina

use CasaAndina
go

--drop database CasaAndina

--use Go
--go

-- Clase 1: Huésped
CREATE TABLE Huesped (
	HuespedId			nchar (10) not null,
	HuespedNombres		nvarchar (150) not null ,
	HuespedApellidos	nvarchar (150) not null ,
	HuespedRegistro		date,
	HuespedEstado		nchar(1) constraint HuespedEstado Default 'A',

	constraint HuespedPK			Primary key (HuespedId),
    constraint HuespedEstadoCK		Check (HuespedEstado = 'A' or HuespedEstado = 'E')
);

-- Clase 2: TiposDocumento
CREATE TABLE TiposDocumento (
	TiposDocumentoId		nchar (10) not null,
	TiposDocumentoHuespedId nchar (10) not null,
	TiposDocumentoNombre	nvarchar (15) not null ,
	TiposDocumentoNumero	nvarchar (15) not null ,
	TiposDocumentoPaisEmision nvarchar (150) not null ,
	TiposDocumentoEstado		nchar(1) constraint TiposDocumentoEstado Default 'A',
	
	constraint TiposDocumentoPK		Primary key (TiposDocumentoId),
	constraint TiposDocumentoEstadoCK		Check (TiposDocumentoEstado = 'A' or TiposDocumentoEstado = 'E'),
	constraint TiposDocumentoNombreCk	check (TiposDocumentoNombre in ('DNI','Carnet','Pasaporte')),
	constraint TiposDocumentoNumerock	check (TiposDocumentoNumero not like '%[^0-9]%'),
	constraint TiposDocumentoHuespedFK	Foreign key (TiposDocumentoHuespedId)
		references Huesped (HuespedId)
);

-- Clase 3: CORREOS
CREATE TABLE Email (
	EmailId		nchar (10) not null,
	EmailHuespedId nchar (10) not null,
	EmailTipo	nvarchar (15) not null ,
	EmailNombre	nvarchar (150) not null,
	EmailEstado		nchar(1) constraint EmailEstado Default 'A',

	constraint EmailPK		Primary key (EmailId),
	constraint EmailEstadoCK		Check (EmailEstado = 'A' or EmailEstado = 'E'),
	constraint EmailTipoCk	check (EmailTipo in ('Personal','Institucional','Corporativo')),
	--P = Personal
	--I = Institucional
	--C = Corporativo
	constraint EmailNombreck	check (EmailNombre like '%_@_%._%'),
	constraint EmailHuespedFK	Foreign key (EmailHuespedId)
		references Huesped (HuespedId)
);

-- Clase 4: Telefono
CREATE TABLE Telefono (
	TelefonoId		nchar (10) not null,
	TelefonoHuespedId nchar (10) not null,
	TelefonoTipo	nvarchar (15) not null ,
	TelefonoNumero	nvarchar (9) not null,
	TelefonoEstado		nchar(1) constraint TelefonoEstado Default 'A',
	
	constraint TelefonoPK		Primary key (TelefonoId),
	constraint TelefonoEstadoCK		Check (TelefonoEstado = 'A' or TelefonoEstado = 'E'),
	constraint TelefonoTipoCk	check (TelefonoTipo in ('Personal','Institucional','Corporativo')),
	constraint TelefonoNumerock	check (TelefonoNumero not like '%[^0-9]%'),
	constraint TelefonoHuespedFK	Foreign key (TelefonoHuespedId)
		references Huesped (HuespedId)
);

-- Clase 5: Departamento
CREATE TABLE Departamento (
    DepartamentoId		nchar (6) not null,
    Departamentonombre	nvarchar (150) not null,

	constraint DepartamentoPk Primary key (DepartamentoId)
);

-- Clase 6: Provincia
CREATE TABLE Provincia (
    ProvinciaId				nchar (6) not null,
	ProvinciaDepartamentoID nchar (6) not null,
    ProvinciaNombre			nvarchar (150) not null,
    
	constraint ProvinciaPk Primary key (ProvinciaId),
    constraint ProvinciaDepartamentoFK	Foreign key (ProvinciaDepartamentoID)
		references Departamento (DepartamentoId)
);

-- Clase 7: Distrito
CREATE TABLE Distrito (
    DistritoID			nchar (6) not null,
	DistritoProvinciaId nchar (6) not null,
    DistritoNombre		nvarchar (150) not null,

    constraint DistritoPk Primary key (DistritoID),
	constraint DistritoProvinciaFK	Foreign key (DistritoProvinciaId)
		references Provincia (ProvinciaId)
);

-- Clase 8: Direccion
CREATE TABLE Direccion (
    DireccionId			nchar (10) not null,
	DireccionHuespedId	nchar (10) not null,
    DireccionCompleta	nvarchar (150) not null,
	
    constraint DireccionPk		Primary key (DireccionId),
	constraint DireccionHuespedFK	Foreign key (DireccionHuespedId)
		references Huesped (HuespedId)
);

-- Clase 9: Sucursal
CREATE TABLE Sucursal (
    SucursalId			nchar (10) not null,
    Sucursalnombre		nvarchar (150) not null,
    SucursalDistritoID	nchar (6) not null,
	SucursalTipo	nvarchar (150) not null,

	constraint SucursalPk		Primary key (SucursalId),
	constraint SucursalDistritoFK	Foreign key (SucursalDistritoID)
		references Distrito (DistritoID)

);

-- Clase 10: Tipo Habitacion
CREATE TABLE TipoHabitacion (
    TipoHabitacionId nchar (10) not null,
    TipoHabitacionTipo nvarchar (150) not null,
    TipoHabitacionDescripcion nvarchar (150) not null,
	TipoHabitacionCapacidad nchar (2) not null,
	TipoHabitacionPrecio DECIMAL(10,2),
	TipoHabitacionEstado		nchar(1) constraint TipoHabitacionEstado Default 'A',

    constraint TipoHabitacionPk				Primary key (TipoHabitacionId),
	constraint TipoHabitacionEstadoCK		Check (TipoHabitacionEstado = 'A' or TipoHabitacionEstado = 'E'),

);

-- Clase 11: Habitación
CREATE TABLE Habitacion (
    HabitacionId nchar (10) not null,
	HabitacionTipoHabitacionId nchar (10) not null,
    HabitacionSucursalId nchar (10) not null,
	HabitacionEstado nchar (15) not null,
	HabitacionEstatus		nchar(1) constraint HabitacionEstatus Default 'A',
    
    constraint HabitacionPk		Primary key (HabitacionId),
	constraint HabitacionEstatusCK		Check (HabitacionEstatus = 'A' or HabitacionEstatus = 'E'),
	constraint HabitacionEstadoCk	check (HabitacionEstado in ('Ocupado','Disponible','Limpieza')),
	--O = Ocupada
	--D = Disponible
	--L = En limpieza
	constraint HabitacionTipoHabitacionFK	Foreign key (HabitacionTipoHabitacionId)
		references TipoHabitacion (TipoHabitacionId)
);

-- Clase 12: Servicio
CREATE TABLE Servicio (
    ServicioId nchar (10) not null,
    ServicioTipo nvarchar (150) not null,
    ServicioDescripcion nvarchar (150) not null,
    
    constraint ServicioPk	Primary key (ServicioId)
);

-- Clase 13: SucursalServicio
CREATE TABLE SucursalServicio (
    SucursalServicioServicioId nchar (10) not null,
    SucursalServicioSucursalId nchar (10) not null,
    
    constraint SucursalServicioPk	Primary key (SucursalServicioServicioId,SucursalServicioSucursalId),
	constraint SucursalServicioServicioFK	Foreign key (SucursalServicioServicioId)
		references Servicio (ServicioId),
	constraint SucursalServicioSucursalFK	Foreign key (SucursalServicioSucursalId)
		references Sucursal (SucursalId)
);
-- Clase 14: Instalaciones
CREATE TABLE Instalaciones  (
    InstalacionesId nchar (10) not null,
    InstalacionesTipo nvarchar (150) not null,
    InstalacionesDescripcion nvarchar (150) not null,
    
    constraint InstalacionesPk	Primary key (InstalacionesId)
);

-- Clase 15: SucursalInstalaciones
CREATE TABLE SucursalInstalaciones (
    SucursalInstalacionesInstalacionesId nchar (10) not null,
    SucursalInstalacionesSucursalId nchar (10) not null,
    
    constraint SucursalInstalacionesPk	Primary key (SucursalInstalacionesInstalacionesId,SucursalInstalacionesSucursalId),
	constraint SucursalInstalacionesInstalacionesFK	Foreign key (SucursalInstalacionesInstalacionesId)
		references Instalaciones (InstalacionesId),
	constraint SucursalInstalacionesSucursalFK	Foreign key (SucursalInstalacionesSucursalId)
		references Sucursal (SucursalId)
);

-- Clase 16: Reserva
CREATE TABLE Reserva (
    ReservaId nchar (10) not null,
    ReservaHuespedId nchar (10) not null,
    ReservaSucursalId nchar (10) not null,
    ReservaHabitacionId nchar (10) not null,
    Reservafecha_entrada DATE NOT NULL,
    Reservafecha_salida DATE NOT NULL,
    ReservaEstado nchar (15) not null,

	constraint ReservaPk	Primary key (ReservaId),
	constraint ReservaEstadoCk	check (ReservaEstado in ('Nueva','Confirmada','Pendiente','Cancelada','Finalizada')),
    constraint ReservaHuespedFK	Foreign key (ReservaHuespedId)
		references Huesped (HuespedId),
	constraint ReservaSucursalFK Foreign key (ReservaSucursalId)
		references Sucursal (SucursalId),
	constraint ReservaHabitacionFK	Foreign key (ReservaHabitacionId)
		references Habitacion (HabitacionId)
);

-- Clase 17: Comprobante
CREATE TABLE Comprobante (
    ComprobanteId nchar (10) not null,
    ComprobanteReservaId nchar (10) not null,
    Comprobantefecha DATE NOT NULL,
    ComprobanteMonto DECIMAL(10,2) NOT NULL,
    ComprobanteDetalle nvarchar (150) not null,

	constraint ComprobantePk	Primary key (ComprobanteId),
	constraint ComprobanteReservaFK Foreign key (ComprobanteReservaId)
		references Reserva (ReservaId) 
);
--Clase 18: Tipos de Pago
CREATE TABLE TipoPago (
    TipoPagoId	nchar (10) not null,
    TipoPagoNombre nvarchar (150) not null, -- Ej: Contado, Crédito

	constraint TipoPagoPk	Primary key (TipoPagoId)
);

--Clase 19: Formas de Pago
CREATE TABLE FormaPago ( 
	FormaPagoId	nchar (10) not null,
    FormaPagoNombre nvarchar (150) not null, -- Ej: Efectivo, Tarjeta, Yape, Transferencia

	constraint FormaPagoPk	Primary key (FormaPagoId)
);

-- Clase 20: Pago
CREATE TABLE Pago (
    PagoId nchar (10) not null,
    PagoComprobanteId nchar (10) not null,
	PagoTipoPagoId nchar (10) not null,
	PagoFormaPagoId nchar (10) not null,
    Pagofecha DATE NOT NULL,
    Pagomonto DECIMAL(10,2) NOT NULL,
	

    constraint PagoPk	Primary key (PagoId),
	constraint PagoComprobanteFK Foreign key (PagoComprobanteId)
		references Comprobante (ComprobanteId), 
	constraint PagoTipoPagoFK Foreign key (PagoTipoPagoId)
		references TipoPago (TipoPagoId), 
	constraint PagoFormaPagoFK Foreign key (PagoFormaPagoId)
		references FormaPago (FormaPagoId)

);

-- Clase 21: Encuesta
CREATE TABLE Encuesta (
    EncuestaId nchar (10) not null,
    EncuestaHuespedId nchar (10) not null,
    EncuestaSucursalId nchar (10) not null,
    EncuestaFecha DATE,
    Encuestapuntuacion nchar (1) not null,
	

	constraint EncuestaPk	Primary key (EncuestaId),
	constraint EncuestaHuespedFK Foreign key (EncuestaHuespedId)
		references Huesped (HuespedId), 
	constraint EncuestaSucursalFK Foreign key (EncuestaSucursalId)
		references Sucursal (SucursalId)
);

-- Clase 22: Ingreso
CREATE TABLE Ingreso (
    IngresoId nchar (10) not null,
    IngresoSucursalId nchar (10) not null,
    IngresoFecha DATE NOT NULL,
    IngresoMonto DECIMAL(10,2),
    
    constraint IngresoPk	Primary key (IngresoId),
	constraint IngresoSucursalFK Foreign key (IngresoSucursalId)
		references Sucursal (SucursalId)
);

-- Clase 23: Gasto
CREATE TABLE Gasto (
    GastoId nchar (10) not null,
    GastoSucursalId nchar (10) not null,
    GastoFecha DATE NOT NULL,
    GastoMonto DECIMAL(10,2),
	GastoMotivo nvarchar (150) not null,
    
    constraint GastoPk	Primary key (GastoId),
	constraint GastoSucursalFK Foreign key (GastoSucursalId)
		references Sucursal (SucursalId)
);
-- Clase 24: ReseñaRedSocial
CREATE TABLE Resena (
    ResenaId nchar (10) not null,
    ResenaHuespedId nchar (10) not null,
    Resenaplataforma nvarchar (150) not null,  -- Google, TikTok, Booking
    Resenacomentario nvarchar (150) not null,
    Resenapuntuacion nchar (1) not null,
    Resenafecha DATE,
    Resenaenlace nvarchar (150) not null,
    
	constraint ResenaIdPk	Primary key (ResenaId),
	constraint ResenaHuespedFK Foreign key (ResenaHuespedId)
		references Huesped (HuespedId)
);

-- Clase 25: Check-in y Check-out
CREATE TABLE CheckInCheckOut (
    CheckInCheckOutId nchar (10) not null,
    CheckInCheckOutReservaId nchar (10) not null,
    CheckInCheckOutEntrada DATE NOT NULL,
	CheckInCheckOutHoraE time NOT NULL,
    CheckInCheckOutSalida DATE NOT NULL,
	CheckInCheckOutHoraS time NOT NULL,
    CheckInCheckOutEstado nvarchar (150) not null,  -- Ej. 'completado', 'pendiente', 'cancelado'
    
	constraint CheckInCheckOutPk	Primary key (CheckInCheckOutId),
	constraint CheckInCheckOutEstadoCk	check (CheckInCheckOutEstado in ('Completado','Pendiente','Cancelado')),

	constraint CheckInCheckOutReservaFK Foreign key (CheckInCheckOutReservaId)
		references Reserva (ReservaId)
);

-- Clase 26: Producto (Alimentos y Bebidas)
CREATE TABLE Producto (
    ProductoId nchar (10) not null,
    ProductoNombre nvarchar (150) not null,
    ProductoDescripcion nvarchar (150) not null,
    ProductoPrecio DECIMAL(10,2) NOT NULL,
    ProductoTipo nvarchar (50) not null, -- Ej. 'Alimento', 'Bebida'

	constraint ProductoPk	Primary key (ProductoId)
);

-- Clase 27: Venta de Productos (Alimentos y Bebidas)
CREATE TABLE VentaProducto (
    VentaProductoId nchar (10) not null,
    VentaProductoSucursalId nchar (10) not null,
    VentaProductoHuespedId nchar (10) not null,
    VentaProductoProductoId nchar (10) not null,  -- Relacionado con el Producto vendido
    VentaProductoCantidad nchar (10) not null,
    VentaProductoPrecio DECIMAL(10,2) NOT NULL,
    VentaProductoFecha DATE NOT NULL,

	constraint VentaProductoPk	Primary key (VentaProductoId),
	constraint VentaProductoSucursalFK Foreign key (VentaProductoSucursalId)
		references Sucursal (SucursalId),
	constraint VentaProductoHuespedFK Foreign key (VentaProductoHuespedId)
		references Huesped (HuespedId),
	constraint VentaProductoProductoFK Foreign key (VentaProductoProductoId)
		references Producto (ProductoId)
);


-- Clase 28: Pago por Venta de Producto
CREATE TABLE PagoVentaProducto (
    PagoVentaProductoId nchar (10) not null,
    PagoVentaProductoVentaProductoId nchar (10) not null,  -- Relacionado con la venta de producto
    PagoVentaProductoPagoId nchar (10) not null,            -- Relacionado con el pago realizado
    PagoVentaProductoFecha DATE NOT NULL,
    PagoVentaProductoMonto DECIMAL(10,2) NOT NULL,
    PagoVentaProductoFormaPagoId nchar (10) not null,  -- Ej. 'Tarjeta', 'Efectivo', 'Transferencia'

	constraint PagoVentaProductoPk	Primary key (PagoVentaProductoId),
	constraint PagoVentaProductoVentaProductoFK Foreign key (PagoVentaProductoVentaProductoId)
		references VentaProducto (VentaProductoId),
	constraint PagoVentaProductoPagoFK Foreign key (PagoVentaProductoPagoId)
		references Pago (PagoId),
	constraint PagoVentaProductoFormaPagoFK Foreign key (PagoVentaProductoFormaPagoId)
		references FormaPago (FormaPagoId)
);

-- Clase 29: Cancelación de Reserva
CREATE TABLE CancelacionReserva (
    CancelacionReservaId nchar (10) not null,
    CancelacionReservaReservaId nchar (10) not null,
    CancelacionReservaCancelacion DATE NOT NULL,
    CancelacionReservaMotivo nvarchar (150) not null,  -- Motivo de la cancelación
    CancelacionReservaDevuelto DECIMAL(10,2),  -- Monto a devolver al huésped, si aplica
    CancelacionReservaEstado nvarchar (150) not null,  -- Ej. 'completada', 'pendiente'
    
	constraint CancelacionReservaPk	Primary key (CancelacionReservaId),
	constraint CancelacionReservaReservaFK Foreign key (CancelacionReservaReservaId)
		references Reserva (ReservaId)
);

-- Clase 30: Personal
CREATE TABLE Personal (
    EmpleadoId nchar (10) not null,
    
    SucursalId NCHAR(10) NOT NULL,          -- FK con tabla Sucursal
    FechaIngreso DATE NOT NULL,
    FechaSalida DATE NULL,                  -- NULL si sigue activo

    Nombre NVARCHAR(100) NOT NULL,
    Puesto NVARCHAR(100) NOT NULL,

    -- Clave foránea para relacionar con Sucursal
    FOREIGN KEY (SucursalId) REFERENCES Sucursal(SucursalId)
);

/*
HU= Clase 1: Huésped
TD= Clase 2: TiposDocumento
CO= Clase 3: CORREOS
TE= Clase 4: Telefono
DE= Clase 5: Departamento
PR= Clase 6: Provincia
DI= Clase 7: Distrito
DR= Clase 8: Direccion
SU= Clase 9: Sucursal
TH= Clase 10: Tipo Habitacion
HA= Clase 11: Habitación
SE= Clase 12: Servicio
SS= Clase 13: SucursalServicio
IN= Clase 14: Instalaciones
SI= Clase 15: SucursalInstalaciones
RE= Clase 16: Reserva
CB= Clase 17: Comprobante
TP=Clase 18: Tipos de Pago
FP=Clase 19: Formas de Pago
PA= Clase 20: Pago
EN= Clase 21: Encuesta
IG= Clase 22: Ingreso
GA= Clase 23: Gasto
RR= Clase 24: ReseñaRedSocial
CH= Clase 25: Check-in y Check-out
PO= Clase 26: Producto (Alimentos y Bebidas)
VE= Clase 27: Venta de Productos (Alimentos y Bebidas)
PV= Clase 28: Pago por Venta de Producto
CR= Clase 29: Cancelación de Reserva
PE= Clase 30: Personal
*/

--========================================================INSERTAR DATOS ========================================================



