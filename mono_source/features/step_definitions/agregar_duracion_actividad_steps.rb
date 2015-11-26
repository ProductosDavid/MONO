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
# =  HU_TP_Asociar Duracion a una Actividad

# Escenario No. 1
Dado /^que en agregar duracion a una actividad gestiono una actividad en la pagina <pagina>$/ do | pagina |

  pending
end

Entonces /^en agregar duracion a una actividad se espera en la actividad que aparezca la opcion <opcion>$/ do | pagina |

  pending
end

# Escenario No. 2
Dado /^que en esquema 2 en agregar duracion a una actividad gestiono una actividad en la pagina (.*)$/ do | pagina |

  #@actividad = Actividad.find(1)
  pending
end

Cuando /^en agregar duracion a una actividad agrego una duracion (.*) a la actividad/ do | pagina |

  pending
end

Y /^en agregar duracion a una actividad aplico la opcion de guardar actividad/ do

  pending
end

Entonces /^en agregar duracion a una actividad se espera en la actividad ver la duracion (.*) agregada/ do | duracion |

  pending
end


# Escenario No. 3
Dado /^que en esquema 3 en agregar duracion a una actividad gestiono una actividad en la pagina (.*)/ do | pagina |

  pending
end

Cuando /^en agregar duracion a una actividad agrego a la actividad un contenido no numerico (.*)/ do | duracion |

  pending
end

Entonces /^en agregar duracion a una actividad se espera que aparezca un (.*)/ do | mensaje |

  pending
end

