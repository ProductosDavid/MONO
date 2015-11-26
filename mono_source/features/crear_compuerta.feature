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
# =  HU_TP_Crear una Compuerta
Característica: Compuerta
Como usuario que gestiona procesos
quiero crear una compuerta
de forma que un nombre, una descripción, un tipo de compuerta y un tipo de decision

####################################################################################################
# TODO: VERIFICAR ESTE ESCENARIO
#
# AL PERSISTIR LA COMPUERTA DESDE LA PRUEBA NO GENERA OK AUNQUE LA INFORMACION Y EL MODELO ESTAN OK
# OK DESDE LA INTERFAZ
# OK DESDE SQL 
#
# DESCONTINUADO POR
# Sprint 6: Historia Diseñar árbol de flujo de procesos, 
# 
####################################################################################################

# Creacion de compuertas
  Esquema del escenario: 
    Dado que en crear una compuerta creo una compuerta con nombre <nombre> descripcion <descripcion> tipo de compuerta <tipo_compuerta> y tipo de decision <tipo_decision>
    Cuando en crear una compuerta se guarde la compuerta
    Entonces en crear una compuerta se espera ver <resultado>
 
  Ejemplos:
    | nombre | descripcion | tipo_compuerta | tipo_decision | resultado |
    | compuerta_1 | esta es la compuerta_ 1 | 1 | 1 | OK |
    | compuerta_2 | | 1 | 1 | OK |
    | | esta es la compuerta_3 | 1 | 1 | KO |
    | compuerta_4 | esta es la compuerta_4 | 1 | 1 | OK |
    | compuerta_3 | esta es la compuerta_3 | 1 | 1 | OK |

    # Compuerta OK
    # Compuerta OK sin descripcion
    # Compuerta SIN NOMBRE
    # Compuerta REPETIDA
    # Compuerta OK

# Escenario No. 2
  Esquema del escenario:
    Dado que a un proceso conn nombre <nombreproc> tipo de plantilla <tipo_plantilla> descripcion <descripcionproc>
    Cuando se le asocian dos compuertas una con nombre <nomcom1> tipo <tipocom1> plantilla id <plancom1> y otra con nombre <nomcom2> tipo <tipocom2> plantilla id <plancom2>
    Entonces se espera que se creen las compuertas asociadas al proceso con un resultado <resultado>

  Ejemplos:
    | nombreproc | tipo_plantilla | descripcionproc | nomcom1 | tipocom1 | plancom1 | nomcom2 | tipocom2 | plancom2 | resultado |
    | desarrollo creativo | 25 | desarrollo corto | existe desarrollo? | 2 | 25 | elaborar | 3 | 25 | OK |
    | script videojuegos | 25 | argumento y perfil | aprobar | 3 | 25 | es correcto? | 2 | 25 | OK |
    | desarrollo personal | 25 | videos control | consultar | 3 | 25 | enviar | 3 | 25 | OK |
