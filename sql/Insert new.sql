use CasaAndina
go
--HU= Clase 1: Hu�sped
DECLARE @counter INT = 1;
WHILE @counter <= 8000
BEGIN
    INSERT INTO Huesped (HuespedId, HuespedNombres, HuespedApellidos, HuespedRegistro, HuespedEstado)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter AS NVARCHAR(10)), 10),
        'Nombre' + CAST(@counter AS NVARCHAR(10)),
        'Apellido' + CAST(@counter AS NVARCHAR(10)),
        DATEADD(DAY, -@counter, GETDATE()),
        'A'
    );
    SET @counter = @counter + 1;
END;

--TD= Clase 2: TiposDocumento
DECLARE @counter2 INT = 1;
WHILE @counter2 <= 8000
BEGIN
    INSERT INTO TiposDocumento (TiposDocumentoId, TiposDocumentoHuespedId, TiposDocumentoNombre, TiposDocumentoNumero, TiposDocumentoPaisEmision, TiposDocumentoEstado)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter2 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter2 AS NVARCHAR(10)), 10),
        'DNI',
        '12345678' + CAST(@counter2 AS NVARCHAR(10)),
        'Per�',
        'A'
    );
    SET @counter2 = @counter2 + 1;
END;

--CO= Clase 3: CORREOS
DECLARE @counter3 INT = 1;
WHILE @counter3 <= 8000
BEGIN
    INSERT INTO Email (EmailId, EmailHuespedId, EmailTipo, EmailNombre, EmailEstado)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter3 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter3 AS NVARCHAR(10)), 10),
        CASE WHEN @counter3 % 3 = 0 THEN 'Personal' WHEN @counter3 % 3 = 1 THEN 'Institucional' ELSE 'Corporativo' END,
        'hu' + CAST(@counter3 AS NVARCHAR(10)) + '@dominio.com',
        'A'
    );
    SET @counter3 = @counter3 + 1;
END;

--TE= Clase 4: Telefono
DECLARE @counter4 INT = 1;
WHILE @counter4 <= 8000
BEGIN
    INSERT INTO Telefono (
        TelefonoId, 
        TelefonoHuespedId, 
        TelefonoTipo, 
        TelefonoNumero, 
        TelefonoEstado
    )
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter4 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter4 AS NVARCHAR(10)), 10),
        CASE 
            WHEN @counter4 % 3 = 0 THEN 'Personal'       -- valor v�lido para TelefonoTipo
            WHEN @counter4 % 3 = 1 THEN 'Institucional'
            ELSE 'Corporativo'
        END,
        '987654' + RIGHT('000' + CAST(@counter4 AS NVARCHAR), 3),
        'A'
    );
    SET @counter4 = @counter4 + 1;
END;


-- Clase 5: Departamento
insert into Departamento([DepartamentoId], [Departamentonombre]) values 
('010000','Amazonas'),
('020000','�ncash'),
('030000','Apur�mac'),
('040000','Arequipa'),
('050000','Ayacucho'),
('060000','Cajamarca'),
('070000','Callao'),
('080000','Cusco'),
('090000','Huancavelica'),
('100000','Hu�nuco'),
('110000','Ica'),
('120000','Jun�n'),
('130000','La Libertad'),
('140000','Lambayeque'),
('150000','Lima'),
('160000','Loreto'),
('170000','Madre de Dios'),
('180000','Moquegua'),
('190000','Pasco'),
('200000','Piura'),
('210000','Puno'),
('220000','San Mart�n'),
('230000','Tacna'),
('240000','Tumbes'),
('250000','Ucayali')
go
-- Clase 6: Provincia
insert into Provincia([ProvinciaId], [ProvinciaDepartamentoID], [ProvinciaNombre]) values 
('150100','150000','LIMA'),
('080100','080000','CUSCO'),
('081300','080000','URUBAMBA'),
('080800','080000','ESPINAR'),
('040100','040000','AREQUIPA'),
('040500','040000','CAYLLOMA'),
('110500','110000','PISCO'),
('110300','110000','NASCA'),
('110200','110000','CHINCHA '),
('200100','200000','PIURA'),
('200700','200000','TALARA'),
('130100','130000','TRUJILLO'),
('210100','210000','PUNO'),
('250100','250000','CORONEL PORTILLO'),
('240200','240000','CONTRALMIRANTE VILLAR'),
('140100','140000','CHICLAYO'),
('180100','180000','MARISCAL NIETO'),
('230100','230000','TACNA'),
('010100','010000','CHACHAPOYAS'),
('120300','120000','CHANCHAMAYO'),
('170100','170000','TAMBOPATA')
go
-- Clase 7: Distrito
insert into Distrito([DistritoID], [DistritoProvinciaId], [DistritoNombre]) values 
('150122','150100','MIRAFLORES'),
('150131','150100','SAN ISIDRO'),
('080101','080100','CUSCO'),
('081301','081300','URUBAMBA'),
('080803','080800','COPORAQUE'),
('040101','040100','AREQUIPA'),
('040501','040500','CHIVAY'),
('110507','110500','SAN CLEMENTE'),
('110301','110300','NASCA'),
('110201','110200','CHINCHA ALTA'),
('200101','200100','PIURA'),
('200701','200700','PARI�AS'),
('130101','130100','TRUJILLO'),
('210101','210100','PUNO'),
('250101','250100','CALLERIA'),
('240201','240200','ZORRITOS'),
('140101','140100','CHICLAYO'),
('180101','180100','MOQUEGUA'),
('230101','230100','TACNA'),
('010101','010100','CHACHAPOYAS'),
('120301','120300','CHANCHAMAYO'),
('170101','170100','TAMBOPATA')
go
-- Clase 8: Direccion
CREATE PROCEDURE InsertarDirecciones
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @counter8 INT = 1;

    WHILE @counter8 <= 8000
    BEGIN
        INSERT INTO Direccion (DireccionId, DireccionHuespedId, DireccionCompleta)
        VALUES 
        (
            RIGHT('0000000000' + CAST(@counter8 AS NVARCHAR(10)), 10), -- DireccionId
            RIGHT('0000000000' + CAST(@counter8 AS NVARCHAR(10)), 10), -- DireccionHuespedId (debe existir en Huesped)
            N'Calle Principal ' + CAST(@counter8 AS NVARCHAR(10)) + ', Ciudad XYZ' -- DireccionCompleta
        );

        SET @counter8 = @counter8 + 1;
    END
END;

