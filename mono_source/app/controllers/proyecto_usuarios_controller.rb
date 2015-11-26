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
class ProyectoUsuariosController < ApplicationController
  # GET /proyecto_usuarios
  # GET /proyecto_usuarios.json
  before_filter :authenticate_user!

  def index
    @proyecto_usuarios = ProyectoUsuario.all

    @proyecto_usuario = ProyectoUsuario.new

    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proyecto_usuarios }
    end
  end

  # GET /proyecto_usuarios/1
  # GET /proyecto_usuarios/1.json
  def show
    @proyecto_usuario = ProyectoUsuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proyecto_usuario }
    end
  end

  # GET /proyecto_usuarios/new
  # GET /proyecto_usuarios/new.json
  def new
    @proyecto_usuario = ProyectoUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proyecto_usuario }
    end
  end

  # GET /proyecto_usuarios/1/edit
  def edit
    @proyecto_usuario = ProyectoUsuario.find(params[:id])
  end

  # POST /proyecto_usuarios
  # POST /proyecto_usuarios.json
  def create
    @proyecto_usuario = ProyectoUsuario.new(params[:proyecto_usuario])

    respond_to do |format|
      if @proyecto_usuario.save
        format.html { redirect_to @proyecto_usuario, notice: 'Proyecto usuario was successfully created.' }
        format.json { render json: @proyecto_usuario, status: :created, location: @proyecto_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @proyecto_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proyecto_usuarios/1
  # PUT /proyecto_usuarios/1.json
  def update
    @proyecto_usuario = ProyectoUsuario.find(params[:id])

    respond_to do |format|
      if @proyecto_usuario.update_attributes(params[:proyecto_usuario])
        format.html { redirect_to @proyecto_usuario, notice: 'Proyecto usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proyecto_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_usuarios/1
  # DELETE /proyecto_usuarios/1.json
  def destroy
    @proyecto_usuario = ProyectoUsuario.find(params[:id])
    @proyecto_usuario.destroy

    respond_to do |format|
      format.html { redirect_to proyecto_usuarios_url }
      format.json { head :no_content }
    end
  end
end
