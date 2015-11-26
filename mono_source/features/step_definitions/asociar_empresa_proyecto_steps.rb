=begin
    MONO
    Copyright (C) 2015  Universidad de los Andes
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end
# =  Asociar Empresas a un Proyecto

####################################################################################################
# ATENCION:
# TODOS LOS ESCENARIOS ESTAS EN PENDING
# ESTO ES PORQUE TOOS LS ESCENARIOS SE REALIZAN SOBRE LA INTERFAZ COMO TAB Y VISTAS EMERGENTES
# Y PARA ESTE CASO ES REQUERIDO IMPLEMENTAR ESCENARIOS QUE CUBRAN ESTS COMPONENTES
####################################################################################################

# Escenario No. 1
Dado /^que en asociar empresas a proyectos escenario 1 gestiono un proyecto en la pagina (.*)$/ do | pagina |

  pending #visit pagina
end

Entonces /^en asociar empresas a proyectos escenario 1 que aparezca una lista de empresas y una opcion de asociar una empresa de la lista/ do

  pending #page.should have_content( asociar_recurso )
end


# Escenario No. 2
Dado /^que en asociar empresas a proyectos escenario 2 gestiono un proyecto en la pagina (.*)$/ do | pagina |

  pending #visit pagina
end

Cuando /^en asociar empresas a proyectos escenario 2 asocio una empresas (.*)$/ do | recurso |

  pending #page.should have_content( asociar_recurso )
end

Y /^en asociar empresas a proyectos escenario 2 guardo el proyecto/ do

  pending
end

Entonces /^en asociar empresas a proyectos escenario 2 se espera en guardar proyecto ver el resultado (.*)$/ do | resultado |

  pending
end