EXEC InsertarDirecciones;
-- Clase 9: Sucursal
INSERT INTO Sucursal ([SucursalId], [Sucursalnombre], [SucursalDistritoID], [SucursalTipo])
SELECT V.*
FROM (VALUES
('SU00000001','Casa Andina Premium Miraflores','150122','Premium'),
('SU00000002','Casa Andina Select Miraflores','150122','Select'),
('SU00000003','Casa Andina Premium San Isidro','150131','Premium'),
('SU00000004','Casa Andina Standard Miraflores Centro','150122','Standard'),
('SU00000005','Casa Andina Standard Miraflores San Antonio','150122','Standard'),
('SU00000006','Casa Andina Premium Cusco','080101','Premium'),
('SU00000007','Casa Andina Premium Valle Sagrado Hotel & Villas','081301','Premium'),
('SU00000008','Casa Andina Standard Cusco Koricancha','080101','Standard'),
('SU00000009','Casa Andina Standard Cusco Catedral','080101','Standard'),
('SU00000010','Casa Andina Standard Cusco Plaza','080101','Standard'),
('SU00000011','Casa Andina Standard Cusco San Blas','080101','Standard'),
('SU00000012','Casa Andina Standard Machu Picchu','080803','Standard'),
('SU00000013','Casa Andina Premium Arequipa','040101','Premium'),
('SU00000014','Casa Andina Select Arequipa Plaza','040101','Select'),
('SU00000015','Casa Andina Standard Arequipa','040101','Standard'),
('SU00000016','Casa Andina Standard Colca','040501','Standard'),
('SU00000017','Casa Andina Select Paracas','110507','Select'),
('SU00000018','Casa Andina Standard Nasca','110301','Standard'),
('SU00000019','Casa Andina Standard Chincha','110201','Standard'),
('SU00000020','Casa Andina Premium Piura','200101','Premium'),
('SU00000021','Casa Andina Standard Piura','200101','Standard'),
('SU00000022','Casa Andina Standard Talara','200701','Standard'),
('SU00000023','Casa Andina Standard Trujillo Plaza','130101','Standard'),
('SU00000024','Casa Andina Premium Puno','210101','Premium'),
('SU00000025','Casa Andina Standard Puno','210101','Standard'),
('SU00000026','Casa Andina Select Pucallpa','250101','Select'),
('SU00000027','Casa Andina Select Zorritos Tumbes','240201','Select'),
('SU00000028','Casa Andina Select Chiclayo','140101','Select'),
('SU00000029','Casa Andina Select Moquegua','180101','Select'),
('SU00000030','Casa Andina Select Tacna','230101','Select'),
('SU00000031','Casa Andina Standard Chachapoyas','010101','Standard'),
('SU00000032','Casa Andina Standard Chanchamayo','120301','Standard'),
('SU00000033','Casa Andina Standard Puerto Maldonado','170101','Standard')
) AS V(SucursalId, Sucursalnombre, SucursalDistritoID, SucursalTipo)
WHERE NOT EXISTS (
    SELECT 1 FROM Sucursal S WHERE S.SucursalId = V.SucursalId
);

-- Clase 10: Tipo Habitacion
CREATE PROCEDURE InsertarTiposHabitacion
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar solo si no existe cada TipoHabitacionId
    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000001')
    BEGIN
        INSERT INTO TipoHabitacion (TipoHabitacionId, TipoHabitacionTipo, TipoHabitacionDescripcion, TipoHabitacionCapacidad, TipoHabitacionPrecio, TipoHabitacionEstado) VALUES
        ('TH00000001', 'Simple', 'Habitaci�n individual con cama sencilla', '1', 150.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000002')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000002', 'Doble', 'Habitaci�n con dos camas individuales', '2', 220.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000003')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000003', 'Matrimonial', 'Habitaci�n con cama queen para dos personas', '2', 250.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000004')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000004', 'Suite Junior', 'Suite con �rea de estar y cama king', '2', 400.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000005')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000005', 'Suite Ejecutiva', 'Suite de lujo para ejecutivos con escritorio y minibar', '2', 500.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000006')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000006', 'Triple', 'Habitaci�n con tres camas individuales', '3', 280.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000007')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000007', 'Familiar', 'Habitaci�n espaciosa para familias', '4', 320.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000008')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000008', 'Doble Deluxe', 'Habitaci�n doble con mejores vistas y comodidades', '2', 300.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000009')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000009', 'Matrimonial Deluxe', 'Habitaci�n con cama king y balc�n', '2', 330.00, 'A')
    END

    IF NOT EXISTS (SELECT 1 FROM TipoHabitacion WHERE TipoHabitacionId = 'TH00000010')
    BEGIN
        INSERT INTO TipoHabitacion VALUES
        ('TH00000010', 'Suite Presidencial', 'Suite de lujo con sala, jacuzzi y vista panor�mica', '2', 1000.00, 'A')
    END
END;

EXEC InsertarTiposHabitacion;


--HA= Clase 11: Habitaci�n
DECLARE @counter11 INT = 1;
DECLARE @tiposHabitacion TABLE (TipoHabitacionId NVARCHAR(10), TipoHabitacionTipo NVARCHAR(50));

INSERT INTO @tiposHabitacion
VALUES
    ('TH00000001', 'Simple'),
    ('TH00000002', 'Doble'),
    ('TH00000003', 'Matrimonial'),
    ('TH00000004', 'Suite Junior'),
    ('TH00000005', 'Suite Ejecutiva'),
    ('TH00000006', 'Triple'),
    ('TH00000007', 'Familiar'),
    ('TH00000008', 'Doble Deluxe'),
    ('TH00000009', 'Matrimonial Deluxe'),
    ('TH00000010', 'Suite Presidencial');

WHILE @counter11 <= 8000
BEGIN
    DECLARE @TipoHabitacionId NVARCHAR(10);
    DECLARE @SucursalId NVARCHAR(10);

    -- Tipo de habitaci�n aleatorio
    SELECT TOP 1 @TipoHabitacionId = TipoHabitacionId
    FROM @tiposHabitacion
    ORDER BY NEWID();

    -- Sucursal aleatoria
    SELECT TOP 1 @SucursalId = SucursalId
    FROM Sucursal
    ORDER BY NEWID();

    INSERT INTO Habitacion (HabitacionId, HabitacionTipoHabitacionId, HabitacionSucursalId, HabitacionEstado)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter11 AS NVARCHAR(10)), 10),
        @TipoHabitacionId,
        @SucursalId,
        'Disponible'
    );

    SET @counter11 = @counter11 + 1;
END;


