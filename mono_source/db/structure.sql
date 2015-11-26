CREATE TABLE `actividad_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `turno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `razuna_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `calendarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `dia` varchar(255) DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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

CREATE TABLE `compuerta_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `compuerta_pre_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `festivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `merge_compuerta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) DEFAULT NULL,
  `ruta_id` varchar(255) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `merge_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

CREATE TABLE `merges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `proceso_validacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=latin1;

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
  `lunes` int(11) DEFAULT NULL,
  `martes` int(11) DEFAULT NULL,
  `miercoles` int(11) DEFAULT NULL,
  `jueves` int(11) DEFAULT NULL,
  `viernes` int(11) DEFAULT NULL,
  `sabado` int(11) DEFAULT NULL,
  `domingo` int(11) DEFAULT NULL,
  `fechaini` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_procesos_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `proyecto_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_organizacions_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_organizacions_on_organizacion_id` (`organizacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `proyecto_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_recursos_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_recursos_on_recurso_id` (`recurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `proyecto_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_usuarios_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_usuarios_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `roles_usuarios` (
  `role_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tarea_aprobacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `artefacto_id` int(11) DEFAULT NULL,
  `modo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tarea_presedencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predecesora_id` int(11) DEFAULT NULL,
  `sucesora_id` int(11) DEFAULT NULL,
  `tipo_relacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5305 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tarea_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_plantillas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tipo_plantillas_on_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tipo_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20120531145541');

INSERT INTO schema_migrations (version) VALUES ('20120531145602');

INSERT INTO schema_migrations (version) VALUES ('20120531145624');

INSERT INTO schema_migrations (version) VALUES ('20120601161601');

INSERT INTO schema_migrations (version) VALUES ('20120601161629');

INSERT INTO schema_migrations (version) VALUES ('20120601161658');

INSERT INTO schema_migrations (version) VALUES ('20120601161720');

INSERT INTO schema_migrations (version) VALUES ('20120601161748');

INSERT INTO schema_migrations (version) VALUES ('20120601161858');

INSERT INTO schema_migrations (version) VALUES ('20120601162043');

INSERT INTO schema_migrations (version) VALUES ('20120601162105');

INSERT INTO schema_migrations (version) VALUES ('20120903144214');

INSERT INTO schema_migrations (version) VALUES ('20120904024645');

INSERT INTO schema_migrations (version) VALUES ('20120907123837');

INSERT INTO schema_migrations (version) VALUES ('20120907134943');

INSERT INTO schema_migrations (version) VALUES ('20120921161555');

INSERT INTO schema_migrations (version) VALUES ('20120921183000');

INSERT INTO schema_migrations (version) VALUES ('20120927040849');

INSERT INTO schema_migrations (version) VALUES ('20120927050325');

INSERT INTO schema_migrations (version) VALUES ('20121010195313');

INSERT INTO schema_migrations (version) VALUES ('20121016143529');

INSERT INTO schema_migrations (version) VALUES ('20121026143956');

INSERT INTO schema_migrations (version) VALUES ('20121026162617');

INSERT INTO schema_migrations (version) VALUES ('20121108164611');

INSERT INTO schema_migrations (version) VALUES ('20121108164747');

INSERT INTO schema_migrations (version) VALUES ('20121108170005');

INSERT INTO schema_migrations (version) VALUES ('20121108170521');

INSERT INTO schema_migrations (version) VALUES ('20121109154444');

INSERT INTO schema_migrations (version) VALUES ('20130208140132');

INSERT INTO schema_migrations (version) VALUES ('20130211032231');

INSERT INTO schema_migrations (version) VALUES ('20130211041502');

INSERT INTO schema_migrations (version) VALUES ('20130211045032');

INSERT INTO schema_migrations (version) VALUES ('20130213150818');

INSERT INTO schema_migrations (version) VALUES ('20130218164219');

INSERT INTO schema_migrations (version) VALUES ('20130218165211');

INSERT INTO schema_migrations (version) VALUES ('20130225023110');

INSERT INTO schema_migrations (version) VALUES ('20130225024735');

INSERT INTO schema_migrations (version) VALUES ('20130225025232');

INSERT INTO schema_migrations (version) VALUES ('20130225025408');

INSERT INTO schema_migrations (version) VALUES ('20130225025516');

INSERT INTO schema_migrations (version) VALUES ('20130225025932');

INSERT INTO schema_migrations (version) VALUES ('20130225030758');

INSERT INTO schema_migrations (version) VALUES ('20130225034735');

INSERT INTO schema_migrations (version) VALUES ('20130225034948');

INSERT INTO schema_migrations (version) VALUES ('20130225152111');

INSERT INTO schema_migrations (version) VALUES ('20130225152356');

INSERT INTO schema_migrations (version) VALUES ('20130225153446');

INSERT INTO schema_migrations (version) VALUES ('20130225153551');

INSERT INTO schema_migrations (version) VALUES ('20130225154205');

INSERT INTO schema_migrations (version) VALUES ('20130301183736');

INSERT INTO schema_migrations (version) VALUES ('20130301183937');

INSERT INTO schema_migrations (version) VALUES ('20130304153641');

INSERT INTO schema_migrations (version) VALUES ('20130304153747');

INSERT INTO schema_migrations (version) VALUES ('20130308152900');

INSERT INTO schema_migrations (version) VALUES ('20130308153914');

INSERT INTO schema_migrations (version) VALUES ('20130308154300');

INSERT INTO schema_migrations (version) VALUES ('20130308155549');

INSERT INTO schema_migrations (version) VALUES ('20130311151314');

INSERT INTO schema_migrations (version) VALUES ('20130311155938');

INSERT INTO schema_migrations (version) VALUES ('20130312221211');

INSERT INTO schema_migrations (version) VALUES ('20130312224915');

INSERT INTO schema_migrations (version) VALUES ('20130313001851');

INSERT INTO schema_migrations (version) VALUES ('20130313162103');

INSERT INTO schema_migrations (version) VALUES ('20130331205115');

INSERT INTO schema_migrations (version) VALUES ('20130331221357');

INSERT INTO schema_migrations (version) VALUES ('20130401021330');

INSERT INTO schema_migrations (version) VALUES ('20130408165359');

INSERT INTO schema_migrations (version) VALUES ('20130408181630');

INSERT INTO schema_migrations (version) VALUES ('20130408184643');

INSERT INTO schema_migrations (version) VALUES ('20130415153516');

INSERT INTO schema_migrations (version) VALUES ('20130416205113');

INSERT INTO schema_migrations (version) VALUES ('20130418152444');

INSERT INTO schema_migrations (version) VALUES ('20130419175345');

INSERT INTO schema_migrations (version) VALUES ('20130421185710');

INSERT INTO schema_migrations (version) VALUES ('20130421191141');

INSERT INTO schema_migrations (version) VALUES ('20130423164602');

INSERT INTO schema_migrations (version) VALUES ('20130423224140');

INSERT INTO schema_migrations (version) VALUES ('20130430162316');

INSERT INTO schema_migrations (version) VALUES ('20130502172618');

INSERT INTO schema_migrations (version) VALUES ('20130514155553');

INSERT INTO schema_migrations (version) VALUES ('20130514200539');

INSERT INTO schema_migrations (version) VALUES ('20130514200756');

INSERT INTO schema_migrations (version) VALUES ('20130521205354');

INSERT INTO schema_migrations (version) VALUES ('20130528161559');

INSERT INTO schema_migrations (version) VALUES ('20130528163057');

INSERT INTO schema_migrations (version) VALUES ('20130528190058');

INSERT INTO schema_migrations (version) VALUES ('20130621011239');

INSERT INTO schema_migrations (version) VALUES ('20130718222805');

INSERT INTO schema_migrations (version) VALUES ('20130721214540');

INSERT INTO schema_migrations (version) VALUES ('20130727174611');

INSERT INTO schema_migrations (version) VALUES ('20130727174612');

INSERT INTO schema_migrations (version) VALUES ('20130727174613');

INSERT INTO schema_migrations (version) VALUES ('20130727174614');

INSERT INTO schema_migrations (version) VALUES ('20130807210134');

INSERT INTO schema_migrations (version) VALUES ('20130807211334');

INSERT INTO schema_migrations (version) VALUES ('20130901045548');

INSERT INTO schema_migrations (version) VALUES ('20130902212421');

INSERT INTO schema_migrations (version) VALUES ('20130903141846');

INSERT INTO schema_migrations (version) VALUES ('20130915233933');

INSERT INTO schema_migrations (version) VALUES ('20131001221843');

INSERT INTO schema_migrations (version) VALUES ('20131002033204');

INSERT INTO schema_migrations (version) VALUES ('20131002054236');

INSERT INTO schema_migrations (version) VALUES ('20131006214106');

INSERT INTO schema_migrations (version) VALUES ('20131006220808');

INSERT INTO schema_migrations (version) VALUES ('20131016011911');

INSERT INTO schema_migrations (version) VALUES ('20131029021048');

INSERT INTO schema_migrations (version) VALUES ('20131029023516');

INSERT INTO schema_migrations (version) VALUES ('20131112230743');

INSERT INTO schema_migrations (version) VALUES ('20140311191829');

INSERT INTO schema_migrations (version) VALUES ('20140318183721');

INSERT INTO schema_migrations (version) VALUES ('20140318184446');

INSERT INTO schema_migrations (version) VALUES ('20140325195559');

INSERT INTO schema_migrations (version) VALUES ('20140326042215');

INSERT INTO schema_migrations (version) VALUES ('20140326042851');

INSERT INTO schema_migrations (version) VALUES ('20140610213809');

INSERT INTO schema_migrations (version) VALUES ('20140610214017');

INSERT INTO schema_migrations (version) VALUES ('20140617181440');

INSERT INTO schema_migrations (version) VALUES ('20140623221010');

INSERT INTO schema_migrations (version) VALUES ('20140708034821');

INSERT INTO schema_migrations (version) VALUES ('20140708043155');