CREATE DATABASE  IF NOT EXISTS `cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cms`;
-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad_revisions`
--

DROP TABLE IF EXISTS `actividad_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `tipo_recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `turno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_revisions`
--

LOCK TABLES `actividad_revisions` WRITE;
/*!40000 ALTER TABLE `actividad_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_rols`
--

DROP TABLE IF EXISTS `actividad_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_rols`
--

LOCK TABLES `actividad_rols` WRITE;
/*!40000 ALTER TABLE `actividad_rols` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_tipoartefactos`
--

DROP TABLE IF EXISTS `actividad_tipoartefactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_tipoartefactos`
--

LOCK TABLES `actividad_tipoartefactos` WRITE;
/*!40000 ALTER TABLE `actividad_tipoartefactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_tipoartefactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_tiporecursos`
--

DROP TABLE IF EXISTS `actividad_tiporecursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_tiporecursos`
--

LOCK TABLES `actividad_tiporecursos` WRITE;
/*!40000 ALTER TABLE `actividad_tiporecursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_tiporecursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividads`
--

DROP TABLE IF EXISTS `actividads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividads`
--

LOCK TABLES `actividads` WRITE;
/*!40000 ALTER TABLE `actividads` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo_proyectos`
--

DROP TABLE IF EXISTS `archivo_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_proyectos`
--

LOCK TABLES `archivo_proyectos` WRITE;
/*!40000 ALTER TABLE `archivo_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artefactos`
--

DROP TABLE IF EXISTS `artefactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `razuna_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artefactos`
--

LOCK TABLES `artefactos` WRITE;
/*!40000 ALTER TABLE `artefactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `artefactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarios`
--

DROP TABLE IF EXISTS `calendarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `dia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarios`
--

LOCK TABLES `calendarios` WRITE;
/*!40000 ALTER TABLE `calendarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compuerta_cierres`
--

DROP TABLE IF EXISTS `compuerta_cierres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compuerta_cierres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compuerta_cierres`
--

LOCK TABLES `compuerta_cierres` WRITE;
/*!40000 ALTER TABLE `compuerta_cierres` DISABLE KEYS */;
/*!40000 ALTER TABLE `compuerta_cierres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compuerta_desicions`
--

DROP TABLE IF EXISTS `compuerta_desicions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compuerta_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compuerta_desicions`
--

LOCK TABLES `compuerta_desicions` WRITE;
/*!40000 ALTER TABLE `compuerta_desicions` DISABLE KEYS */;
/*!40000 ALTER TABLE `compuerta_desicions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compuerta_pre_desicions`
--

DROP TABLE IF EXISTS `compuerta_pre_desicions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compuerta_pre_desicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compuerta_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `elegida` tinyint(1) DEFAULT NULL,
  `tarea_desicion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compuerta_pre_desicions`
--

LOCK TABLES `compuerta_pre_desicions` WRITE;
/*!40000 ALTER TABLE `compuerta_pre_desicions` DISABLE KEYS */;
/*!40000 ALTER TABLE `compuerta_pre_desicions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compuertus`
--

DROP TABLE IF EXISTS `compuertus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compuertus`
--

LOCK TABLES `compuertus` WRITE;
/*!40000 ALTER TABLE `compuertus` DISABLE KEYS */;
/*!40000 ALTER TABLE `compuertus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposito_proyectos`
--

DROP TABLE IF EXISTS `deposito_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito_proyectos`
--

LOCK TABLES `deposito_proyectos` WRITE;
/*!40000 ALTER TABLE `deposito_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposito_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_actividads`
--

DROP TABLE IF EXISTS `estado_actividads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_actividads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_actividads`
--

LOCK TABLES `estado_actividads` WRITE;
/*!40000 ALTER TABLE `estado_actividads` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_actividads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_tareas`
--

DROP TABLE IF EXISTS `estado_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tareas_id` int(11) DEFAULT NULL,
  `estado_actividads_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estado_tareas_on_estado_actividads_id` (`estado_actividads_id`),
  KEY `index_estado_tareas_on_tareas_id` (`tareas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_tareas`
--

LOCK TABLES `estado_tareas` WRITE;
/*!40000 ALTER TABLE `estado_tareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `index_eventos_on_my_js_tree_id` (`my_js_tree_id`),
  KEY `index_eventos_on_plantilla_id` (`plantilla_id`),
  KEY `index_eventos_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festivos`
--

DROP TABLE IF EXISTS `festivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festivos`
--

LOCK TABLES `festivos` WRITE;
/*!40000 ALTER TABLE `festivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `festivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loops`
--

DROP TABLE IF EXISTS `loops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compuerta_id` int(11) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loops`
--

LOCK TABLES `loops` WRITE;
/*!40000 ALTER TABLE `loops` DISABLE KEYS */;
/*!40000 ALTER TABLE `loops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merge_compuertas`
--

DROP TABLE IF EXISTS `merge_compuertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merge_compuertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) DEFAULT NULL,
  `ruta_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `merge_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merge_compuertas`
--

LOCK TABLES `merge_compuertas` WRITE;
/*!40000 ALTER TABLE `merge_compuertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `merge_compuertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merges`
--

DROP TABLE IF EXISTS `merges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `plantilla_id` int(11) DEFAULT NULL,
  `my_js_tree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merges`
--

LOCK TABLES `merges` WRITE;
/*!40000 ALTER TABLE `merges` DISABLE KEYS */;
/*!40000 ALTER TABLE `merges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_js_trees`
--

DROP TABLE IF EXISTS `my_js_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_js_trees`
--

LOCK TABLES `my_js_trees` WRITE;
/*!40000 ALTER TABLE `my_js_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_js_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacions`
--

DROP TABLE IF EXISTS `organizacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacions`
--

LOCK TABLES `organizacions` WRITE;
/*!40000 ALTER TABLE `organizacions` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantillas`
--

DROP TABLE IF EXISTS `plantillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantillas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_plantilla_id` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_plantillas_on_nombre` (`nombre`),
  KEY `index_plantillas_on_tipo_plantilla_id` (`tipo_plantilla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantillas`
--

LOCK TABLES `plantillas` WRITE;
/*!40000 ALTER TABLE `plantillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso_validacions`
--

DROP TABLE IF EXISTS `proceso_validacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso_validacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso_validacions`
--

LOCK TABLES `proceso_validacions` WRITE;
/*!40000 ALTER TABLE `proceso_validacions` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso_validacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_artefactos`
--

DROP TABLE IF EXISTS `proyecto_artefactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `artefacto_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_artefactos_on_artefacto_id` (`artefacto_id`),
  KEY `index_proyecto_artefactos_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_artefactos`
--

LOCK TABLES `proyecto_artefactos` WRITE;
/*!40000 ALTER TABLE `proyecto_artefactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_artefactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_organizacions`
--

DROP TABLE IF EXISTS `proyecto_organizacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `organizacion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_organizacions_on_organizacion_id` (`organizacion_id`),
  KEY `index_proyecto_organizacions_on_proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_organizacions`
--

LOCK TABLES `proyecto_organizacions` WRITE;
/*!40000 ALTER TABLE `proyecto_organizacions` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_organizacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_recursos`
--

DROP TABLE IF EXISTS `proyecto_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_recursos_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_recursos_on_recurso_id` (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_recursos`
--

LOCK TABLES `proyecto_recursos` WRITE;
/*!40000 ALTER TABLE `proyecto_recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_usuarios`
--

DROP TABLE IF EXISTS `proyecto_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proyecto_usuarios_on_proyecto_id` (`proyecto_id`),
  KEY `index_proyecto_usuarios_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_usuarios`
--

LOCK TABLES `proyecto_usuarios` WRITE;
/*!40000 ALTER TABLE `proyecto_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `index_proyectos_on_director` (`director`),
  KEY `index_proyectos_on_tipo_producto_id` (`tipo_producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `habilitado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_recursos_on_nombre_and_organizacion_id` (`nombre`,`organizacion_id`),
  KEY `index_recursos_on_organizacion_id` (`organizacion_id`),
  KEY `index_recursos_on_tipo_recurso_id` (`tipo_recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos`
--

LOCK TABLES `recursos` WRITE;
/*!40000 ALTER TABLE `recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'nivel_1','2013-05-14 17:22:58','2013-05-14 17:22:58'),(2,'nivel_2','2013-05-14 17:22:58','2013-05-14 17:22:58'),(3,'nivel_3','2013-05-14 17:22:58','2013-05-14 17:22:58'),(4,'nivel_0','2013-05-14 00:00:00','2013-05-14 00:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (4,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_usuarios` (
  `role_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `index_ruta_on_my_js_tree_id` (`my_js_tree_id`),
  KEY `index_ruta_on_plantilla_id` (`plantilla_id`),
  KEY `index_ruta_on_proceso_id` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120531145541'),('20120531145602'),('20120531145624'),('20120601161601'),('20120601161629'),('20120601161658'),('20120601161720'),('20120601161748'),('20120601161858'),('20120601162043'),('20120601162105'),('20120903144214'),('20120904024645'),('20120907123837'),('20120907134943'),('20120921161555'),('20120921183000'),('20120927040849'),('20120927050325'),('20121010195313'),('20121016143529'),('20121026143956'),('20121026162617'),('20121108164747'),('20121108170005'),('20121108170521'),('20121109154444'),('20130208140132'),('20130211041502'),('20130211045032'),('20130213150818'),('20130218164219'),('20130218165211'),('20130225023110'),('20130225024735'),('20130225025232'),('20130225025408'),('20130225025516'),('20130225025932'),('20130225030758'),('20130225034735'),('20130225034948'),('20130225152111'),('20130225152356'),('20130225153446'),('20130225153551'),('20130225154205'),('20130301183736'),('20130301183937'),('20130304153641'),('20130304153747'),('20130308152900'),('20130308153914'),('20130308154300'),('20130308155549'),('20130311151314'),('20130311155938'),('20130312221211'),('20130312224915'),('20130313001851'),('20130313162103'),('20130331205115'),('20130331221357'),('20130401021330'),('20130408165359'),('20130408181630'),('20130408184643'),('20130415153516'),('20130416205113'),('20130418152444'),('20130419175345'),('20130421185710'),('20130421191141'),('20130423164602'),('20130423224140'),('20130430162316'),('20130502172618'),('20130514155553'),('20130514200539'),('20130514200756'),('20130521205354'),('20130528161559'),('20130528163057'),('20130528190058'),('20130621011239'),('20130718222805'),('20130721214540'),('20130727174611'),('20130727174612'),('20130727174613'),('20130727174614'),('20130807210134'),('20130807211334'),('20130901045548'),('20130902212421'),('20130903141846'),('20130915233933'),('20131001221843'),('20131002033204'),('20131002054236'),('20131006214106'),('20131006220808'),('20131016011911'),('20131029021048'),('20131029023516'),('20131112230743'),('20140311191829'),('20140318183721'),('20140318184446'),('20140325195559'),('20140326042215'),('20140326042851'),('20140610213809'),('20140610214017'),('20140617181440'),('20140623221010'),('20140708034821'),('20140708043155'),('20150508182907'),('20150514214219');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_aprobacions`
--

DROP TABLE IF EXISTS `tarea_aprobacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_aprobacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `comentario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_aprobacions`
--

LOCK TABLES `tarea_aprobacions` WRITE;
/*!40000 ALTER TABLE `tarea_aprobacions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_aprobacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_artefactos`
--

DROP TABLE IF EXISTS `tarea_artefactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `artefacto_id` int(11) DEFAULT NULL,
  `modo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_artefactos`
--

LOCK TABLES `tarea_artefactos` WRITE;
/*!40000 ALTER TABLE `tarea_artefactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_artefactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_participantes`
--

DROP TABLE IF EXISTS `tarea_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_participantes`
--

LOCK TABLES `tarea_participantes` WRITE;
/*!40000 ALTER TABLE `tarea_participantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_presedencia`
--

DROP TABLE IF EXISTS `tarea_presedencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_presedencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predecesora_id` int(11) DEFAULT NULL,
  `sucesora_id` int(11) DEFAULT NULL,
  `tipo_relacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proceso_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `loop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_presedencia`
--

LOCK TABLES `tarea_presedencia` WRITE;
/*!40000 ALTER TABLE `tarea_presedencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_presedencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_recursos`
--

DROP TABLE IF EXISTS `tarea_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_recursos`
--

LOCK TABLES `tarea_recursos` WRITE;
/*!40000 ALTER TABLE `tarea_recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_revisions`
--

DROP TABLE IF EXISTS `tarea_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `comentario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_revisions`
--

LOCK TABLES `tarea_revisions` WRITE;
/*!40000 ALTER TABLE `tarea_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `comentarios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_archivos`
--

DROP TABLE IF EXISTS `tipo_archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_archivos`
--

LOCK TABLES `tipo_archivos` WRITE;
/*!40000 ALTER TABLE `tipo_archivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_artefactos`
--

DROP TABLE IF EXISTS `tipo_artefactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_artefactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_artefactos`
--

LOCK TABLES `tipo_artefactos` WRITE;
/*!40000 ALTER TABLE `tipo_artefactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_artefactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_depositos`
--

DROP TABLE IF EXISTS `tipo_depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_depositos`
--

LOCK TABLES `tipo_depositos` WRITE;
/*!40000 ALTER TABLE `tipo_depositos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_organizacions`
--

DROP TABLE IF EXISTS `tipo_organizacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_organizacions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_organizacions`
--

LOCK TABLES `tipo_organizacions` WRITE;
/*!40000 ALTER TABLE `tipo_organizacions` DISABLE KEYS */;
INSERT INTO `tipo_organizacions` VALUES (1,'Desarrollo de videojuegos casuales','2013-03-11 14:10:33','2013-03-11 14:10:33'),(2,'Desarrollo de animaciones','2013-03-11 14:11:01','2013-03-11 14:11:01'),(3,'Composición musical','2013-03-11 14:12:15','2013-03-11 14:12:15');
/*!40000 ALTER TABLE `tipo_organizacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_plantillas`
--

DROP TABLE IF EXISTS `tipo_plantillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_plantillas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tipo_plantillas_on_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_plantillas`
--

LOCK TABLES `tipo_plantillas` WRITE;
/*!40000 ALTER TABLE `tipo_plantillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_plantillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_productos`
--

DROP TABLE IF EXISTS `tipo_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_productos`
--

LOCK TABLES `tipo_productos` WRITE;
/*!40000 ALTER TABLE `tipo_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_recursos`
--

DROP TABLE IF EXISTS `tipo_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_recursos`
--

LOCK TABLES `tipo_recursos` WRITE;
/*!40000 ALTER TABLE `tipo_recursos` DISABLE KEYS */;
INSERT INTO `tipo_recursos` VALUES (1,'Director de calidad','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(2,'Director de arte','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(3,'Director de proyecto','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(4,'Director de tecnología','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(5,'Productor','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(6,'Líder Técnico','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(7,'Artista plástico','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(8,'Programador de juegos','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(9,'Programador de Software','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(10,'Diseñador gráfico','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(11,'Diseñador de niveles de juego','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(12,'Diseñador de juegos','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(13,'Animador','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(14,'Guionista','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(15,'Dibujante','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(16,'Scrum master','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(17,'Artista de juegos','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1),(18,'Músico de juegos','2014-10-23 16:35:35','2014-10-23 16:35:35',NULL,1);
/*!40000 ALTER TABLE `tipo_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transicions`
--

DROP TABLE IF EXISTS `transicions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transicions`
--

LOCK TABLES `transicions` WRITE;
/*!40000 ALTER TABLE `transicions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transicions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@david.com','$2a$10$7xsDwgMS5D1.takEKFnPg.Z.xG/SobXRT1O8zdgEyB9HCLRhh3FEa',NULL,NULL,NULL,23,'2014-10-30 20:46:46','2014-10-30 18:56:19','127.0.0.1','127.0.0.1','2013-05-14 22:41:36','2014-10-30 20:46:46',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `habilitado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_usuarios_on_email` (`email`),
  UNIQUE KEY `index_usuarios_on_reset_password_token` (`reset_password_token`),
  KEY `index_usuarios_on_organizacion_id` (`organizacion_id`),
  KEY `index_usuarios_on_tipo_recurso_id` (`tipo_recurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador de David','admin@david.com',NULL,NULL,'2013-03-11 14:43:42','2013-03-11 14:43:42',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-11 17:20:24
