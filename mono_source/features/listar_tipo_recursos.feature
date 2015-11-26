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
# =  HU_CR_Listar tipos de Recursos (sto385)

####################################################################################################
# TODO:
# EXTENDER PARA AGREGAR TIPO CON COSTO Y UNIDAD
# AL MOMENTO DE IMPLEMENTAR LA HISTORIA SE TUVO EN CUENTA TIPO DE RECURSO CON SOLO NOMBRE
####################################################################################################

Característica: Listar Tipos de Recursos
    Como un usuario con rol administrador de David
    Quiero poder ver los tipos de recursos existentes
    De forma que pueda ver en una grilla sus nombres.
    Ademas la grilla debe dar la opcion de realizar tareas administrativas sobre estos

#Prueba de usuario
#Visualizar la grilla
  Esquema del escenario:
    Dado que un usuario se encuentra en la ventana de: <ventana>
    Cuando presiona el boton: <boton>
    Entonces se espera ver una grilla
    Y que tiene una columna: <columna1>
    Y con una opcion: <opcion1>

    Ejemplos:
    | ventana         | boton           | columna1 | opcion1               |
    | /tipo_recursos  | admin_recursos  | Tipo de recurso   | Crear tipo de recurso |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE CREAR RECURSO
# Y CREAR RECURSO OK
####################################################################################################

#Prueba de usuario
#Visualizar un tipo de recurso creado
#  Esquema del escenario:
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Cuando da click en el boton: <boton>
#    Y crea un tipo de recurso con nombre: <nombre>
#    Y al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y una fila con el valor: <nombre>

#  Ejemplos:
#    | ventana       | boton                   | nombre   |
#    | /tipo_recursos | nuevo_tipo_recurso | Celular  |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE MODIFICAR RECURSO
####################################################################################################

#Prueba de usuario
#Visualizar un tipo de recurso modificado
#  Esquema del escenario:
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Y que selecciona un tipo de recurso con el nombre: <nombre_inicial>
#    Cuando presiona el boton: <boton>
#    Y modifica del tipo de recurso su nombre: <nombre_final>
#    Y al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y una fila con el valor: <nombre_final>

#  Ejemplos:
#    | ventana        | boton                | nombre_inicial | nombre final    |
#    | /tipo_recursos | editar_tipo_recurso  | Licencia       | Contrato        |

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
# ESTE ES UN ESCENARIO DE LA HISTORIA DE MODIFICAR RECURSO
####################################################################################################

#Prueba de usuario
#Visualizar un tipo recurso eliminado
#  Esquema del escenario:
#    Dado que un usuario se encuentra en la ventana de: <ventana>
#    Y que selecciona un tipo de recurso con el nombre: <nombre>
#    Y presiona el boton: <boton>
#    Y confirma la operacion de eliminar el tipo de recurso
#    Cuando al regresar a la ventana: <ventana>
#    Entonces se espera ver una grilla
#    Y con ninguna fila con el valor: <nombre>

#  Ejemplos:
#    | ventana           | boton             | nombre      |
#    | /tipo_recursos   | Eliminar recurso  | Licencia    |

