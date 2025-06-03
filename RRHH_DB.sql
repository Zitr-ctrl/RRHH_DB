create database RRHH_DB;

use RRHH_DB;

-- Países
CREATE TABLE P_Pais (
    Pais_ID INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Provincias
CREATE TABLE P_Provincia (
    Provincia_ID INT PRIMARY KEY,
    nombre VARCHAR(100),
    Pais_ID INT,
    FOREIGN KEY (Pais_ID) REFERENCES P_Pais(Pais_ID)
);

-- Ciudades
CREATE TABLE P_Ciudad (
    Ciudad_ID INT PRIMARY KEY,
    nombre VARCHAR(100),
    Provincia_ID INT,
    FOREIGN KEY (Provincia_ID) REFERENCES P_Provincia(Provincia_ID)
);

-- Formación
CREATE TABLE P_Formacion (
    Formacion_ID INT PRIMARY KEY,
    nivel_estudio VARCHAR(100),
    descripcion TEXT
);

-- Departamentos
CREATE TABLE P_Departamento (
    Departamento_ID INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- Estado de contrato
CREATE TABLE P_Estado_Contrato (
    Estado_Contrato_ID INT PRIMARY KEY,
    descripcion TEXT
);

-- Tipos de contrato
CREATE TABLE P_Tipo_Contrato (
    Tipo_Contrato_ID INT PRIMARY KEY,
    descripcion TEXT
);

-- Cargos
CREATE TABLE P_Cargo (
    Cargo_ID INT PRIMARY KEY,
    Departamento_ID INT,
    Nombre VARCHAR(100),
    Nivel INT,
    FOREIGN KEY (Departamento_ID) REFERENCES P_Departamento(Departamento_ID)
);

-- Salarios
CREATE TABLE P_Salario (
    Salario_ID INT PRIMARY KEY,
    monto DECIMAL(10,2),
    fecha DATE,
    estado BOOLEAN,
    Cargo_ID INT,
    FOREIGN KEY (Cargo_ID) REFERENCES P_Cargo(Cargo_ID)
);

-- Horarios
CREATE TABLE P_Horario (
    Horario_ID INT PRIMARY KEY,
    hora_entrada TIME,
    hora_salida TIME,
    dias VARCHAR(100)
);

-- Empleados
CREATE TABLE M_Empleado (
    Empleado_ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Cedula VARCHAR(20),
    Genero VARCHAR(10),
    Fecha_nac DATE,
    Celular VARCHAR(20),
    Direccion TEXT,
    Email VARCHAR(100),
    Estado BOOLEAN,
    Ciudad_ID INT,
    Formacion_ID INT,
    FOREIGN KEY (Ciudad_ID) REFERENCES P_Ciudad(Ciudad_ID),
    FOREIGN KEY (Formacion_ID) REFERENCES P_Formacion(Formacion_ID)
);

-- Contratos
CREATE TABLE M_Contrato (
    Contrato_ID INT PRIMARY KEY,
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Horario_ID INT,
    Empleado_ID INT,
    Estado_Contrato_ID INT,
    Cargo_ID INT,
    Tipo_Contrato_ID INT,
    FOREIGN KEY (Horario_ID) REFERENCES P_Horario(Horario_ID),
    FOREIGN KEY (Empleado_ID) REFERENCES M_Empleado(Empleado_ID),
    FOREIGN KEY (Estado_Contrato_ID) REFERENCES P_Estado_Contrato(Estado_Contrato_ID),
    FOREIGN KEY (Cargo_ID) REFERENCES P_Cargo(Cargo_ID),
    FOREIGN KEY (Tipo_Contrato_ID) REFERENCES P_Tipo_Contrato(Tipo_Contrato_ID)
);

-- Estado del rol de pago
CREATE TABLE P_Estado_Rol (
    EstadoRol_ID INT PRIMARY KEY,
    descripcion TEXT
);

-- Cabecera rol de pago
CREATE TABLE T_Rol_Pago (
    RolPago_ID INT PRIMARY KEY,
    Contrato_ID INT,
    EstadoRol_ID INT,
    Periodo_Inicio DATE,
    Periodo_Fin DATE,
    Fecha_Emision DATE,
    sueldo_horas DECIMAL(10,2),
    horas_totales INT,
    sueldo_neto DECIMAL(10,2),
    FOREIGN KEY (Contrato_ID) REFERENCES M_Contrato(Contrato_ID),
    FOREIGN KEY (EstadoRol_ID) REFERENCES P_Estado_Rol(EstadoRol_ID)
);

-- Tipo de rubro
CREATE TABLE P_Tipo_Rubro (
    TipoRubro_ID INT PRIMARY KEY,
    descripcion TEXT
);

-- Rubros
CREATE TABLE P_Rubro (
    Rubro_ID INT PRIMARY KEY,
    descripcion TEXT,
    TipoRubro_ID INT,
    FOREIGN KEY (TipoRubro_ID) REFERENCES P_Tipo_Rubro(TipoRubro_ID)
);

-- Detalle rol de pago
CREATE TABLE T_Rol_Pago_Detalle (
    RolPagoDetalle_ID INT PRIMARY KEY,
    RolPago_ID INT,
    Rubro_ID INT,
    monto DECIMAL(10,2),
    cantidad INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (RolPago_ID) REFERENCES T_Rol_Pago(RolPago_ID),
    FOREIGN KEY (Rubro_ID) REFERENCES P_Rubro(Rubro_ID)
);

-- Registro de asistencia
CREATE TABLE T_Asistencia_Registro (
    Asistencia_Registro_ID INT PRIMARY KEY,
    Horario_ID INT,
    Empleado_ID INT,
    RolPago_ID INT,
    Fecha_informe DATE,
    estado BOOLEAN,
    horas_totales INT,
    FOREIGN KEY (Horario_ID) REFERENCES P_Horario(Horario_ID),
    FOREIGN KEY (Empleado_ID) REFERENCES M_Empleado(Empleado_ID),
    FOREIGN KEY (RolPago_ID) REFERENCES T_Rol_Pago(RolPago_ID)
);

-- Detalle de asistencia
CREATE TABLE T_Asistencia_Registro_Detalle (
    Asistencia_Registro_Detalle_ID INT PRIMARY KEY,
    Asistencia_Registro_ID INT,
    Hora_entrada_real TIME,
    Hora_salida_real TIME,
    horas DECIMAL(5,2),
    FOREIGN KEY (Asistencia_Registro_ID) REFERENCES T_Asistencia_Registro(Asistencia_Registro_ID)
);
