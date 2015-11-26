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
# = Importar artefactos Dropbox

####################################################################################################
# TODO:
####################################################################################################

Característica: Artefactos
	Como usuario del sistema
	Yo quiero importar artefactos desde Dropbox
	De forma que esos artefactos me aparezcan en razuna

# Pruebas de persitencia
Esquema del escenario:
	Dado que en importar desde Dropbox soy el usuario <nombre>
	Y en importar desde Dropbox tengo clave <clave>
	Cuando en importar desde Dropbox importo artefactos
	Entonces en importar desde Dropbox se espera el resultado <resultado>

  Ejemplos:
    | nombre		| clave		| resultado |
    | admindavid	| 123456	| OK |