-- Clase 12: Servicio
insert into Servicio VALUES ('SE00000001', 'Room Service', 'Atenci�n personalizada a la habitaci�n 24/7');
insert into Servicio VALUES ('SE00000002', 'Spa', 'Masajes, faciales y relajaci�n total');
insert into Servicio VALUES ('SE00000003', 'Wi-Fi', 'Conexi�n a internet de alta velocidad');
insert into Servicio VALUES ('SE00000004', 'Lavander�a', 'Servicio de lavado y planchado de ropa');
insert into Servicio VALUES ('SE00000005', 'Gimnasio', 'Acceso a instalaciones deportivas');
insert into Servicio VALUES ('SE00000006', 'Restaurante', 'Gastronom�a local e internacional');
insert into Servicio VALUES ('SE00000007', 'Bar', 'Variedad de bebidas y c�cteles');
insert into Servicio VALUES ('SE00000008', 'Traslados', 'Transporte al aeropuerto y otros destinos');
insert into Servicio VALUES ('SE00000009', 'Tours Tur�sticos', 'Excursiones guiadas por la ciudad y alrededores');
insert into Servicio VALUES ('SE00000010', 'Desayuno Buffet', 'Desayuno incluido tipo buffet');
insert into Servicio VALUES ('SE00000011', 'Sala de Conferencias', 'Espacio para reuniones y eventos empresariales');
insert into Servicio VALUES ('SE00000012', 'Estacionamiento', 'Parqueo privado para hu�spedes');
insert into Servicio VALUES ('SE00000013', 'Pet Friendly', 'Permite el ingreso de mascotas');
insert into Servicio VALUES ('SE00000014', 'Cuna para Beb�s', 'Disponibilidad de cunas en habitaciones');
insert into Servicio VALUES ('SE00000015', 'Servicio M�dico', 'Atenci�n m�dica de emergencia');
insert into Servicio VALUES ('SE00000016', 'Piscina', 'Acceso a piscina temperada');
insert into Servicio VALUES ('SE00000017', 'Jacuzzi', 'Uso privado o compartido de jacuzzi');
insert into Servicio VALUES ('SE00000018', 'Servicio de Despertador', 'Llamada para despertar a la hora solicitada');
insert into Servicio VALUES ('SE00000019', 'Cambio de Moneda', 'Cambio de divisas en recepci�n');
insert into Servicio VALUES ('SE00000020', 'Business Center', 'Zona con computadoras e impresoras para negocios');
go
-- Clase 13: SucursalServicio
insert into SucursalServicio VALUES 
 ('SE00000001', 'SU00000001'),
 ('SE00000002', 'SU00000001'),
 ('SE00000003', 'SU00000002'),
 ('SE00000004', 'SU00000002'),
 ('SE00000005', 'SU00000003'),
 ('SE00000006', 'SU00000003'),
 ('SE00000007', 'SU00000004'),
 ('SE00000008', 'SU00000004'),
 ('SE00000009', 'SU00000005'),
 ('SE00000010', 'SU00000005'),
 ('SE00000011', 'SU00000006'),
 ('SE00000012', 'SU00000006'),
 ('SE00000013', 'SU00000007'),
 ('SE00000014', 'SU00000007'),
 ('SE00000015', 'SU00000008'),
 ('SE00000016', 'SU00000008'),
 ('SE00000017', 'SU00000009'),
 ('SE00000018', 'SU00000009'),
 ('SE00000019', 'SU00000010'),
 ('SE00000020', 'SU00000010'),
 ('SE00000001', 'SU00000011'),
 ('SE00000002', 'SU00000011'),
 ('SE00000003', 'SU00000012'),
 ('SE00000004', 'SU00000012'),
 ('SE00000005', 'SU00000013'),
 ('SE00000006', 'SU00000013'),
 ('SE00000007', 'SU00000014'),
 ('SE00000008', 'SU00000014'),
 ('SE00000009', 'SU00000015'),
 ('SE00000010', 'SU00000015'),
 ('SE00000011', 'SU00000016'),
 ('SE00000012', 'SU00000016'),
 ('SE00000013', 'SU00000017'),
 ('SE00000014', 'SU00000017'),
 ('SE00000015', 'SU00000018'),
 ('SE00000016', 'SU00000018'),
 ('SE00000017', 'SU00000019'),
 ('SE00000018', 'SU00000019'),
 ('SE00000019', 'SU00000020'),
 ('SE00000020', 'SU00000020'),
 ('SE00000001', 'SU00000021'),
 ('SE00000002', 'SU00000021'),
 ('SE00000003', 'SU00000022'),
 ('SE00000004', 'SU00000022'),
 ('SE00000005', 'SU00000023'),
 ('SE00000006', 'SU00000023'),
 ('SE00000007', 'SU00000024'),
 ('SE00000008', 'SU00000024'),
 ('SE00000009', 'SU00000025'),
 ('SE00000010', 'SU00000025'),
 ('SE00000011', 'SU00000026'),
 ('SE00000012', 'SU00000026'),
 ('SE00000013', 'SU00000027'),
 ('SE00000014', 'SU00000027'),
 ('SE00000015', 'SU00000028'),
 ('SE00000016', 'SU00000028'),
 ('SE00000017', 'SU00000029'),
 ('SE00000018', 'SU00000029'),
 ('SE00000019', 'SU00000030'),
 ('SE00000020', 'SU00000030'),
 ('SE00000001', 'SU00000031'),
 ('SE00000002', 'SU00000031'),
 ('SE00000003', 'SU00000032'),
 ('SE00000004', 'SU00000032'),
 ('SE00000005', 'SU00000033'),
 ('SE00000006', 'SU00000033');
