create database CasaAndina_Mart

use CasaAndina_Mart
go

CREATE TABLE DimTiempo (
    id_fecha INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    anio INT,
    mes INT,
    nombre_mes VARCHAR(20),
    trimestre INT,
    semana INT,
    dia INT,
    nombre_dia VARCHAR(20)
);



CREATE TABLE DimHabitacion (
    TipoHabitacionKey INT IDENTITY(1,1) PRIMARY KEY,
	TipoHabitacionId NCHAR(10),
    TipoHabitacionTipo NVARCHAR(150),
    TipoHabitacionCapacidad NCHAR(2),
    TipoHabitacionPrecio DECIMAL(10,2)
);

CREATE TABLE DimSucursal (
    SucursalKey INT IDENTITY(1,1) PRIMARY KEY,
	SucursalId NCHAR(10),
    Sucursalnombre NVARCHAR(150),
    SucursalDistritoID NCHAR(6),
    SucursalTipo NVARCHAR(150),
	DistritoNombre NVARCHAR(150),
	ProvinciaId	 nchar (6) not null,
	ProvinciaNombre			nvarchar (150) not null,
	DepartamentoId		nchar (6) not null,
	Departamentonombre	nvarchar (150) not null
);

CREATE TABLE DimResena (
    ResenaKey INT IDENTITY(1,1) PRIMARY KEY,
	ResenaId NCHAR(10),
    FuenteResena NVARCHAR(150) NOT NULL,
	EncuestaId nchar (10),
	EncuestaSucursalId nchar (10) not null,
);

CREATE TABLE HechosEstadias (
    id_estadia INT IDENTITY(1,1) PRIMARY KEY,

    TipoHabitacionKey INT,
    SucursalKey INT,
    CheckInCheckOutId INT,
    ResenaKey INT,

    noches_estadia INT,
    tarifa_total_estadia DECIMAL(10,2),
    ingreso_operativo DECIMAL(10,2),
    costo_operativo DECIMAL(10,2),

    puntaje_satisfaccion DECIMAL(5,2),

    FOREIGN KEY (TipoHabitacionKey) REFERENCES DimHabitacion(TipoHabitacionKey),
    FOREIGN KEY (SucursalKey) REFERENCES DimSucursal(SucursalKey),
    FOREIGN KEY (CheckInCheckOutId) REFERENCES DimTiempo(id_fecha),
    FOREIGN KEY (ResenaKey) REFERENCES DimResena(ResenaKey),
);

  CREATE TABLE HechosKPI_SucursalTiempo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    SucursalKey INT,
    FechaKey INT, -- FK con DimTiempo
    HabitacionesDisponibles INT,
    HabitacionesOcupadas INT,
    EmpleadosActivos INT,
    EmpleadosSalientes INT,

    FOREIGN KEY (SucursalKey) REFERENCES DimSucursal(SucursalKey),
    FOREIGN KEY (FechaKey) REFERENCES DimTiempo(id_fecha)
);

use CasaAndina
go
--======================================= Habitacion ======================================= 
--SELECT DIMENSION Habitacion

select DH.TipoHabitacionKey,DH.TipoHabitacionId,DH.TipoHabitacionTipo,DH.TipoHabitacionCapacidad,DH.TipoHabitacionPrecio
from [CasaAndina_Mart].dbo.DimHabitacion DH

select H.TipoHabitacionId,H.TipoHabitacionTipo,H.TipoHabitacionCapacidad,H.TipoHabitacionPrecio
from [CasaAndina].[dbo].[TipoHabitacion] H


--MIGRACION

--Tabla destino
insert into [CasaAndina_Mart].dbo.DimHabitacion 
(TipoHabitacionId,TipoHabitacionTipo,TipoHabitacionCapacidad,TipoHabitacionPrecio)

--Tabla Origen
select H.TipoHabitacionId,H.TipoHabitacionTipo,H.TipoHabitacionCapacidad,H.TipoHabitacionPrecio
from [CasaAndina].[dbo].[TipoHabitacion] H

--======================================= Sucursal ======================================= 
--SELECT DIMENSION Habitacion

INSERT INTO [CasaAndina_Mart].dbo.DimSucursal (
    SucursalId,
    SucursalNombre,
    SucursalDistritoID,
    SucursalTipo,
    DistritoNombre,
    ProvinciaId,
    ProvinciaNombre,
    DepartamentoId,
    DepartamentoNombre
)
SELECT 
    S.SucursalId,
    S.SucursalNombre,
    S.SucursalDistritoID,
    S.SucursalTipo,
    D.DistritoNombre,
    D.DistritoProvinciaId AS ProvinciaId,
    P.ProvinciaNombre,
    P.ProvinciaDepartamentoID AS DepartamentoId,
    DEP.Departamentonombre AS DepartamentoNombre
FROM 
    [CasaAndina].[dbo].[Sucursal] S
