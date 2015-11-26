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
####################################################################################################

Característica: Usuarios
	Como usuario del sistema
	Yo quiero probar razuna
	De forma que haga las cosas desde la prueba

# Pruebas de persitencia
Esquema del escenario:
	Dado que soy el usuario <nombre>
	Cuando visito la pagina <pagina>
	Entonces se espera una respuesta

  Ejemplos:
    | nombre	| pagina	| 
    | juan		| http://pruebasdavid.virtual.uniandes.edu.co:8080/razuna/global/api2/folder.cfc?method=getfolder&api_key=8F852FE7C05B44528D696CA9A08125AA&folderid=067A56D20F264918AA66D729C46652D8 |
