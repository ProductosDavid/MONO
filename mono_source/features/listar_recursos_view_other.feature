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
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/es/features/adicion.feature
# Updated: Tue May 25 15:51:46 +0200 2010
Característica: Listar Recursos
    Como usuario que gestiona recursos
    Yo quiero consultar una lista de de recursos
    De forma que vea qué recursos existen

  Esquema del escenario: Listar recursos
    Dado que en recursos desde otra vista antes he introducido <recurso_1>
    Y en recursos desde otra vista estoy en la vista <pagina>
    Y en recursos desde otra vista introduzco la vista /recursos
    Entonces se espera en recursos desde otra vista ver <resultado1>

  Ejemplos:
    | pagina | recurso_1 | resultado1 |
    | /archivos | iMac | iMac |
