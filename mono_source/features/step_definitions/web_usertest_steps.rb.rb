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
# = Implementacion de pasos genericos para pruebas de usario

# Al abrir la pagina segun la url enviada
Dado /^que un usuario se encuentra en la ventana de: (.*)$/ do |ventana|
  visit ventana
end

# Al regresar a una pagina segun la url enviada
Cuando /^al regresar a la ventana: (.*)$/ do |ventana|
  visit ventana
end

# Al hacer click sobre un boton con el id enviado
Cuando /^presiona el boton: (.*)$/ do |boton|
  #click_on boton
end

# Buscar informacion en la pagina
Entonces /^se espera que se abra una ventana con la siguiente informacion: (.*)$/ do |info|
  page.should have_content info
end

# Cuando diligencia un campo con el id enviado
Cuando /^ha diligenciado el campo ([^"]*) con la informacion: ([^"]*)$/ do |elemento, texto|
    fill_in elemento, with: texto
end

# Cuando selecciona del campo con el id enviado la opcion solicitada
Cuando /^ha seleccionado del campo ([^"]*) la opcion: ([^"]*)$/ do |elemento, opcion|
    select opcion, from: elemento
end

# Cuando da click sobre un link con el id envidado
Cuando /^da click en el boton: (.*)$/ do |boton|
  click_on boton
end

# Buscar informacion en la pagina
Entonces /^se espera que se muestre una ventana con la siguiente informacion: (.*)$/ do |info|
  #page.should have_content info
end

# Buscar una fila en una grilla con el valor
Entonces /^una fila con el valor: (.*)$/ do |valor|
  page.should have_content valor
end

# Buscar una columna con el titulo enviado
Entonces /^que tiene una columna: (.*)$/ do |titulo|
  page.should have_content titulo
end

# Buscar un boton o link con el texto enviado
Entonces /^con una opcion: (.*)$/ do |opcion|
  page.should have_content opcion
end

# Ninguna fila con el valor
Entonces /^con ninguna fila con el valor: (.*)$/ do |valor|
  page.should have_no_content valor
end

# Se observa una grilla con informacion
Entonces /^se espera ver una grilla$/ do
  
end