go
-- Clase 14: Instalaciones
insert into Instalaciones VALUES ('IN00000001', 'Piscina', 'Piscina al aire libre con vista panor�mica');
insert into Instalaciones VALUES ('IN00000002', 'Gimnasio', 'Gimnasio equipado con m�quinas modernas');
insert into Instalaciones VALUES ('IN00000003', 'Sala de Reuniones', 'Espacios privados para reuniones empresariales');
insert into Instalaciones VALUES ('IN00000004', 'Centro de Negocios', '�rea con equipos de oficina para ejecutivos');
insert into Instalaciones VALUES ('IN00000005', 'Restaurante', 'Espacio gastron�mico con cocina internacional');
insert into Instalaciones VALUES ('IN00000006', 'Bar Lounge', 'Zona de descanso con bar y m�sica ambiental');
insert into Instalaciones VALUES ('IN00000007', 'Spa', 'Zona de masajes, sauna y bienestar corporal');
insert into Instalaciones VALUES ('IN00000008', 'Jacuzzi', 'Jacuzzi de uso com�n para relajaci�n');
insert into Instalaciones VALUES ('IN00000009', 'Terraza', 'Terraza panor�mica para eventos y descanso');
insert into Instalaciones VALUES ('IN00000010', 'Zona de Juegos', '�rea de entretenimiento para ni�os y adultos');
insert into Instalaciones VALUES ('IN00000011', 'Sal�n de Eventos', 'Espacio amplio para bodas y celebraciones');
insert into Instalaciones VALUES ('IN00000012', 'Jardines', 'Zonas verdes para caminatas y descanso');
insert into Instalaciones VALUES ('IN00000013', 'Recepci�n 24h', 'Atenci�n permanente al hu�sped');
insert into Instalaciones VALUES ('IN00000014', 'Estacionamiento', 'Zona de parqueo privado y seguro');
insert into Instalaciones VALUES ('IN00000015', 'Ascensores', 'Elevadores de alta velocidad en todas las plantas');
insert into Instalaciones VALUES ('IN00000016', 'Cafeter�a', 'Espacio para caf� y snacks');
insert into Instalaciones VALUES ('IN00000017', 'Sal�n de Lectura', 'Ambiente tranquilo con libros y revistas');
insert into Instalaciones VALUES ('IN00000018', 'Zona Pet Friendly', 'Espacio adaptado para hu�spedes con mascotas');
insert into Instalaciones VALUES ('IN00000019', 'Sala de Cine', 'Mini cine con funciones diarias');
insert into Instalaciones VALUES ('IN00000020', '�rea de Camping', 'Zona exterior para actividades al aire libre');
go
-- Clase 15: SucursalInstalaciones
insert into SucursalInstalaciones VALUES ('IN00000001', 'SU00000001');
insert into SucursalInstalaciones VALUES ('IN00000002', 'SU00000001');
insert into SucursalInstalaciones VALUES ('IN00000003', 'SU00000002');
insert into SucursalInstalaciones VALUES ('IN00000004', 'SU00000002');
insert into SucursalInstalaciones VALUES ('IN00000005', 'SU00000003');
insert into SucursalInstalaciones VALUES ('IN00000006', 'SU00000003');
insert into SucursalInstalaciones VALUES ('IN00000007', 'SU00000004');
insert into SucursalInstalaciones VALUES ('IN00000008', 'SU00000004');
insert into SucursalInstalaciones VALUES ('IN00000009', 'SU00000005');
insert into SucursalInstalaciones VALUES ('IN00000010', 'SU00000005');
insert into SucursalInstalaciones VALUES ('IN00000011', 'SU00000006');
insert into SucursalInstalaciones VALUES ('IN00000012', 'SU00000006');
insert into SucursalInstalaciones VALUES ('IN00000013', 'SU00000007');
insert into SucursalInstalaciones VALUES ('IN00000014', 'SU00000007');
insert into SucursalInstalaciones VALUES ('IN00000015', 'SU00000008');
insert into SucursalInstalaciones VALUES ('IN00000016', 'SU00000008');
insert into SucursalInstalaciones VALUES ('IN00000017', 'SU00000009');
insert into SucursalInstalaciones VALUES ('IN00000018', 'SU00000009');
insert into SucursalInstalaciones VALUES ('IN00000019', 'SU00000010');
insert into SucursalInstalaciones VALUES ('IN00000020', 'SU00000010');
insert into SucursalInstalaciones VALUES ('IN00000001', 'SU00000011');
insert into SucursalInstalaciones VALUES ('IN00000002', 'SU00000011');
insert into SucursalInstalaciones VALUES ('IN00000003', 'SU00000012');
insert into SucursalInstalaciones VALUES ('IN00000004', 'SU00000012');
insert into SucursalInstalaciones VALUES ('IN00000005', 'SU00000013');
insert into SucursalInstalaciones VALUES ('IN00000006', 'SU00000013');
insert into SucursalInstalaciones VALUES ('IN00000007', 'SU00000014');
insert into SucursalInstalaciones VALUES ('IN00000008', 'SU00000014');
insert into SucursalInstalaciones VALUES ('IN00000009', 'SU00000015');
insert into SucursalInstalaciones VALUES ('IN00000010', 'SU00000015');
insert into SucursalInstalaciones VALUES ('IN00000011', 'SU00000016');
insert into SucursalInstalaciones VALUES ('IN00000012', 'SU00000016');
insert into SucursalInstalaciones VALUES ('IN00000013', 'SU00000017');
insert into SucursalInstalaciones VALUES ('IN00000014', 'SU00000017');
insert into SucursalInstalaciones VALUES ('IN00000015', 'SU00000018');
insert into SucursalInstalaciones VALUES ('IN00000016', 'SU00000018');
insert into SucursalInstalaciones VALUES ('IN00000017', 'SU00000019');
insert into SucursalInstalaciones VALUES ('IN00000018', 'SU00000019');
insert into SucursalInstalaciones VALUES ('IN00000019', 'SU00000020');
insert into SucursalInstalaciones VALUES ('IN00000020', 'SU00000020');
insert into SucursalInstalaciones VALUES ('IN00000001', 'SU00000021');
insert into SucursalInstalaciones VALUES ('IN00000002', 'SU00000021');
insert into SucursalInstalaciones VALUES ('IN00000003', 'SU00000022');
insert into SucursalInstalaciones VALUES ('IN00000004', 'SU00000022');
insert into SucursalInstalaciones VALUES ('IN00000005', 'SU00000023');
insert into SucursalInstalaciones VALUES ('IN00000006', 'SU00000023');
insert into SucursalInstalaciones VALUES ('IN00000007', 'SU00000024');
insert into SucursalInstalaciones VALUES ('IN00000008', 'SU00000024');
insert into SucursalInstalaciones VALUES ('IN00000009', 'SU00000025');
insert into SucursalInstalaciones VALUES ('IN00000010', 'SU00000025');
insert into SucursalInstalaciones VALUES ('IN00000011', 'SU00000026');
insert into SucursalInstalaciones VALUES ('IN00000012', 'SU00000026');
insert into SucursalInstalaciones VALUES ('IN00000013', 'SU00000027');
insert into SucursalInstalaciones VALUES ('IN00000014', 'SU00000027');
insert into SucursalInstalaciones VALUES ('IN00000015', 'SU00000028');
insert into SucursalInstalaciones VALUES ('IN00000016', 'SU00000028');
insert into SucursalInstalaciones VALUES ('IN00000017', 'SU00000029');
insert into SucursalInstalaciones VALUES ('IN00000018', 'SU00000029');
insert into SucursalInstalaciones VALUES ('IN00000019', 'SU00000030');
insert into SucursalInstalaciones VALUES ('IN00000020', 'SU00000030');
insert into SucursalInstalaciones VALUES ('IN00000001', 'SU00000031');
insert into SucursalInstalaciones VALUES ('IN00000002', 'SU00000031');
insert into SucursalInstalaciones VALUES ('IN00000003', 'SU00000032');
insert into SucursalInstalaciones VALUES ('IN00000004', 'SU00000032');
insert into SucursalInstalaciones VALUES ('IN00000005', 'SU00000033');
insert into SucursalInstalaciones VALUES ('IN00000006', 'SU00000033');
go

--RE= Clase 16: Reserva
DECLARE @counter16 INT = 1;