LEFT JOIN 
    [CasaAndina].[dbo].[Distrito] D ON S.SucursalDistritoID = D.DistritoID
LEFT JOIN 
    [CasaAndina].[dbo].[Provincia] P ON D.DistritoProvinciaId = P.ProvinciaId
LEFT JOIN 
    [CasaAndina].[dbo].[Departamento] DEP ON P.ProvinciaDepartamentoID = DEP.DepartamentoId;



--======================================= Reseña ======================================= 
--SELECT DIMENSION Reseña

SELECT 
    DR.ResenaKey,
    DR.ResenaId,
    DR.FuenteResena,
    DR.EncuestaId,
    DR.EncuestaSucursalId,
    R.Resenaplataforma AS PlataformaFuente,
    S.Sucursalnombre AS NombreSucursal,
    E.Encuestapuntuacion,
    E.EncuestaFecha
FROM 
    [CasaAndina_Mart].dbo.DimResena DR
LEFT JOIN 
    [CasaAndina].[dbo].[Resena] R ON DR.ResenaId = R.ResenaId
LEFT JOIN 
    [CasaAndina].[dbo].[Sucursal] S ON DR.EncuestaSucursalId = S.SucursalId
LEFT JOIN 
    [CasaAndina].[dbo].[Encuesta] E ON DR.EncuestaId = E.EncuestaId;


INSERT INTO [CasaAndina_Mart].dbo.DimResena (
    ResenaId,
    FuenteResena,
    EncuestaId,
    EncuestaSucursalId
)
SELECT 
    R.ResenaId,
    R.Resenaplataforma,
    E.EncuestaId,
    E.EncuestaSucursalId
FROM 
    [CasaAndina].[dbo].[Resena] R
LEFT JOIN 
    [CasaAndina].[dbo].[Encuesta] E ON R.ResenaHuespedId = E.EncuestaHuespedId;

--======================================= Tiempo ======================================= 

INSERT INTO CasaAndina_Mart.dbo.DimTiempo(fecha, anio, mes, nombre_mes, trimestre, semana, dia, nombre_dia)
SELECT 
    f.fecha,
    YEAR(f.fecha) AS anio,
    MONTH(f.fecha) AS mes,
    DATENAME(MONTH, f.fecha) AS nombre_mes,
    DATEPART(QUARTER, f.fecha) AS trimestre,
    DATEPART(WEEK, f.fecha) AS semana,
    DAY(f.fecha) AS dia,
    DATENAME(WEEKDAY, f.fecha) AS nombre_dia
FROM (
    SELECT DISTINCT CheckInCheckOutEntrada AS fecha FROM CasaAndina.dbo.CheckInCheckOut
    UNION
    SELECT DISTINCT CheckInCheckOutSalida FROM CasaAndina.dbo.CheckInCheckOut
) AS f
WHERE f.fecha IS NOT NULL
ORDER BY f.fecha;

SELECT *
FROM [CasaAndina_Mart].[dbo].[DimTiempo] 

--======================================= ESTADIA ======================================= 
INSERT INTO CasaAndina_Mart.dbo.HechosEstadias (
    TipoHabitacionKey,
    SucursalKey,
    CheckInCheckOutId,
    ResenaKey,
    noches_estadia,
    tarifa_total_estadia,
    ingreso_operativo,
    costo_operativo,
    puntaje_satisfaccion
)
SELECT
    DH.TipoHabitacionKey,
    DS.SucursalKey,
    DT.id_fecha,
    DR.ResenaKey,
    
    DATEDIFF(DAY, CICO.CheckInCheckOutEntrada, CICO.CheckInCheckOutSalida) AS noches_estadia,
    
    DATEDIFF(DAY, CICO.CheckInCheckOutEntrada, CICO.CheckInCheckOutSalida) * TH.TipoHabitacionPrecio AS tarifa_total_estadia,
    
    DATEDIFF(DAY, CICO.CheckInCheckOutEntrada, CICO.CheckInCheckOutSalida) * TH.TipoHabitacionPrecio AS ingreso_operativo,
    
    DATEDIFF(DAY, CICO.CheckInCheckOutEntrada, CICO.CheckInCheckOutSalida) * TH.TipoHabitacionPrecio * 0.30 AS costo_operativo,
    
    -- Puntaje de satisfacción combinado
    COALESCE((
        CAST(RP.total_puntaje AS FLOAT) / NULLIF(RP.total_items, 0)
    ), 3) AS puntaje_satisfaccion

FROM CasaAndina.dbo.Reserva RV
INNER JOIN CasaAndina.dbo.CheckInCheckOut CICO ON RV.ReservaId = CICO.CheckInCheckOutReservaId
INNER JOIN CasaAndina.dbo.Habitacion H ON RV.ReservaHabitacionId = H.HabitacionId
INNER JOIN CasaAndina.dbo.TipoHabitacion TH ON H.HabitacionTipoHabitacionId = TH.TipoHabitacionId
INNER JOIN CasaAndina.dbo.Sucursal S ON RV.ReservaSucursalId = S.SucursalId

