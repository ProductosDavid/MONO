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
class TipoDepositosController < ApplicationController
  # GET /tipo_depositos
  # GET /tipo_depositos.json
  before_filter :authenticate_user!

  def index
    @tipo_depositos = TipoDeposito.all.sort_by(&:created_at).reverse
    @tipo_deposito = TipoDeposito.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_depositos }
    end
  end

  # GET /tipo_depositos/1
  # GET /tipo_depositos/1.json
  def show
    @tipo_deposito = TipoDeposito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_deposito }
    end
  end

  # GET /tipo_depositos/new
  # GET /tipo_depositos/new.json
  def new
    @tipo_deposito = TipoDeposito.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_deposito }
    end
  end

  # GET /tipo_depositos/1/edit
  def edit
    @tipo_deposito = TipoDeposito.find(params[:id])
  end

  # POST /tipo_depositos
  # POST /tipo_depositos.json
  def create
    @tipo_deposito = TipoDeposito.new(params[:tipo_deposito])

    respond_to do |format|
      if @tipo_deposito.save
        format.html { redirect_to @tipo_deposito, notice: 'Tipo deposito was successfully created.' }
        format.json { render json: @tipo_deposito, status: :created, location: @tipo_deposito }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_depositos/1
  # PUT /tipo_depositos/1.json
  def update
    @tipo_deposito = TipoDeposito.find(params[:id])

    respond_to do |format|
      if @tipo_deposito.update_attributes(params[:tipo_deposito])
        format.html { redirect_to @tipo_deposito, notice: 'Tipo deposito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_depositos/1
  # DELETE /tipo_depositos/1.json
  def destroy
    @tipo_deposito = TipoDeposito.find(params[:id])
    @tipo_deposito.destroy

    respond_to do |format|
      format.html { redirect_to tipo_depositos_url }
      format.json { head :no_content }
    end
  end
end