WHILE @counter16 <= 8000
BEGIN
    DECLARE @SucursalId NVARCHAR(10);

    SELECT TOP 1 @SucursalId = SucursalId
    FROM Sucursal
    ORDER BY NEWID();

    INSERT INTO Reserva 
    (
        ReservaId, ReservaHuespedId, ReservaHabitacionId, Reservafecha_entrada, Reservafecha_salida, ReservaEstado, ReservaSucursalId
    )
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter16 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter16 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST((@counter16 % 100) + 1 AS NVARCHAR(10)), 10),
        DATEADD(DAY, @counter16, GETDATE()),
        DATEADD(DAY, @counter16 + 2, GETDATE()),
        'Confirmada',
        @SucursalId
    );

    SET @counter16 = @counter16 + 1;
END;


--CB= Clase 17: Comprobante
DECLARE @counter17 INT = 1;
WHILE @counter17 <= 8000
BEGIN
    INSERT INTO Comprobante (ComprobanteId, ComprobanteReservaId, ComprobanteFecha, ComprobanteMonto, ComprobanteDetalle)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter17 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter17 AS NVARCHAR(10)), 10),
        GETDATE(),
        ROUND(RAND() * 500, 2),
        'Detalle de comprobante ' + CAST(@counter17 AS NVARCHAR(10))
    );
    SET @counter17 = @counter17 + 1;
END;

--Clase 18: Tipos de Pago
insert into TipoPago VALUES ('TP00000001', 'Contado');
insert into TipoPago VALUES ('TP00000002', 'Cr�dito');
insert into TipoPago VALUES ('TP00000003', 'Tarjeta de D�bito');
insert into TipoPago VALUES ('TP00000004', 'Tarjeta de Cr�dito');
insert into TipoPago VALUES ('TP00000005', 'Transferencia Bancaria');
insert into TipoPago VALUES ('TP00000006', 'Pago M�vil');
go
--Clase 19: Formas de Pago
insert into FormaPago VALUES ('FP00000001', 'Efectivo');
insert into FormaPago VALUES ('FP00000002', 'Tarjeta');
insert into FormaPago VALUES ('FP00000003', 'Yape');
insert into FormaPago VALUES ('FP00000004', 'Plin');
insert into FormaPago VALUES ('FP00000005', 'Transferencia Bancaria');
insert into FormaPago VALUES ('FP00000006', 'POS M�vil');
go

--PA= Clase 20: Pago
DECLARE @counter20 INT = 1;

DECLARE @tiposPago TABLE (TipoPagoId NVARCHAR(12));
INSERT INTO @tiposPago VALUES 
('TP00000001'), ('TP00000002'), ('TP00000003'),
('TP00000004'), ('TP00000005'), ('TP00000006');

-- Para PagoFormaPagoId necesitas definir valores reales o provisionales

DECLARE @formasPago TABLE (FormaPagoId NVARCHAR(12));
INSERT INTO @formasPago VALUES ('FP00000001'), ('FP00000002'); -- Ejemplo, cambia seg�n tus datos reales

WHILE @counter20 <= 8000
BEGIN
    DECLARE @TipoPagoId NVARCHAR(12);
    DECLARE @FormaPagoId NVARCHAR(12);

    SELECT TOP 1 @TipoPagoId = TipoPagoId FROM @tiposPago ORDER BY NEWID();
    SELECT TOP 1 @FormaPagoId = FormaPagoId FROM @formasPago ORDER BY NEWID();

    INSERT INTO Pago (PagoId, PagoComprobanteId, PagoMonto, PagoFecha, PagoTipoPagoId, PagoFormaPagoId)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter20 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter20 AS NVARCHAR(10)), 10),
        ROUND(ABS(CHECKSUM(NEWID())) % 501 + 0.00, 2),
        GETDATE(),
        @TipoPagoId,
        @FormaPagoId
    );

    SET @counter20 = @counter20 + 1;
END;


--EN= Clase 21: Encuesta
DECLARE @counter21 INT = 1;
WHILE @counter21 <= 8000
BEGIN
    INSERT INTO Encuesta (EncuestaId, EncuestaHuespedId, EncuestaSucursalId, Encuestapuntuacion)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter21 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter21 AS NVARCHAR(10)), 10),
        'SU00000001',  -- Asignando una sucursal fija
        ROUND(ABS(CHECKSUM(NEWID())) % 5, 1)  -- Puntaje entero entre 0 y 5
    );
    SET @counter21 = @counter21 + 1;
END;

--IG= Clase 22: Ingreso
DECLARE @counter22 INT = 1;

DECLARE @sucursales TABLE (SucursalId NVARCHAR(12));
INSERT INTO @sucursales VALUES 
('SU00000001'), ('SU00000002'), ('SU00000003'), ('SU00000004'); -- Completa con tus sucursales

WHILE @counter22 <= 8000
BEGIN
    DECLARE @SucursalId NVARCHAR(12);
    SELECT TOP 1 @SucursalId = SucursalId FROM @sucursales ORDER BY NEWID();

    INSERT INTO Ingreso (IngresoId, IngresoFecha, IngresoMonto, IngresoSucursalId)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter22 AS NVARCHAR(10)), 10),
        GETDATE(),
        ROUND(ABS(CHECKSUM(NEWID())) % 1001 + 0.00, 2),  -- monto aleatorio entre 0 y 1000
        @SucursalId
    );

    SET @counter22 = @counter22 + 1;
END;


--GA= Clase 23: Gasto
DECLARE @counter23 INT = 1;

DECLARE @sucursales TABLE (SucursalId NVARCHAR(12));
INSERT INTO @sucursales VALUES 
('SU00000001'), ('SU00000002'), ('SU00000003'), ('SU00000004');

-- Puedes usar una tabla temporal para motivos de gastos
DECLARE @motivos TABLE (Motivo NVARCHAR(100));
INSERT INTO @motivos VALUES 
('Compra de insumos'),
('Mantenimiento'),
('Servicios generales'),
('Pago de personal'),
('Otros gastos');

WHILE @counter23 <= 8000
BEGIN
    DECLARE @SucursalId NVARCHAR(12);
    SELECT TOP 1 @SucursalId = SucursalId FROM @sucursales ORDER BY NEWID();

    DECLARE @Motivo NVARCHAR(100);
    SELECT TOP 1 @Motivo = Motivo FROM @motivos ORDER BY NEWID();

    INSERT INTO Gasto (GastoId, GastoFecha, GastoMonto, GastoSucursalId, GastoMotivo)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter23 AS NVARCHAR(10)), 10),
        GETDATE(),
        ROUND(ABS(CHECKSUM(NEWID())) % 1001 + 0.00, 2),
        @SucursalId,
        @Motivo
    );

    SET @counter23 = @counter23 + 1;
END;


--RR= Clase 24: Rese�aRedSocial
DECLARE @counter24 INT = 1;

