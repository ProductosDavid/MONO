# Host: localhost  (Version: 5.6.15)
# Date: 2014-05-12 23:40:09
# Generator: MySQL-Front 5.3  (Build 4.91)

DROP DATABASE IF EXISTS `cms`;
CREATE DATABASE `cms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cms`;

#
# Structure for table "actividad_revisions"
#

DROP TABLE IF EXISTS `actividad_revisions`;
CREATE TABLE `actividad_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `turno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "actividad_rols"
#

DROP TABLE IF EXISTS `actividad_rols`;
CREATE TABLE `actividad_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_actividad_rols_on_actividad_id` (`actividad_id`),
  KEY `index_actividad_rols_on_rol_id` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "actividad_tipoartefactos"
#

DROP TABLE IF EXISTS `actividad_tipoartefactos`;
CREATE TABLE `actividad_tipoartefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad_id` int(11) DEFAULT NULL,
  `tipo_artefacto_id` int(11) DEFAULT NULL,
  `modo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_actividad_tipoartefactos_on_actividad_id` (`actividad_id`),
  KEY `index_actividad_tipoartefactos_on_tipo_artefacto_id` (`tipo_artefacto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "actividad_tiporecursos"
#

DROP TABLE IF EXISTS `actividad_tiporecursos`;
CREATE TABLE `actividad_tiporecursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad_id` int(11) DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `cantidad` int(255) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_actividad_tiporecursos_on_actividad_id_and_tipo_recurso_id` (`actividad_id`,`tipo_recurso_id`),
  KEY `index_actividad_tiporecursos_on_actividad_id` (`actividad_id`),
  KEY `index_actividad_tiporecursos_on_tipo_recurso_id` (`tipo_recurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "actividads"
#

DROP TABLE IF EXISTS `actividads`;
CREATE TABLE `actividads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modoejecucion` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_instancias` int(11) DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `horas_estimadas` int(11) DEFAULT NULL,
  `tipocontrol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modo_revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_actividads_on_plantilla_id` (`plantilla_id`),
  KEY `index_actividads_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "archivo_proyectos"
#

DROP TABLE IF EXISTS `archivo_proyectos`;
CREATE TABLE `archivo_proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_archivo_proyectos_on_archivo_id_and_proyecto_id` (`archivo_id`,`proyecto_id`),
  KEY `index_archivo_proyectos_on_archivo_id` (`archivo_id`),
  KEY `index_archivo_proyectos_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "archivos"
#

DROP TABLE IF EXISTS `archivos`;
CREATE TABLE `archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_archivo_id` int(11) DEFAULT NULL,
  `tipo_artefacto_id` int(11) DEFAULT NULL,
  `fcreado` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deposito_id` int(11) DEFAULT NULL,
  `blob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_archivos_on_deposito_id` (`deposito_id`),
  KEY `index_archivos_on_tipo_archivo_id` (`tipo_archivo_id`),
  KEY `index_archivos_on_tipo_artefacto_id` (`tipo_artefacto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "artefactos"
#

DROP TABLE IF EXISTS `artefactos`;
CREATE TABLE `artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `razuna_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "compuerta_cierres"
#

DROP TABLE IF EXISTS `compuerta_cierres`;
CREATE TABLE `compuerta_cierres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "compuerta_desicions"
#

DROP TABLE IF EXISTS `compuerta_desicions`;
CREATE TABLE `compuerta_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "compuerta_pre_desicions"
#

DROP TABLE IF EXISTS `compuerta_pre_desicions`;
CREATE TABLE `compuerta_pre_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "compuertus"
#

DROP TABLE IF EXISTS `compuertus`;
CREATE TABLE `compuertus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `desicion` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_compuertus_on_plantilla_id` (`plantilla_id`),
  KEY `index_compuertus_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "deposito_proyectos"
#

DROP TABLE IF EXISTS `deposito_proyectos`;
CREATE TABLE `deposito_proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposito_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_deposito_proyectos_on_deposito_id_and_proyecto_id` (`deposito_id`,`proyecto_id`),
  KEY `index_deposito_proyectos_on_deposito_id` (`deposito_id`),
  KEY `index_deposito_proyectos_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "depositos"
#

DROP TABLE IF EXISTS `depositos`;
CREATE TABLE `depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_deposito_id` int(11) DEFAULT NULL,
  `fcreado` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cuenta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_depositos_on_tipo_deposito_id` (`tipo_deposito_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "estado_actividads"
#

DROP TABLE IF EXISTS `estado_actividads`;
CREATE TABLE `estado_actividads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for table "estado_tareas"
#

DROP TABLE IF EXISTS `estado_tareas`;
CREATE TABLE `estado_tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tareas_id` int(11) DEFAULT NULL,
  `estado_actividads_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estado_tareas_on_tareas_id` (`tareas_id`),
  KEY `index_estado_tareas_on_estado_actividads_id` (`estado_actividads_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "eventos"
#

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_eventos_on_plantilla_id` (`plantilla_id`),
  KEY `index_eventos_on_my_js_tree_id` (`my_js_tree_id`),
  KEY `index_eventos_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "loops"
#

DROP TABLE IF EXISTS `loops`;
CREATE TABLE `loops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `compuerta_id` int(11) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "my_js_trees"
#

DROP TABLE IF EXISTS `my_js_trees`;
CREATE TABLE `my_js_trees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `left` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_my_js_trees_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "organizacions"
#

DROP TABLE IF EXISTS `organizacions`;
CREATE TABLE `organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `naturaleza` int(11) DEFAULT NULL,
  `representante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo_organizacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `organizacions` (`id`,`nit`,`nombre`,`descripcion`,`naturaleza`,`representante`,`direccion`,`telefono`,`created_at`,`updated_at`,`tipo_organizacion_id`) VALUES (1,'12345678','ColGames S.A','Desde su inicio COLGAMES ha tenido una visión de desarrollo de juegos casuales y sociales, enfocada hacia el mercado internacional sin centrarse en un segmento específico buscando la globalidad',NULL,NULL,NULL,NULL,'2013-07-03 12:24:19','2013-07-03 12:24:19',1);

#
# Structure for table "proceso_validacions"
#

DROP TABLE IF EXISTS `proceso_validacions`;
CREATE TABLE `proceso_validacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=latin1;

#
# Structure for table "procesos"
#

DROP TABLE IF EXISTS `procesos`;
CREATE TABLE `procesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_plantilla_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_procesos_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "proyecto_artefactos"
#

DROP TABLE IF EXISTS `proyecto_artefactos`;
CREATE TABLE `proyecto_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `artefacto_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_artefactos_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_artefactos_on_artefacto_id` (`artefacto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "proyecto_organizacions"
#

DROP TABLE IF EXISTS `proyecto_organizacions`;
CREATE TABLE `proyecto_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_organizacions_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_organizacions_on_organizacion_id` (`organizacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "proyecto_recursos"
#

DROP TABLE IF EXISTS `proyecto_recursos`;
CREATE TABLE `proyecto_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_recursos_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_recursos_on_recurso_id` (`recurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "proyecto_usuarios"
#

DROP TABLE IF EXISTS `proyecto_usuarios`;
CREATE TABLE `proyecto_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_usuarios_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_usuarios_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "proyectos"
#

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_producto_id` int(11) DEFAULT NULL,
  `fcreado` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` blob,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `director` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `presupuesto` float DEFAULT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyectos_on_tipo_producto_id` (`tipo_producto_id`),
  KEY `index_proyectos_on_director` (`director`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "recursos"
#

DROP TABLE IF EXISTS `recursos`;
CREATE TABLE `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `organizacion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `habilitado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_recursos_on_nombre_and_organizacion_id` (`nombre`,`organizacion_id`),
  KEY `index_recursos_on_tipo_recurso_id` (`tipo_recurso_id`),
  KEY `index_recursos_on_organizacion_id` (`organizacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "roles"
#

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles` (`id`,`name`,`created_at`,`updated_at`) VALUES (1,'nivel_1','2013-05-14 17:22:58','2013-05-14 17:22:58'),(2,'nivel_2','2013-05-14 17:22:58','2013-05-14 17:22:58'),(3,'nivel_3','2013-05-14 17:22:58','2013-05-14 17:22:58'),(4,'nivel_0','2013-05-14 00:00:00','2013-05-14 00:00:00');

#
# Structure for table "roles_users"
#

DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles_users` (`role_id`,`user_id`) VALUES (1,1);

#
# Structure for table "roles_usuarios"
#

DROP TABLE IF EXISTS `roles_usuarios`;
CREATE TABLE `roles_usuarios` (
  `role_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "rols"
#

DROP TABLE IF EXISTS `rols`;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "ruta"
#

DROP TABLE IF EXISTS `ruta`;
CREATE TABLE `ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ruta_on_plantilla_id` (`plantilla_id`),
  KEY `index_ruta_on_my_js_tree_id` (`my_js_tree_id`),
  KEY `index_ruta_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "schema_migrations"
#

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tarea_aprobacions"
#

DROP TABLE IF EXISTS `tarea_aprobacions`;
CREATE TABLE `tarea_aprobacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tarea_artefactos"
#

DROP TABLE IF EXISTS `tarea_artefactos`;
CREATE TABLE `tarea_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `artefacto_id` int(11) DEFAULT NULL,
  `modo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tarea_participantes"
#

DROP TABLE IF EXISTS `tarea_participantes`;
CREATE TABLE `tarea_participantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `dedicacion` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ejecutadas` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tarea_presedencia"
#

DROP TABLE IF EXISTS `tarea_presedencia`;
CREATE TABLE `tarea_presedencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predecesora_id` int(11) DEFAULT NULL,
  `sucesora_id` int(11) DEFAULT NULL,
  `tipo_relacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tarea_recursos"
#

DROP TABLE IF EXISTS `tarea_recursos`;
CREATE TABLE `tarea_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tarea_revisions"
#

DROP TABLE IF EXISTS `tarea_revisions`;
CREATE TABLE `tarea_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "tareas"
#

DROP TABLE IF EXISTS `tareas`;
CREATE TABLE `tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `comentarios` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avance` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `horas_planeadas` int(11) DEFAULT NULL,
  `horas_ejecutadas` int(11) DEFAULT NULL,
  `inst_num` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `hito` tinyint(1) DEFAULT NULL,
  `horas_acumuladas` int(11) DEFAULT NULL,
  `activada` tinyint(1) DEFAULT NULL,
  `es_aprobacion` tinyint(1) DEFAULT NULL,
  `tarea_revisar_id` int(11) DEFAULT NULL,
  `es_desicion` tinyint(1) DEFAULT NULL,
  `compuerta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tareas_on_actividad_id` (`actividad_id`),
  KEY `index_tareas_on_proceso_id` (`proceso_id`),
  KEY `index_tareas_on_responsable_id` (`responsable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

#
# Structure for table "tipo_archivos"
#

DROP TABLE IF EXISTS `tipo_archivos`;
CREATE TABLE `tipo_archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tipo_artefactos"
#

DROP TABLE IF EXISTS `tipo_artefactos`;
CREATE TABLE `tipo_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tipo_depositos"
#

DROP TABLE IF EXISTS `tipo_depositos`;
CREATE TABLE `tipo_depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tipo_depositos` VALUES (2,'Basecamp','basecamp.png','2012-06-01 18:29:29','2012-06-01 18:29:29'),(3,'Dropbox','dropbox.png','2012-06-01 18:30:08','2012-06-01 18:30:08');

#
# Structure for table "tipo_organizacions"
#

DROP TABLE IF EXISTS `tipo_organizacions`;
CREATE TABLE `tipo_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tipo_organizacions` (`id`,`name`,`created_at`,`updated_at`) VALUES (1,'Desarrollo de videojuegos casuales','2013-03-11 14:10:33','2013-03-11 14:10:33');

#
# Structure for table "tipo_plantillas"
#

DROP TABLE IF EXISTS `tipo_plantillas`;
CREATE TABLE `tipo_plantillas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tipo_plantillas_on_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "plantillas"
#

DROP TABLE IF EXISTS `plantillas`;
CREATE TABLE `plantillas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_plantilla_id` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_plantillas_on_nombre` (`nombre`),
  KEY `index_plantillas_on_tipo_plantilla_id` (`tipo_plantilla_id`),
  CONSTRAINT `tipo_plantilla_pk` FOREIGN KEY (`tipo_plantilla_id`) REFERENCES `tipo_plantillas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tipo_productos"
#

DROP TABLE IF EXISTS `tipo_productos`;
CREATE TABLE `tipo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tipo_recursos"
#

DROP TABLE IF EXISTS `tipo_recursos`;
CREATE TABLE `tipo_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "transicions"
#

DROP TABLE IF EXISTS `transicions`;
CREATE TABLE `transicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_inicio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incio_id` int(11) DEFAULT NULL,
  `tipo_fin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fin_id` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transicions_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`,`email`,`encrypted_password`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`created_at`,`updated_at`,`nombre`,`apellidos`,`password_confirm`,`tipo_recurso_id`,`login`) VALUES (1,'admin@colgames.com','$2a$10$7xsDwgMS5D1.takEKFnPg.Z.xG/SobXRT1O8zdgEyB9HCLRhh3FEa',NULL,NULL,NULL,6,'2013-11-26 15:51:22','2013-11-26 12:52:30','127.0.0.1','127.0.0.1','2013-05-15 00:00:00','2013-11-26 15:51:22',NULL,NULL,NULL,NULL,NULL);
#
# Structure for table "usuarios"
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `habilitado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_usuarios_on_email` (`email`),
  UNIQUE KEY `index_usuarios_on_reset_password_token` (`reset_password_token`),
  KEY `index_usuarios_on_tipo_recurso_id` (`tipo_recurso_id`),
  KEY `index_usuarios_on_organizacion_id` (`organizacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `usuarios` (`id`,`nombre`,`login`,`tipo_recurso_id`,`imagen`,`created_at`,`updated_at`,`organizacion_id`,`password`,`password_confirm`,`apellidos`,`email`,`encrypted_password`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`habilitado`) VALUES (1,'Administrador de ColGames',NULL,NULL,NULL,'2013-03-12 00:00:00','2013-03-12 00:00:00',1,NULL,NULL,NULL,'admin@colgames.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1);



