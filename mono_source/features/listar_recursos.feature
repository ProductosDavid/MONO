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
# =  HU_CR_Listar Recursos (sto516)
Característica: Listar Recursos
    Como un usuario con rol administrador de David
    Quiero poder ver los recursos de una organización
    De forma que pueda ver en una grilla sus nombres, tipo al que pertenecen, costo y unidades disponibles.
    Ademas la grilla debe dar la opcion de realizar tareas administrativas sobre estos

#Prueba de usuario
#Visualizar la grilla
  Esquema del escenario:
    Dado que un usuario se encuentra en la ventana de: <ventana>
    Cuando presiona el boton: <boton>
    Entonces se espera ver una grilla
    Y que tiene una columna: <columna1>
    Y que tiene una columna: <columna2>
    Y que tiene una columna: <columna4>

    Ejemplos:
    | ventana        | boton           | columna1 | columna2        | columna4  |
    | /recursos      | admin_recursos  | Nombre   | Tipo de recurso | Unidades disponibles |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE CREAR RECURSO
# PRUEBAS CREAR RECURSO OK
####################################################################################################

#Prueba de usuario
#Visualizar un recurso creado
#  Esquema del escenario: 
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Cuando da click en el boton: <boton>
#    Y crea un recurso con nombre: <nombre> tipo: <tipo> costo: <costo> unidades: <unidades>
#    Y al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y una fila con el valor: <nombre>
#    Y una fila con el valor: <tipo>
#    Y una fila con el valor: <costo>
#    Y una fila con el valor: <unidades>

#  Ejemplos:
#    | ventana   | boton         | nombre | tipo     | costo | unidades |
#    | /recursos | nuevo_recurso | iMac   | 1 |  10   | 1        |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE MODIFICAR RECURSO
####################################################################################################

#Prueba de usuario
#Visualizar un recurso modificado
#  Esquema del escenario:
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Y que selecciona un recurso con el nombre: <nombre_inicial>
#    Cuando presiona el boton: <boton>
#    Y modifica del recurso su nombre: <nombre_final>, tipo: <tipo>, costo: <costo>, unidades: <unidades>
#    Y al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y una fila con el valor: <nombre_final>
#    Y una fila con el valor: <tipo>
#    Y una fila con el valor: <costo>
#    Y una fila con el valor: <unidades>

#  Ejemplos:
#    | ventana   | boton          | nombre_inicial     | nombre final        | tipo     | costo | unidades |
#    | /recursos | editar_recurso | Licencia Word 2010 | Licencia Word 2012  | Licencia |  100   | 1       |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE ELIMINAR RECURSO
####################################################################################################

#Prueba de usuario
#Visualizar un recurso eliminado
#  Esquema del escenario:
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Y que selecciona un recurso con el nombre: <nombre>
#    Y presiona el boton: <boton>
#    Y confirma la operacion de eliminar el recurso
#    Y al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y con ninguna fila con el valor: <nombre>

#  Ejemplos:
#    | ventana   | boton             | nombre              |
#    | /recursos | Eliminar recurso  | Licencia Word 2010  |


