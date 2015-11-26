#
#  MONO
#  Copyright (C) 2015  Universidad de los Andes
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#  
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#  
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# language: es
# =  HU_TP_Crear Proceso
Característica: Proceso
Como usuario que gestiona procesos
quiero crear un proceso
de forma que  que los datos de la plantilla sean tomados como la base del nuevo proceso.

# Creacion de plantillas
  Esquema del escenario:
    Dado que en procesos creo un proceso con nombre <nombre> tipo de plantilla <tipo_plantilla> descripcion <descripcion>
    Cuando en procesos se guarde el proceso
    Entonces en procesos se espera ver <resultado>
 
  Ejemplos:
    | nombre | tipo_plantilla | resultado | descripcion |
    | proceso_1 | 1 | OK | proceso_uno |
    | proceso_2 | 3 | OK | proceso_dos |
    |  | 2 | KO | proceso_tres |
    
    # Proceso OK
    # Proceso SIN NOMBRE

  # Escenario No. 2
  Esquema del escenario:
    Dado que en empresas existe una empresa con nombre <nombreemp> nit <nitemp> descripcion <descripcionemp>
    Y que tiene un proyecto asignado con nombre <nombreproy> descripcion <descripcionproy>
    Cuando contiene un proceso con nombre <nombreproc> tipo de plantilla <tipo_plantilla> descripcion <descripcionproc>
    Entonces se espera un resultado <resultado>

  Ejemplos:
    | nombreemp | nitemp | descripcionemp | nombreproy | descripcionproy | nombreproc | tipo_plantilla | descripcionproc | resultado |
    | colgames | 123456 | colgames hace videos | Run lucho Run | ciclismo naciona | elaborar scritp | 1 | elaboracion script | OK |
    | colmusic | 123457 | colmusic hace musica | el vendedor de periodicos | corto animado | desarrollo creativo | 2 | desarrollar el corto | OK |