DECLARE @plataformas TABLE (plataforma NVARCHAR(50));
INSERT INTO @plataformas VALUES ('Web'), ('App m�vil'), ('Email'), ('Redes sociales');

WHILE @counter24 <= 8000
BEGIN
    DECLARE @plataforma NVARCHAR(50);
    SELECT TOP 1 @plataforma = plataforma FROM @plataformas ORDER BY NEWID();

    INSERT INTO Resena (ResenaId, ResenaHuespedId, ResenaComentario, Resenafecha, Resenaenlace, Resenaplataforma, Resenapuntuacion)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter24 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter24 AS NVARCHAR(10)), 10),
        'Comentario de rese�a ' + CAST(@counter24 AS NVARCHAR(10)),
        GETDATE(),
        'http://ejemplo.com/rese�a/' + CAST(@counter24 AS NVARCHAR(10)),
        @plataforma,
        CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 5) AS INT)  -- valor entre 0 y 5
    );

    SET @counter24 = @counter24 + 1;
END;




/*--CH= Clase 25: Check-in y Check-out
DECLARE @counter25 INT = 1;

WHILE @counter25 <= 8000
BEGIN
    -- Generar hora de entrada aleatoria entre 12:00 y 18:00
    DECLARE @horaEntrada time = DATEADD(MINUTE, (RAND() * (6 * 60)), '12:00'); -- 6 horas = 6 * 60 minutos

    -- Generar hora de salida aleatoria entre 08:00 y 12:00
    DECLARE @horaSalida time = DATEADD(MINUTE, (RAND() * (4 * 60)), '08:00'); -- 4 horas = 4 * 60 minutos

    -- Insertar los datos en la tabla CheckInCheckOut
    INSERT INTO CheckInCheckOut (CheckInCheckOutId, CheckInCheckOutReservaId, CheckInCheckOutEntrada, CheckInCheckOutHoraE, CheckInCheckOutSalida, CheckInCheckOutHoraS, CheckInCheckOutEstado)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter25 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter25 AS NVARCHAR(10)), 10),  -- ReservaId
        DATEADD(DAY, @counter25, GETDATE()),  -- Fecha de entrada
        @horaEntrada,  -- Hora de entrada aleatoria
        DATEADD(DAY, @counter25 + 2, GETDATE()),  -- Fecha de salida
        @horaSalida,  -- Hora de salida aleatoria
        CASE 
            WHEN @counter25 % 2 = 0 THEN 'Completado' 
            WHEN @counter25 % 3 = 0 THEN 'Cancelado'
            ELSE 'Pendiente' 
        END  -- Estado aleatorio
    );

    SET @counter25 = @counter25 + 1;
END;*/


--CH= Clase 25: Check-in y Check-out
DECLARE @counter25 INT = 1;

WHILE @counter25 <= 8000
BEGIN
    -- Generar fecha de entrada aleatoria dentro de 2025
    DECLARE @fechaEntrada DATE = DATEADD(DAY, FLOOR(RAND() * 365), '2025-01-01');

    -- Generar fecha de salida aleatoria 1 a 4 d�as despu�s
    DECLARE @fechaSalida DATE = DATEADD(DAY, FLOOR(RAND() * 4) + 1, @fechaEntrada);

    -- Generar hora de entrada aleatoria entre 12:00 y 18:00
    DECLARE @horaEntrada TIME = DATEADD(MINUTE, (RAND() * (6 * 60)), '12:00');

    -- Generar hora de salida aleatoria entre 08:00 y 12:00
    DECLARE @horaSalida TIME = DATEADD(MINUTE, (RAND() * (4 * 60)), '08:00');

    -- Insertar en la tabla CheckInCheckOut
    INSERT INTO CheckInCheckOut (
        CheckInCheckOutId,
        CheckInCheckOutReservaId,
        CheckInCheckOutEntrada,
        CheckInCheckOutHoraE,
        CheckInCheckOutSalida,
        CheckInCheckOutHoraS,
        CheckInCheckOutEstado
    )
    VALUES (
        RIGHT('0000000000' + CAST(@counter25 AS NVARCHAR(10)), 10),
        RIGHT('0000000000' + CAST(@counter25 AS NVARCHAR(10)), 10),
        @fechaEntrada,
        @horaEntrada,
        @fechaSalida,
        @horaSalida,
        CASE 
            WHEN @counter25 % 2 = 0 THEN 'Completado' 
            WHEN @counter25 % 3 = 0 THEN 'Cancelado'
            ELSE 'Pendiente' 
        END
    );

    SET @counter25 = @counter25 + 1;
END;


--PO= Clase 26: Producto (Alimentos y Bebidas)
DECLARE @counter26 INT = 1;

DECLARE @tiposProducto TABLE (ProductoTipo NVARCHAR(50));
INSERT INTO @tiposProducto VALUES ('Alimentos'), ('Bebidas'), ('Limpieza'), ('Otros');

WHILE @counter26 <= 8000
BEGIN
    DECLARE @tipo NVARCHAR(50);
    SELECT TOP 1 @tipo = ProductoTipo FROM @tiposProducto ORDER BY NEWID();

    INSERT INTO Producto (ProductoId, ProductoNombre, ProductoDescripcion, ProductoPrecio, ProductoTipo)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter26 AS NVARCHAR(10)), 10),
        'Producto ' + CAST(@counter26 AS NVARCHAR(10)),
        'Descripci�n del producto ' + CAST(@counter26 AS NVARCHAR(10)),
        ROUND(RAND(CHECKSUM(NEWID())) * 50, 2),
        @tipo
    );
    SET @counter26 = @counter26 + 1;
END;


--VE= Clase 27: Venta de Productos (Alimentos y Bebidas)
DECLARE @counter27 INT = 1;

WHILE @counter27 <= 8000
BEGIN
    -- Seleccionar una sucursal, hu�sped y producto aleatorios para la venta
    DECLARE @sucursalId nchar(10) = 'SU' + RIGHT('00000000' + CAST(((@counter27 % 33) + 1) AS NVARCHAR(10)), 8);
    DECLARE @huespedId nchar(10) = RIGHT('0000000000' + CAST(((@counter27 % 100) + 1) AS NVARCHAR(10)), 10);  -- 100 hu�spedes
    DECLARE @productoId nchar(10) = RIGHT('0000000000' + CAST(((@counter27 % 10) + 1) AS NVARCHAR(10)), 10);  -- 10 productos

    -- Generar la cantidad y el precio de la venta
    DECLARE @cantidad INT = (RAND() * 5) + 1;  -- Cantidad aleatoria entre 1 y 5
    DECLARE @precio DECIMAL(10, 2) = ROUND(RAND() * 50 + 10, 2);  -- Precio aleatorio entre 10 y 60

    -- Generar la fecha de la venta (hace entre 0 y 30 d�as desde hoy)
    DECLARE @fecha DATE = DATEADD(DAY, - (RAND() * 30), GETDATE());

    -- Insertar el registro en la tabla VentaProducto
    INSERT INTO VentaProducto (VentaProductoId, VentaProductoSucursalId, VentaProductoHuespedId, VentaProductoProductoId, VentaProductoCantidad, VentaProductoPrecio, VentaProductoFecha)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter27 AS NVARCHAR(10)), 10),
        @sucursalId,  -- Sucursal aleatoria
        @huespedId,  -- Hu�sped aleatorio
        @productoId,  -- Producto aleatorio
        @cantidad,  -- Cantidad aleatoria
        @precio,  -- Precio aleatorio
        @fecha  -- Fecha aleatoria
    );

    SET @counter27 = @counter27 + 1;
