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
# = Autenticarse

####################################################################################################
# TODO:
####################################################################################################

Característica: Usuarios
	Como usuario de DAVID
	Yo quiero hacer uso de las prestaciones de la herramienta
	De forma que dados mis roles asociados al ingresar DAVID tenga acceso permitido o no a cada una de las prestaciones de esta herramienta.

Esquema del escenario:
	Dado que soy un usuario registrado en el sistema 
	Cuando yo me autentico con el login <login>
	Y yo me autentico con la clave <clave>
	Entonces se espera al autenticarme el resultado <resultado>

  Ejemplos:
    | login		| clave		| resultado		|
    | juan		| juan123	| OK			|
    | juan		| juan124	| KO			|
    | leidy		| juan123	| KO			|

