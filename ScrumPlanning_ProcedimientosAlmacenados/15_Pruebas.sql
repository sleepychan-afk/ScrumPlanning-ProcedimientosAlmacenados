/* =========================================================
   PRUEBAS DE TODOS LOS PROCEDIMIENTOS
   ---------------------------------------------------------
   - Ejecutar en una base de datos NUEVA (recién creada),
     porque las pruebas usan los ID 1 de cada tabla.
   - Ejecutar en el orden en que aparecen: cada tabla
     necesita registros de las anteriores.
   - Pueden ejecutar todo el archivo de una vez (F5) o
     bloque por bloque (seleccionar el bloque y F5).
   - Si algo da 500, revisen la columna MensajeTecnico.
   ========================================================= */

USE [DB_SCRUM_PLANNING]
GO

/* ---------- 1. STATUS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @i_statusName = 'Nuevo', @i_statusCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @i_statusId = 1, @i_statusName = 'Pendiente', @i_statusModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 2. ROLES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Roles]
    @i_rolName = 'Administrador', @i_rolCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Roles]
    @i_rolId = 1, @i_rolName = 'Scrum Master', @i_rolModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Roles]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 3. USERS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Users]
    @i_userFullName = 'Usuario de Prueba', @i_userName = 'admin', @i_userEmail = 'admin@correo.com', @i_userPassword = 'Clave123', @i_userRolId = 1, @i_userCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Users]
    @i_userId = 1, @i_userFullName = 'Usuario Modificado', @i_userModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_SECURITY].[USP_Users]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 4. BUSINESS VALUES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_BusinessValues]
    @i_businessValueName = 'Alto', @i_businessValueCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_BusinessValues]
    @i_businessValueId = 1, @i_businessValueName = 'Muy alto', @i_businessValueModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_BusinessValues]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 5. PRIORITIES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Priorities]
    @i_priorityName = 'Alta', @i_priorityCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Priorities]
    @i_priorityId = 1, @i_priorityName = 'Urgente', @i_priorityModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Priorities]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 6. ACTIVITY TYPES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_ActivityTypes]
    @i_activityTypeName = 'Desarrollo', @i_activityTypeCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_ActivityTypes]
    @i_activityTypeId = 1, @i_activityTypeName = 'Pruebas', @i_activityTypeModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_ActivityTypes]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 7. INITIATIVES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Initiatives]
    @i_initiativeSummary = 'Iniciativa de prueba', @i_initiativeDescription = 'Descripcion de la iniciativa', @i_initiativeOwner = 1, @i_initiativeBusinessValue = 1, @i_initiativeTargetStart = '2026-11-01', @i_initiativeTargetEnd = '2026-12-31', @i_initiativeCreatorId = 1, @i_initiativeStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Initiatives]
    @i_initiativeId = 1, @i_initiativeGoals = 'Meta actualizada', @i_initiativeModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Initiatives]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 8. EPICS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Epics]
    @i_epicName = 'Epica 1', @i_epicSummary = 'Resumen de la epica', @i_epicDescription = 'Descripcion de la epica', @i_epicParentLink = 1, @i_epicOwner = 1, @i_epicPriority = 1, @i_epicCreatorId = 1, @i_epicStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Epics]
    @i_epicId = 1, @i_epicName = 'Epica 1 modificada', @i_epicModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Epics]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 9. FEATURES ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Features]
    @i_featureSummary = 'Feature de prueba', @i_featureDescription = 'Descripcion del feature', @i_featuresAcceptanceCriteria = 'Criterios del feature', @i_featureParentLink = 1, @i_featureOwner = 1, @i_featureCreatorId = 1, @i_featureStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Features]
    @i_featureId = 1, @i_featurePriority = 1, @i_featureModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Features]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 10. PRODUCT BACKLOG ITEMS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_ProductBacklogItems]
    @i_PBISummary = 'PBI de prueba', @i_PBIDescription = 'Descripcion del PBI', @i_PBIsAcceptanceCriteria = 'Criterios del PBI', @i_PBIOwner = 1, @i_PBIParentLink = 1, @i_PBIStoryPoint = 3, @i_PBICreatorId = 1, @i_PBIStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_ProductBacklogItems]
    @i_PBIId = 1, @i_PBIStoryPoint = 5, @i_PBIModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_ProductBacklogItems]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 11. TASKS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Tasks]
    @i_taskSummary = 'Tarea de prueba', @i_taskDescription = 'Descripcion de la tarea', @i_taskOwner = 1, @i_taskParentLink = 1, @i_taskOriginalEstimate = 5.00, @i_taskActivityType = 1, @i_taskCreatorId = 1, @i_taskStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Tasks]
    @i_taskId = 1, @i_taskCompletedWork = 2.50, @i_taskRemaningWork = 2.50, @i_taskModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Tasks]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- 12. TASK COMMENTS ---------- */
-- INSERTAR (esperado: 201)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_TaskComments]
    @i_taskCommentParentLink = 1, @i_taskCommentOwner = 1, @i_taskCommentText = N'Primer comentario', @i_taskCommentCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- ACTUALIZAR (esperado: 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_TaskComments]
    @i_taskCommentId = 1, @i_taskCommentText = N'Comentario editado', @i_taskCommentModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
-- LISTAR (esperado: la tabla + 200)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_TaskComments]
    @i_PageNumber = 1, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

/* ---------- PRUEBAS DE VALIDACIONES (deben fallar a propósito) ---------- */

-- Insert sin nombre (esperado: 400 EL NOMBRE DEL STATUS ES OBLIGATORIO)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @i_statusCreatorId = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

-- Update de un registro que no existe (esperado: 404 LA TAREA NO EXISTE)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_Tasks]
    @i_taskId = 999, @i_taskModificatorId = 1,
    @w_Accion = 'U',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

-- PBI con un Feature padre que no existe (esperado: 400 EL FEATURE PADRE NO EXISTE)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_GENERAL].[USP_ProductBacklogItems]
    @i_PBISummary = 'X', @i_PBIDescription = 'X', @i_PBIsAcceptanceCriteria = 'X', @i_PBIOwner = 1, @i_PBIParentLink = 999, @i_PBICreatorId = 1, @i_PBIStatus = 1,
    @w_Accion = 'I',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

-- Listar una página que no tiene datos (esperado: 204 NO HAY MAS REGISTROS PARA LISTAR)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @i_PageNumber = 50, @i_RowsPerPage = 10,
    @w_Accion = 'S',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO

-- Acción inválida (esperado: 405 METODO NO HABILITADO)
DECLARE @num INT, @tec VARCHAR(500), @usu VARCHAR(500);
EXEC [SQM_CATALOGS].[USP_Status]
    @w_Accion = 'X',
    @o_Numero = @num OUT, @o_MensajeTecnico = @tec OUT, @o_MensajeUsuario = @usu OUT;
SELECT @num AS Numero, @usu AS MensajeUsuario, @tec AS MensajeTecnico;
GO
