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
class OrganizacionsController < ApplicationController
  # GET /organizacions
  # GET /organizacions.json
  before_filter :authenticate_user!

  def index
    @organizacions = Organizacion.all.sort_by(&:created_at).reverse
    @organizacion=Organizacion.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizacions }
    end
  end

  # GET /organizacions/1
  # GET /organizacions/1.json
  def show
    @organizacion = Organizacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organizacion }
    end
  end

  # GET /organizacions/new
  # GET /organizacions/new.json
  def new
    @organizacion = Organizacion.new
    @usuario = Usuario.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organizacion }
    end
  end

  # GET /organizacions/1/edit
  def edit
    @organizacion = Organizacion.find(params[:id])
  end

  # POST /organizacions
  # POST /organizacions.json
  def create
    _id = params[:idTart]

    if _id > "0"
      #En caso de que llegue el id de empresa con datos
      update
    else
      _data_usr = params[:usuario]
      _data_org = params[:organizacion]
      _usuario_opcion = params[:usuario_opcion]

      respond_to do |format|
        @organizacion = Organizacion.new(_data_org)
        if @organizacion.save

          if(_usuario_opcion == "0")
            create_representante @organizacion.id, _data_usr
          end

          @organizacion = Organizacion.new
          @organizacions = Organizacion.all.reverse
          @message = t('datos_guardados')


          format.html { render action: "index" }
          format.json { render json: @organizacion }

          #format.html { redirect_to @organizacion, notice: 'Organizacion was successfully created.' }
          #format.json { render json: @organizacion, status: :created, location: @organizacion }
        else
          format.html { render action: "new" }
          format.json { render json: @organizacion.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def create_representante organizacion_id, data

    @usuario = Usuario.new(data)

    _data_usr = Hash.new
    _data_usr[:email] = data[:email]
    _data_usr[:password] = data[:password]

    @user = User.new(_data_usr)
    @usuario.habilitado = 1
    @usuario.organizacion_id=organizacion_id

      if @usuario.save!

        @user.id = @usuario.id
        @user.save!

        cont = 1;

        while cont < 4
          @user_rol = RolesUsers.new(
              :user_id => @user.id,
              :role_id => cont
          )
          @user_rol.save!
          cont = cont + 1
        end

        # Rol de administrador
        #@user_rol = RolesUsers.new(
        #    :user_id => @user.id,
        #    :role_id => 1
        #)

        #@user_rol.save!

        begin
          _url = ENV['root_razuna_api'] + "global/api2/user.cfc?method=add&api_key=" + ENV['admindavid_razuna_key'] +
              "&user_first_name="+ URI::encode(@usuario.nombre) +
              "&user_last_name="+ URI::encode(@usuario.apellidos) +
              "&user_email="+ URI::encode(@usuario.email) +
              "&user_name=" + URI::encode(@usuario.email) +
              "&user_pass="+ URI::encode(@usuario.password) +
              "&user_active=T"

          @wddx = WDDX.load(open(_url))
        rescue
        end
      end
  end

  # PUT /organizacions/1
  # PUT /organizacions/1.json
  def update
    @organizacion = Organizacion.find(params[:idTart])
    respond_to do |format|
      if @organizacion.update_attributes(params[:organizacion])
        @message = t('datos_guardados')
        @organizacions = Organizacion.all.sort_by(&:created_at).reverse
        format.html { render action: "index" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizacions/1
  # DELETE /organizacions/1.json
  def destroy
    @organizacion = Organizacion.find(params[:id])
    @organizacion.destroy

    respond_to do |format|
      format.html { redirect_to organizacions_url }
      format.json { head :no_content }
    end
  end
  
	# ===  Accion existe
	# Determina si existe una organizacion de acuerdo a un nombre
	def existe
	  @organizacion = Organizacion.find_by_nombre(params[:nombre])
	  if(@organizacion)
		render :text => "true"
	  else
		render :text => "false"
	  end
	end 
	
	# ===  Accion existe
	# Determina si existe una organizacion de acuerdo a un nit
	def existenit
	  @organizacion = Organizacion.find_by_nit(params[:nit])
	  if(@organizacion)
		render :text => "true"
	  else
		render :text => "false"
	  end
  end

  # ===  Accion existe
  # Determina si existe un representante con el email dado
  def existerepresentante
    @user = Usuario.find_by_email(params[:representante])
    if(@user)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  # ===  Accion existe
  # Determina si existe un representante con el email dado
  def unicorepresentante
    @user = Organizacion.find_by_representante(params[:representante])
    if(@user)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  def get_organizacion
    _id = params[:id]
    _organizacion = Organizacion.find(_id);
    #Busca administrador organizacion
    _usuarios = Usuario.find_all_by_organizacion_id(_id);
    _idsUs = RolesUsers.where("role_id = 1");
    _usuarioSel = "";
    _validaUs = false;

    _usuarios.each do |unUsuario|
      _idsUs.each do |unRolUs|
        if unUsuario.id == unRolUs.user_id
          _usuarioSel = unUsuario;
          _validaUs = true;
          break
        end
      end
      if _validaUs
        break
      end
    end

    @result = Hash.new

    @result[:nombre] = _organizacion.nombre;
    @result[:nit] = _organizacion.nit;
    @result[:tipo_organizacion_id] = _organizacion.tipo_organizacion_id;
    @result[:descripcion] = _organizacion.descripcion;
    @result[:nombre_manager] = _usuarioSel.nombre;
    @result[:apellidos_manager] = _usuarioSel.apellidos;
    @result[:email_manager] = _usuarioSel.email;
    @result[:tipo_recurso_id] = _usuarioSel.tipo_recurso_id;

    render :json => @result
  end
end
