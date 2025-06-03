# 📊 Base de Datos de Recursos Humanos (RRHH)

Este proyecto define la estructura de una base de datos relacional para gestionar eficientemente los procesos del área de Recursos Humanos, incluyendo empleados, contratos, asistencia, roles de pago y más.

## 🏗️ Estructura General

La base de datos está organizada en las siguientes categorías de tablas:

### 1. Tablas Paramétricas (`P_`)
Contienen valores fijos y reutilizables en otras tablas:
- `P_Pais`
- `P_Provincia`
- `P_Ciudad`
- `P_Formacion`
- `P_Departamento`
- `P_Cargo`
- `P_Salario`
- `P_Horario`
- `P_Tipo_Contrato`
- `P_Estado_Contrato`
- `P_Estado_Rol`
- `P_Tipo_Rubro`
- `P_Rubro`

### 2. Tablas Maestras (`M_`)
Contienen información principal del sistema:
- `M_Empleado`
- `M_Contrato`

### 3. Tablas Transaccionales (`T_`)
Registran actividades diarias o mensuales:
- `T_Rol_Pago`
- `T_Rol_Pago_Detalle`
- `T_Asistencia_Registro`
- `T_Asistencia_Registro_Detalle`

## 🔑 Principales Relaciones

- Los **empleados** están relacionados con **ciudades** y **formación académica**.
- Cada **empleado** puede tener múltiples **contratos**, asociados a **cargos**, **horarios** y **tipos de contrato**.
- Cada **contrato** puede generar **roles de pago**, con múltiples **rubros** (ingresos o descuentos).
- El sistema gestiona la **asistencia** diaria y mensual, asociada a empleados y horarios.

## 📐 Modelo Relacional

Incluye relaciones clave como:

- `Empleado_ID` (en contratos y asistencia)
- `Contrato_ID` (en roles de pago)
- `RolPago_ID` (en detalles y asistencia)
- `Horario_ID` (en contratos y asistencia)
- `Cargo_ID` (en salarios y contratos)
- `Ciudad_ID` → `Provincia_ID` → `Pais_ID`

## 📂 Archivos Incluidos

- `estructura.sql`: script de creación de todas las tablas con claves primarias y foráneas.
- `README.md`: documentación del modelo.
- `diagrama.png`: imagen del modelo entidad-relación.

## 🚀 Uso del Proyecto

1. Ejecutar `estructura.sql` en tu gestor de base de datos favorito (MySQL o PostgreSQL).
2. Insertar registros en las tablas paramétricas.
3. Registrar empleados, contratos, asistencias y generar roles de pago.
4. Consultar reportes de asistencia, sueldos y estructura organizacional.

## 💡 Consideraciones

- Se puede adaptar fácilmente para incluir procesos de selección, evaluaciones de desempeño o beneficios adicionales.
- Las tablas están normalizadas para evitar duplicidad y facilitar integridad referencial.

---

### 📞 Contacto

Para dudas o mejoras sobre este modelo, puedes escribir al administrador del sistema o colaborar mediante pull requests si el proyecto está en un repositorio.

