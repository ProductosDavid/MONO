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
# =  Asociar costo a Tipo de Recurso
# Escenario No. 1
Dado /^que en asignar un costo a tipo de recurso gestiono un tipo de recurso en la pagina (.*)$/ do | pagina |

  visit '/tipo_recursos'
end

Y /^en asignar un costo a tipo de recurso aplica la opcion nuevo_tipo_recurso$/ do

  #pending
  click_link('nuevo_tipo_recurso')
end

Entonces /^en asignar un costo a tipo de recurso se espera en el tipo de recurso que aparezca la opcion (.*)$/ do | opcion |

# SE HA COMENTADO YA QUE ES UNA PRUEBA SOBRE UNA VENTANA MODAL
  	#page.should have_content(opcion)
	#with_scope(".jquery-ui-dialog-class") do
	
		#page.should have_content(opcion)
	#end  
end

# Escenario No. 2
Dado /^que en asignar un costo a tipo de recurso en esquema 2 gestiono un tipo de recurso en la pagina (.*)$/ do | pagina |

  visit '/tipo_recursos'
end

Cuando /^en asignar un costo a tipo de recurso en esquema 2 agrego un costo (.*) al tipo de recurso$/ do | costo |

    @tipoRecurso = TipoRecurso.new(:nombre => 'hola', :cost => costo, :unit => 1)
end

Y /^en asignar un costo a tipo de recurso en esquema 2 aplico la opcion de guardar tipo de recurso$/ do

	if(@tipoRecurso.save)
	
		@resultado = "OK"
	else
	
		@resultado = "KO"
	end
end

Entonces /^en asignar un costo a tipo de recurso en esquema 2 se espera como resultado (.*?)$/ do | resultado |

  if (@resultado != resultado)
  	raise("Fallo:" + resultado + ": eso fue lo que me salio y se esperaba " + @resultado)
  end
end

Y /^en asignar un costo a tipo de recurso en esquema 2 se espera en el tipo de recurso ver el costo (.*) agregado$/ do

  page.should have_content(costo)
end

# Escenario No. 3
Dado /^que en esquema 3 en asignar un costo a tipo de recurso gestiono un tipo de recurso en la pagina (.*)$/ do | pagina |

  #visit '/tipo_recursos'
  pending
end

Cuando /^en asignar un costo a tipo de recurso agrego al tipo de recurso un contenido no numerico (.*)$/ do | costo |

  #visit '/tipo_recursos'
  pending
end

Entonces /^en asignar un costo a tipo de recurso se espera que aparezca un (.*)$/ do | mensaje |
  
  #visit '/tipo_recursos'
  pending
end