END;

--PV= Clase 28: Pago por Venta de Producto
DECLARE @counter28 INT = 1;

WHILE @counter28 <= 8000
BEGIN
    -- VentaProductoId aleatorio
    DECLARE @ventaProductoId nchar(10) = RIGHT('0000000000' + CAST(((@counter28 % 100) + 1) AS NVARCHAR(10)), 10);

    -- PagoId aleatorio
    DECLARE @pagoId nchar(10) = RIGHT('0000000000' + CAST(((@counter28 % 50) + 1) AS NVARCHAR(10)), 10);

    -- FormaPagoId con el formato FP + 8 d�gitos
    DECLARE @formaPagoId nchar(10) = 'FP' + RIGHT('00000000' + CAST(((@counter28 % 5) + 1) AS NVARCHAR(8)), 8);

    -- Monto aleatorio entre 0 y 50
    DECLARE @monto DECIMAL(10, 2) = ROUND(RAND() * 50, 2);

    -- Fecha aleatoria dentro de �ltimos 30 d�as
    DECLARE @fecha DATE = DATEADD(DAY, - CAST(RAND() * 30 AS INT), GETDATE());

    -- Insertar en PagoVentaProducto
    INSERT INTO PagoVentaProducto (PagoVentaProductoId, PagoVentaProductoVentaProductoId, PagoVentaProductoPagoId, PagoVentaProductoFecha, PagoVentaProductoMonto, PagoVentaProductoFormaPagoId)
    VALUES 
    (
        RIGHT('0000000000' + CAST(@counter28 AS NVARCHAR(10)), 10),
        @ventaProductoId,
        @pagoId,
        @fecha,
        @monto,
        @formaPagoId
    );

    SET @counter28 = @counter28 + 1;
END;


-- Clase 29: Cancelaci�n de Reserva
INSERT INTO CancelacionReserva VALUES
('CR00000001', '0000000001', '2025-04-01', 'Cambio de planes de viaje', 100.00, 'completada'),
('CR00000002', '0000000002', '2025-04-02', 'Problemas personales', 120.00, 'completada'),
('CR00000003', '0000000003', '2025-04-03', 'Emergencia m�dica', 150.00, 'pendiente'),
('CR00000004', '0000000004', '2025-04-04', 'Problemas financieros', 80.00, 'completada'),
('CR00000005', '0000000005', '2025-04-05', 'Cambio en el itinerario de vuelo', 0.00, 'pendiente'),
('CR00000006', '0000000006', '2025-04-06', 'Conflictos con fechas de trabajo', 90.00, 'completada'),
('CR00000007', '0000000007', '2025-04-07', 'Reserva duplicada', 100.00, 'completada'),
('CR00000008', '0000000008', '2025-04-08', 'No se permite mascotas', 60.00, 'completada'),
('CR00000009', '0000000009', '2025-04-09', 'Cambio a otro hotel', 0.00, 'pendiente'),
('CR00000010', '0000000010', '2025-04-10', 'Error al reservar fechas', 100.00, 'completada'),
('CR00000011', '0000000011', '2025-04-11', 'Inconveniente familiar', 110.00, 'completada'),
('CR00000012', '0000000012', '2025-04-12', 'No se ajustaba al presupuesto', 50.00, 'pendiente'),
('CR00000013', '0000000013', '2025-04-13', 'Cambio por recomendaci�n', 90.00, 'completada'),
('CR00000014', '0000000014', '2025-04-14', 'No se concret� el viaje', 100.00, 'completada'),
('CR00000015', '0000000015', '2025-04-15', 'Razones clim�ticas', 0.00, 'pendiente');
GO

