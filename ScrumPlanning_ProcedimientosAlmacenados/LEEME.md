# DB_SCRUM_PLANNING – Procedimientos almacenados

Procedimientos de **Insertar (I)**, **Actualizar (U)** y **Listar con paginación OFFSET (S)** para las 12 tablas de la base, siguiendo la estructura del ejemplo `USP_Users` del profe.

## Orden para ejecutar en SQL Server

| # | Archivo | Qué hace |
|---|---------|----------|
| 01 | `01_DB_SCRUM_PLANNING.sql` | Crea la base, los esquemas y las tablas (script del profe) |
| 02 | `02_Encriptacion.sql` | Crea la llave, el certificado y la función que usa Users para encriptar la contraseña |
| 03 | `03_USP_Status.sql` | `[SQM_CATALOGS].[USP_Status]` |
| 04 | `04_USP_Roles.sql` | `[SQM_SECURITY].[USP_Roles]` |
| 05 | `05_USP_Users.sql` | `[SQM_SECURITY].[USP_Users]` |
| 06 | `06_USP_BusinessValues.sql` | `[SQM_CATALOGS].[USP_BusinessValues]` |
| 07 | `07_USP_Priorities.sql` | `[SQM_CATALOGS].[USP_Priorities]` |
| 08 | `08_USP_ActivityTypes.sql` | `[SQM_CATALOGS].[USP_ActivityTypes]` |
| 09 | `09_USP_Initiatives.sql` | `[SQM_GENERAL].[USP_Initiatives]` |
| 10 | `10_USP_Epics.sql` | `[SQM_GENERAL].[USP_Epics]` |
| 11 | `11_USP_Features.sql` | `[SQM_GENERAL].[USP_Features]` |
| 12 | `12_USP_ProductBacklogItems.sql` | `[SQM_GENERAL].[USP_ProductBacklogItems]` |
| 13 | `13_USP_Tasks.sql` | `[SQM_GENERAL].[USP_Tasks]` |
| 14 | `14_USP_TaskComments.sql` | `[SQM_GENERAL].[USP_TaskComments]` |
| 15 | `15_Pruebas.sql` | Prueba Insertar, Actualizar y Listar de cada tabla, más algunas validaciones |

## Cómo se usa cada procedimiento

Todos reciben los mismos parámetros de control:

- `@w_Accion`: `'I'` insertar, `'U'` actualizar, `'S'` listar.
- `@i_PageNumber` y `@i_RowsPerPage`: solo para listar.
- Salidas: `@o_Numero` (código), `@o_MensajeUsuario` y `@o_MensajeTecnico`.

| Código | Significado |
|--------|-------------|
| 200 | Actualizado o listado correctamente |
| 201 | Registrado correctamente |
| 204 | No hay más registros en esa página |
| 400 | Falta un dato obligatorio, está repetido o un registro relacionado no existe |
| 404 | El registro que se quiere actualizar no existe |
| 405 | Acción no válida |
| 500 | Error de SQL (el detalle viene en `@o_MensajeTecnico`) |

## Validaciones incluidas

- **Insertar:** campos obligatorios (los NOT NULL de la tabla), nombres repetidos en los catálogos, que existan los registros relacionados (owner, padre, status, prioridad, etc.) y que la fecha de inicio no sea mayor que la de fin.
- **Actualizar:** id y modificador obligatorios, que el registro exista, las mismas revisiones de relacionados y fechas. Solo cambia los campos que se envían (`COALESCE`).
- **Listar:** que la página y la cantidad de filas sean mayores a cero.

## Correcciones respecto a los ejemplos

- `TBL_Roles` está en `[SQM_SECURITY]` (en el ejemplo de Users se buscaba en `[SQM_CATALOGS]`).
- En Update, todas las validaciones van con `ELSE IF` (en Users faltaba uno).
- Status, Roles y Users ahora guardan la fecha de modificación al insertar, porque en esas tablas es `NOT NULL`.
- Todos usan transacciones (`BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`) como el ejemplo.
- Se agregó `SET NOCOUNT ON` para que Python lea bien los resultados cuando se hagan los endpoints.