-- Subconsulta que combina puntajes de reseñas y encuestas por huésped
LEFT JOIN (
    SELECT 
        HuespedId,
        SUM(CAST(Resenapuntuacion AS FLOAT)) + SUM(CAST(EncuestaPuntaje AS FLOAT)) AS total_puntaje,
        COUNT(Resenapuntuacion) + COUNT(EncuestaPuntaje) AS total_items
    FROM (
        SELECT 
            ResenaHuespedId AS HuespedId,
            Resenapuntuacion,
            NULL AS EncuestaPuntaje
        FROM CasaAndina.dbo.Resena
        WHERE Resenapuntuacion IS NOT NULL

        UNION ALL

        SELECT 
            EncuestaHuespedId AS HuespedId,
            NULL AS Resenapuntuacion,
            Encuestapuntuacion
        FROM CasaAndina.dbo.Encuesta
        WHERE Encuestapuntuacion IS NOT NULL
    ) AS Sub
    GROUP BY HuespedId
) RP ON RV.ReservaHuespedId = RP.HuespedId

LEFT JOIN CasaAndina.dbo.Resena R ON RV.ReservaHuespedId = R.ResenaHuespedId
    AND R.Resenafecha BETWEEN RV.Reservafecha_entrada AND RV.Reservafecha_salida

LEFT JOIN CasaAndina.dbo.Encuesta E ON RV.ReservaHuespedId = E.EncuestaHuespedId
    AND E.EncuestaFecha BETWEEN RV.Reservafecha_entrada AND RV.Reservafecha_salida

INNER JOIN CasaAndina_Mart.dbo.DimHabitacion DH ON TH.TipoHabitacionId = DH.TipoHabitacionId
INNER JOIN CasaAndina_Mart.dbo.DimSucursal DS ON S.SucursalId = DS.SucursalId
INNER JOIN CasaAndina_Mart.dbo.DimTiempo DT ON CAST(CICO.CheckInCheckOutEntrada AS DATE) = DT.fecha
LEFT JOIN CasaAndina_Mart.dbo.DimResena DR ON R.ResenaId = DR.ResenaId

WHERE CICO.CheckInCheckOutEntrada IS NOT NULL
  AND CICO.CheckInCheckOutSalida IS NOT NULL
  AND CICO.CheckInCheckOutEntrada <= CICO.CheckInCheckOutSalida;
  --======================================= dos ======================================= 

INSERT INTO CasaAndina_Mart.dbo.HechosKPI_SucursalTiempo (
    SucursalKey,
    FechaKey,
    HabitacionesDisponibles,
    HabitacionesOcupadas,
    EmpleadosActivos,
    EmpleadosSalientes
)
SELECT 
    DS.SucursalKey,
    DT.id_fecha,

    -- Habitaciones disponibles en la sucursal
    (
        SELECT COUNT(*) 
        FROM CasaAndina.dbo.Habitacion H 
        WHERE RTRIM(H.HabitacionSucursalId) = RTRIM(S.SucursalId)
    ) AS HabitacionesDisponibles,

    -- Habitaciones ocupadas ese día en esa sucursal (según reserva)
    (
        SELECT COUNT(DISTINCT R.ReservaHabitacionId)
        FROM CasaAndina.dbo.Reserva R
        JOIN CasaAndina.dbo.Habitacion H ON R.ReservaHabitacionId = H.HabitacionId
        WHERE CAST(R.Reservafecha_entrada AS DATE) = DT.fecha
          AND RTRIM(H.HabitacionSucursalId) = RTRIM(S.SucursalId)
    ) AS HabitacionesOcupadas,

    -- Empleados activos ese día
    (
        SELECT COUNT(*) 
        FROM CasaAndina.dbo.Personal P 
        WHERE RTRIM(P.SucursalId) = RTRIM(S.SucursalId)
          AND P.FechaIngreso <= DT.fecha 
          AND (P.FechaSalida IS NULL OR P.FechaSalida > DT.fecha)
    ) AS EmpleadosActivos,

    -- Empleados salientes ese día
    (
        SELECT COUNT(*) 
        FROM CasaAndina.dbo.Personal P 
        WHERE RTRIM(P.SucursalId) = RTRIM(S.SucursalId)
          AND P.FechaSalida = DT.fecha
    ) AS EmpleadosSalientes

FROM 
    CasaAndina_Mart.dbo.DimTiempo DT
CROSS JOIN 
    CasaAndina.dbo.Sucursal S
JOIN 
    CasaAndina_Mart.dbo.DimSucursal DS ON RTRIM(DS.SucursalId) = RTRIM(S.SucursalId)
WHERE 
    DT.fecha BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 
    DS.SucursalKey, DT.id_fecha, DT.fecha, S.SucursalId;





