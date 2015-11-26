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
# = Incorporar Plantilla  Proceso
Característica: Proceso
Como usuario que gestiona procesos
quiero incorporar información de plantilla a un proceso
de forma que los datos de la plantilla sean tomados como base del proceso.

# Creacion de plantillas
  Esquema del escenario: 
    Dado que en incorporar creo un proceso con nombre <proceso> y una actividad <actividad>
    Cuando en incorporar asocie la actividad
    Entonces en incorporar se espera ver <resultado>
 
  Ejemplos:
    | proceso | actividad | resultado |
    | proceso_1 | actividad_1 | OK |
    | proceso_2 | actividad_2 | OK |
    | proceso_3 | actividad_2 | OK |
    
    # Proceso OK

  # Escenario No. 2
Esquema del escenario:
  Dado que a un proceso con nombre <nombreproc> tipo de plantilla <tipo_plantilla> descripcion <descripcionproc>
  Cuando adiciono dos actividades una con nombre <actnom1> descripcion <actdes1> modo revision <actmod1> y la otra con nombre <actnom2> descripcion <actdes2> modo revision <actmod2>
  Entonces se espera que se creen las actividades con su respectivo arbol y que su resultado sea <resultado>

Ejemplos:
  | nombreproc | tipo_plantilla | descripcionproc | actnom1 | actdes1 | actmod1 | actnom2 | actdes2 | actmod2 | resultado |
  | desarrollo creativo | 25 | desarrollo corto | Elaborar propuesta | revision propuesta | sequ | validar script | validacion automatica | aut | OK |
  | script videojuegos | 25 | argumento y perfil | Ajustar scritp | realizar ajustes | aut | elaborar perfil | perfilando personas | sequ | OK |
