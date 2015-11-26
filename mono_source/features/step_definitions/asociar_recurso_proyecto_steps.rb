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
# =  Asociar Recursos a un Proyecto

####################################################################################################
# ATENCION:
# TODOS LOS ESCENARIOS ESTAS EN PENDING
# ESTO ES PORQUE TOOS LS ESCENARIOS SE REALIZAN SOBRE LA INTERFAZ COMO TAB Y VISTAS EMERGENTES
# Y PARA ESTE CASO ES REQUERIDO IMPLEMENTAR ESCENARIOS QUE CUBRAN ESTS COMPONENTES
####################################################################################################

# Escenario No. 1
Dado /^que en asociar recursos a proyectos escenario 1 gestiono un proyecto en la pagina (.*)$/ do | pagina |

  pending #visit pagina
end

Entonces /^en asociar recursos a proyectos escenario 1 que aparezca una lista de recursos y una opcion de asociar un recurso de la lista/ do

  pending #page.should have_content( asociar_recurso )
end


# Escenario No. 2
Dado /^que en asociar recursos a proyectos escenario 2 gestiono un proyecto en la pagina (.*)$/ do | pagina |

  pending #visit pagina
end

Cuando /^en asociar recursos a proyectos escenario 2 asocio un recurso (.*)$/ do | recurso |

  pending #page.should have_content( asociar_recurso )
end

Y /^en asociar recursos a proyectos escenario 2 guardo el proyecto/ do

  pending
end

Entonces /^en asociar recursos a proyectos escenario 2 se espera en guardar proyecto ver el resultado (.*)$/ do | resultado |

  pending
end

Dado /^que existe un proyecto con nombre (.*) descripcion (.*) perteneciente a una determinada empresa$/ do | nombreproyecto, descripcion |
  @proyecto = Proyecto.new(
      :nombre => nombreproyecto,
      :descripcion => descripcion
  )
  @proyecto.organizacion_id = 25
  @proyecto.save!
end

Cuando /^creo dos recursos uno con nombre (.*) costo (.*) unidades (.*) y el otro con nombre (.*) costo (.*) y unidades (.*)$/ do | nomrec1, cosrec1, unirec1, nomrec2, cosrec2, unirec2 |
  @recurso1 = Recurso.new(
      :nombre => nomrec1,
      :tipo_recurso_id => 42,
      :costo => cosrec1,
      :unidades => unirec1
  )
  @recurso1.organizacion_id = 24
  @recurso1.save!

  @recurso2 = Recurso.new(
      :nombre => nomrec2,
      :tipo_recurso_id => 43,
      :costo => cosrec2,
      :unidades => unirec2
  )
  @recurso2.organizacion_id = 24
  @recurso2.save!
end

Entonces /^se espera que se puedan asociar esos dos recursos al proyecto con un resultado (.*)$/ do | resultado |
  @proyectorecurso1 = ProyectoRecurso.new(
      :proyecto_id => @proyecto.id,
      :recurso_id => @recurso1.id
  )

  if (@proyectorecurso1.save())
    @resultado1 = "OK"
  else
    @resultado1 = "KO"
  end

  @proyectorecurso2 = ProyectoRecurso.new(
      :proyecto_id => @proyecto.id,
      :recurso_id => @recurso2.id
  )

  if (@proyectorecurso2.save())
    @resultado2 = "OK"
  else
    @resultado2 = "KO"
  end

  if (@resultado1 != resultado or @resultado2 != resultado)
    raise("Fallo")
  end
end
