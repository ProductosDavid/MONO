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
# =  Asociar usuario a tarea
Característica: Tarea
Como usuario que gestiona proyectos
quiero asociar usuarios a una tarea
de forma que pueda definir que tareas va a ejecutar cada usuario

####################################################################################################
# TODO:
# ESCRIBIR ESCENARIOS PARA ACUERDOS DE INTERFAZ
####################################################################################################

  #Escenario No. 3
  Esquema del escenario:
    Dado que existe una tarea con nombre <nombretar> descripcion <descripciontar> duracion <duraciontar>
    Cuando tengo un usuario con nombre <nomusu> tipo recurso <tipusu> clave <clausu> y mail <maiusu>
    Entonces se espera que se puedan asociar dicho usuario a la tarea con un resultado <resultado>
  Ejemplos:
    | nombretar | descripciontar | duraciontar | nomusu | tipusu | clausu | maiusu | resultado |
    | Elaborar propuesta | hacer propuesta | 4 | diego | 48 | 12345678 | diego@colgames.com | OK |
    | Generar Lluvia de ideas | realizar ideas | 5 | camilo | 49 | 87654321 | camilo@colgames.com | OK |
    | Ajustar sinopsis | realizar ajustes | 2 | diana | 36 | 78541236 | diana@colgames.com | OK |