-- Clase 30: Personal
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000001', 'SU00000027', '2025-04-30', NULL, 'Marco Torres', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000002', 'SU00000002', '2025-05-08', NULL, 'Ana Fern�ndez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000003', 'SU00000020', '2025-05-17', NULL, 'Carlos Gonz�lez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000004', 'SU00000013', '2025-02-21', NULL, 'Pedro Mart�nez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000005', 'SU00000004', '2025-02-26', NULL, 'Carlos Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000006', 'SU00000030', '2025-04-11', NULL, 'Pedro P�rez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000007', 'SU00000010', '2025-02-15', '2025-05-21', 'Juan P�rez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000008', 'SU00000003', '2025-01-06', NULL, 'Luc�a Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000009', 'SU00000014', '2025-05-08', NULL, 'Juan Ch�vez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000010', 'SU00000015', '2025-05-13', NULL, 'Pedro Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000011', 'SU00000004', '2025-04-20', NULL, 'Marco Mart�nez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000012', 'SU00000003', '2025-05-17', NULL, 'Carlos G�mez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000013', 'SU00000003', '2025-02-06', NULL, 'Luis G�mez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000014', 'SU00000008', '2025-05-29', NULL, 'Valeria Gonz�lez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000015', 'SU00000005', '2025-01-17', '2025-03-22', 'Pedro Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000016', 'SU00000001', '2025-05-08', NULL, 'Ana P�rez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000017', 'SU00000022', '2025-01-25', NULL, 'Ana Ch�vez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000018', 'SU00000007', '2025-05-03', NULL, 'Luc�a Torres', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000019', 'SU00000010', '2025-02-01', NULL, 'Luc�a G�mez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000020', 'SU00000011', '2025-03-21', NULL, 'Ana Mart�nez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000021', 'SU00000006', '2025-01-18', NULL, 'Valeria Mart�nez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000022', 'SU00000013', '2025-01-13', '2025-06-05', 'Luc�a Torres', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000023', 'SU00000002', '2025-07-15', NULL, 'Diana Fern�ndez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000024', 'SU00000030', '2025-03-16', NULL, 'Luc�a Gonz�lez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000025', 'SU00000018', '2025-05-06', NULL, 'Pedro Ch�vez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000026', 'SU00000010', '2025-06-14', NULL, 'Luis Rodr�guez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000027', 'SU00000021', '2025-01-02', NULL, 'Marco Gonz�lez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000028', 'SU00000024', '2025-05-21', NULL, 'Carlos G�mez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000029', 'SU00000033', '2025-07-11', NULL, 'Carlos Torres', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000030', 'SU00000018', '2025-02-18', NULL, 'Juan Rodr�guez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000031', 'SU00000030', '2025-06-22', NULL, 'Marco Ch�vez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000032', 'SU00000009', '2025-02-06', NULL, 'Carlos Fern�ndez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000033', 'SU00000019', '2025-03-05', NULL, 'Ana Torres', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000034', 'SU00000031', '2025-04-28', NULL, 'Marco Torres', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000035', 'SU00000008', '2025-03-13', '2025-07-08', 'Luc�a Mart�nez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000036', 'SU00000033', '2025-05-04', NULL, 'Pedro Rodr�guez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000037', 'SU00000010', '2025-03-16', '2025-04-15', 'Ana P�rez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000038', 'SU00000013', '2025-05-14', NULL, 'Diana Rodr�guez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000039', 'SU00000001', '2025-05-26', NULL, 'Luis Torres', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000040', 'SU00000021', '2025-02-05', NULL, 'Juan Mart�nez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000041', 'SU00000003', '2025-06-17', NULL, 'Carlos G�mez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000042', 'SU00000013', '2025-02-28', NULL, 'Valeria Ch�vez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000043', 'SU00000010', '2025-03-06', NULL, 'Marco Fern�ndez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000044', 'SU00000024', '2025-01-02', NULL, 'Diana Torres', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000045', 'SU00000009', '2025-05-11', NULL, 'Marco Torres', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000046', 'SU00000033', '2025-04-24', NULL, 'Diana Gonz�lez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000047', 'SU00000025', '2025-02-25', NULL, 'Valeria G�mez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000048', 'SU00000010', '2025-06-10', NULL, 'Diana Mart�nez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000049', 'SU00000024', '2025-05-30', NULL, 'Marco Ch�vez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000050', 'SU00000015', '2025-02-17', '2025-06-03', 'Juan P�rez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000051', 'SU00000024', '2025-04-03', NULL, 'Carlos Rodr�guez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000052', 'SU00000023', '2025-01-26', NULL, 'Valeria Fern�ndez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000053', 'SU00000007', '2025-03-01', NULL, 'Diana Rodr�guez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000054', 'SU00000002', '2025-04-15', NULL, 'Juan Torres', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000055', 'SU00000013', '2025-01-07', NULL, 'Valeria G�mez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000056', 'SU00000015', '2025-05-20', NULL, 'Valeria Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000057', 'SU00000025', '2025-05-13', NULL, 'Mar�a G�mez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000058', 'SU00000033', '2025-05-11', NULL, 'Valeria Mart�nez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000059', 'SU00000012', '2025-01-19', NULL, 'Diana Gonz�lez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000060', 'SU00000003', '2025-01-28', NULL, 'Ana Gonz�lez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000061', 'SU00000005', '2025-05-05', NULL, 'Diana Rodr�guez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000062', 'SU00000016', '2025-04-25', NULL, 'Mar�a Ch�vez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000063', 'SU00000011', '2025-01-28', '2025-04-03', 'Juan P�rez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000064', 'SU00000006', '2025-04-06', NULL, 'Pedro Gonz�lez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000065', 'SU00000006', '2025-04-30', '2025-07-06', 'Juan Fern�ndez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000066', 'SU00000033', '2025-06-28', NULL, 'Diana Fern�ndez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000067', 'SU00000026', '2025-02-25', '2025-04-26', 'Ana Torres', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000068', 'SU00000015', '2025-04-15', NULL, 'Ana Fern�ndez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000069', 'SU00000007', '2025-01-03', '2025-03-03', 'Luis Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000070', 'SU00000020', '2025-06-18', NULL, 'Juan Fern�ndez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000071', 'SU00000007', '2025-02-29', NULL, 'Valeria Fern�ndez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000072', 'SU00000026', '2025-06-10', NULL, 'Juan G�mez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000073', 'SU00000023', '2025-04-14', '2025-05-09', 'Diana Torres', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000074', 'SU00000004', '2025-06-16', NULL, 'Ana Gonz�lez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000075', 'SU00000018', '2025-02-23', NULL, 'Luc�a Fern�ndez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000076', 'SU00000033', '2025-04-16', NULL, 'Luis Mart�nez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000077', 'SU00000023', '2025-01-10', NULL, 'Diana Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000078', 'SU00000020', '2025-04-30', '2025-02-07', 'Pedro G�mez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000079', 'SU00000023', '2025-01-23', NULL, 'Juan Gonz�lez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000080', 'SU00000008', '2025-05-26', NULL, 'Marco Rodr�guez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000081', 'SU00000016', '2025-06-10', NULL, 'Luis Fern�ndez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000082', 'SU00000006', '2025-06-27', NULL, 'Valeria Fern�ndez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000083', 'SU00000028', '2025-04-03', NULL, 'Pedro P�rez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000084', 'SU00000022', '2025-01-07', '2025-06-07', 'Luc�a P�rez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000085', 'SU00000011', '2025-03-13', NULL, 'Ana Gonz�lez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000086', 'SU00000022', '2025-03-12', NULL, 'Luc�a Fern�ndez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000087', 'SU00000009', '2025-04-17', NULL, 'Ana Ch�vez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000088', 'SU00000006', '2025-06-02', NULL, 'Juan Rodr�guez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000089', 'SU00000013', '2025-02-20', NULL, 'Ana Torres', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000090', 'SU00000022', '2025-01-04', '2025-04-30', 'Diana Torres', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000091', 'SU00000023', '2025-01-24', '2025-06-30', 'Pedro Rodr�guez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000092', 'SU00000009', '2025-01-20', NULL, 'Marco Mart�nez', 'Limpieza');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000093', 'SU00000025', '2025-04-09', NULL, 'Ana G�mez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000094', 'SU00000024', '2025-01-30', NULL, 'Diana Fern�ndez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000095', 'SU00000022', '2025-04-10', NULL, 'Ana P�rez', 'Administrativo');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000096', 'SU00000011', '2025-04-14', NULL, 'Diana Mart�nez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000097', 'SU00000030', '2025-05-08', NULL, 'Juan P�rez', 'Cocinero');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000098', 'SU00000032', '2025-02-25', NULL, 'Luis P�rez', 'Recepcionista');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000099', 'SU00000003', '2025-01-30', NULL, 'Carlos Fern�ndez', 'Seguridad');
INSERT INTO Personal (EmpleadoId, SucursalId, FechaIngreso, FechaSalida, Nombre, Puesto) VALUES ('PE00000100', 'SU00000020', '2025-07-02', NULL, 'Valeria G�mez', 'Limpieza');
go


