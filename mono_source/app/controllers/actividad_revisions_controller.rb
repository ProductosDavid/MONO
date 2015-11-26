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
class ActividadRevisionsController < ApplicationController
  # GET /actividad_revisions
  # GET /actividad_revisionsy.json
  def index
    @actividad_revisions = ActividadRevision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividad_revisions }
    end
  end

  # GET /actividad_revisions/1
  # GET /actividad_revisions/1.json
  def show
    @actividad_revision = ActividadRevision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad_revision }
    end
  end

  # GET /actividad_revisions/new
  # GET /actividad_revisions/new.json
  def new
    @actividad_revision = ActividadRevision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad_revision }
    end
  end

  # GET /actividad_revisions/1/edit
  def edit
    @actividad_revision = ActividadRevision.find(params[:id])
  end

  # POST /actividad_revisions
  # POST /actividad_revisions.json
  def create
    @actividad_revision = ActividadRevision.new(
        :nombre => params[:revision_name],
        :tipo_recurso_id => params[:tiporec_revision],
        :actividad_id => params[:actividad_id]
    )

      if @actividad_revision.save
        redirect_to request.protocol + request.host_with_port + "/actividads/" + params[:actividad_id] + "/edit"
      else
        respond_to do |format|
          format.html { render action: "new" }
          format.json { render json: @actividad_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actividad_revisions/1
  # PUT /actividad_revisions/1.json
  def update
    @actividad_revision = ActividadRevision.find(params[:id])

    respond_to do |format|
      if @actividad_revision.update_attributes(params[:actividad_revision])
        format.html { redirect_to @actividad_revision, notice: 'Actividad revision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_revisions/1
  # DELETE /actividad_revisions/1.json
  def destroy
    @actividad_revision = ActividadRevision.find(params[:id])
    @actividad_revision.destroy

    respond_to do |format|
      format.html { redirect_to actividad_revisions_url }
      format.json { head :no_content }
    end
  end
end
