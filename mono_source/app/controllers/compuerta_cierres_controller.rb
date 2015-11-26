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
class CompuertaDesicionsController < ApplicationController
  # GET /compuerta_desicions
  # GET /compuerta_desicions.json
  def index
    @compuerta_cierres = CompuertaDesicion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compuerta_cierres }
    end
  end

  # POST /compuerta_desicions
  # POST /compuerta_desicions.json
  def create
    @compuerta_cierre = CompuertaDesicion.new(params[:compuerta_cierre])

    respond_to do |format|
      if @compuerta_cierre.save
        format.html { redirect_to @compuerta_cierre, notice: 'Compuerta desicion was successfully created.' }
        format.json { render json: @compuerta_cierre, status: :created, location: @compuerta_cierre }
      else
        format.html { render action: "new" }
        format.json { render json: @compuerta_cierre.errors, status: :unprocessable_entity }
      end
    end
  end

end
