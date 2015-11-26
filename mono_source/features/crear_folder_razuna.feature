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
# =  Ver tareas asignadas

####################################################################################################
# TODO:
# ¿FOLDER CORRESPONDE A REPOSITORIO O TIPO DE ARTEFACTO?
####################################################################################################

Característica: Usuarios
	Como usuario del sistema y de razuna
	Yo quiero crear un folder en razuna
	De forma que aparezca en mi sesion de razuna

# Pruebas de persitencia
Esquema del escenario:
	Dado que en crear folder soy el usuario <nombre>
	Cuando en crear folder creo el folder <folder>
	Entonces en crear folder se espera el resultado <resultado>

  Ejemplos:
    | nombre	| folder	| resultado |
    | juan		| Test1		| OK |
    | juan		| Test2		| OK |
    | juan		| Test1		| KO |
