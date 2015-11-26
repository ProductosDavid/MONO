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
class TransicionsController < ApplicationController
  # GET /transicions
  # GET /transicions.json
  before_filter :authenticate_user!

  def index
    @transicions = Transicion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transicions }
    end
  end

  # GET /transicions/1
  # GET /transicions/1.json
  def show
    @transicion = Transicion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transicion }
    end
  end

  # GET /transicions/new
  # GET /transicions/new.json
  def new
    @transicion = Transicion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transicion }
    end
  end

  # GET /transicions/1/edit
  def edit
    @transicion = Transicion.find(params[:id])
  end

  # POST /transicions
  # POST /transicions.json
  def create
    @transicion = Transicion.new(params[:transicion])

    respond_to do |format|
      if @transicion.save
        format.html { redirect_to @transicion, notice: 'Transicion was successfully created.' }
        format.json { render json: @transicion, status: :created, location: @transicion }
      else
        format.html { render action: "new" }
        format.json { render json: @transicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transicions/1
  # PUT /transicions/1.json
  def update
    @transicion = Transicion.find(params[:id])

    respond_to do |format|
      if @transicion.update_attributes(params[:transicion])
        format.html { redirect_to @transicion, notice: 'Transicion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicions/1
  # DELETE /transicions/1.json
  def destroy
    @transicion = Transicion.find(params[:id])
    @transicion.destroy

    respond_to do |format|
      format.html { redirect_to transicions_url }
      format.json { head :no_content }
    end
  end
end
