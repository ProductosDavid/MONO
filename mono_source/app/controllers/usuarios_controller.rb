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
class UsuariosController < ApplicationController

  #before_filter :authenticate_user!

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse
    @usuariosd = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse
    @usuario = Usuario.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    if  params[:idTart] != '' then
      _userId = params[:idTart]
      @usuario = Usuario.find(params[:idTart])
      @user = User.find(params[:idTart])

      respond_to do |format|
        if @usuario.update_attributes(params[:usuario])
          _data_usr = Hash.new
          _data_usr[:email] = @usuario.email
          _data_usr[:password] = @usuario.password
          @user.update_attributes(_data_usr)
          RolesUsers.where(user_id: _userId).delete_all

          #params[:roles].each do |rol|
          #  rol1 = RolesUsers.new(:role_id => rol, :user_id => @usuario.id)
          #  rol1.save!
          #end

          begin
            rolAdm = false
            params[:roles].each do |rol|
              if rol == '1'
                rolAdm = true
              end
            end
            # Rol administrador
            if rolAdm
              cont = 1
              while cont < 4
                rol1 = RolesUsers.new(:role_id => cont, :user_id => @usuario.id)
                rol1.save!
                cont = cont + 1
              end
            else
              # Rol director
              cont = 2
              while cont < 4
                rol1 = RolesUsers.new(:role_id => cont, :user_id => @usuario.id)
                rol1.save!
                cont = cont + 1
              end
            end
          rescue
            # Rol trabajador
            rol1 = RolesUsers.new(:role_id => 3, :user_id => @usuario.id)
            rol1.save!
          end

          @usuario = Usuario.new
          @usuarios = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse
          @usuariosd = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse

          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @usuarios }
        else
          format.html { render action: "new" }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    else
      @usuario = Usuario.new(params[:usuario])
      @usuario.habilitado = 1
      @usuario.organizacion_id=Usuario.find_by_id(current_user.id).organizacion_id

      _data_usr = Hash.new
      _data_usr[:email] = @usuario.email
      _data_usr[:password] = @usuario.password

      @user=User.new(_data_usr)

      respond_to do |format|
        if @usuario.save!
          @user.id = @usuario.id
          @user.save!

          #params[:roles].each do |rol|
          #  rol1 = RolesUsers.new(:role_id => rol, :user_id => @usuario.id)
          #  rol1.save!
          #end

          begin
            rolAdm = false
            params[:roles].each do |rol|
              if rol == '1'
                rolAdm = true
              end
            end
            # Rol administrador
            if rolAdm
              cont = 1
              while cont < 4
                rol1 = RolesUsers.new(:role_id => cont, :user_id => @usuario.id)
                rol1.save!
                cont = cont + 1
              end
            else
              # Rol director
              cont = 2
              while cont < 4
                rol1 = RolesUsers.new(:role_id => cont, :user_id => @usuario.id)
                rol1.save!
                cont = cont + 1
              end
            end
          rescue
            # Rol trabajador
            rol1 = RolesUsers.new(:role_id => 3, :user_id => @usuario.id)
            rol1.save!
          end

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

          @usuario = Usuario.new
          @usuarios = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse
          @usuariosd = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse

          @message = t('datos_guardados')
          format.html { render action: "index" }
          format.json { render json: @usuario }
        else
          format.html { render action: "new" }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def deshabilitar
    if  params[:idTartE] != '' then
      @usuario = Usuario.find(params[:idTartE])

      _data_usu = Hash.new

      if (@usuario.habilitado == "\x01" ? true : false)
          _data_usu[:habilitado] = 0
      else
        _data_usu[:habilitado] = 1
      end

      respond_to do |format|
        if @usuario.update_attributes(_data_usu)
          @usuario = Usuario.new
          @usuarios = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse
          @usuariosd = Usuario.where(:organizacion_id => Usuario.find_by_id(current_user.id).organizacion_id).all.reverse

          @message = t('datos_deshabilitados')
          format.html { redirect_to request.protocol + request.host_with_port + "/usuarios?locale=es"}
          #format.html { render action: "index" }
          #format.json { render json: @usuarios }
        else
          format.html { render action: "new" }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def deshabilitarg
    if  params[:idTartE] != '' then
      @usuario = Usuario.find(params[:idTartE])

      _data_usu = Hash.new

      if (@usuario.habilitado == "\x01" ? true : false)
        _data_usu[:habilitado] = 0
      else
        _data_usu[:habilitado] = 1
      end

      if @usuario.update_attributes(_data_usu)
        render :text => "true"
      else
        render :text => "false"
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  # ===  Accion existe
  # Determina si existe un login de usuario
  # * GET /usuarios/existe/login
  def existe
    @usuario = Usuario.find_by_email(params[:nombre])
    if(@usuario)
      render :text => "true"
    else
      render :text => "false"
    end
  end

  # ===  Accion password son iguales
  def password_iguales
    if(params[:password] == params[:password_confirm])
      render :text => "false"
    else
      render :text => "true"
    end
  end

  def get_usuario
    _id = params[:id]
    _usuario = Usuario.find(_id);
    _user = User.find(_id);
    _rol1 = RolesUsers.where(role_id: 1, user_id: _id).exists?;
    _rol2 = RolesUsers.where(role_id: 2, user_id: _id).exists?;
    _rol3 = RolesUsers.where(role_id: 3, user_id: _id).exists?;

    @result = Hash.new

    @result[:nombre] = _usuario.nombre;
    @result[:apellidos] = _usuario.apellidos;
    @result[:email] = _usuario.email;
    @result[:password] = _usuario.password;
    @result[:tipo_recurso_id] = _usuario.tipo_recurso_id;
    @result[:costo] = _usuario.costo;
    @result[:rol1] = _rol1;
    @result[:rol2] = _rol2;
    @result[:rol3] = _rol3;


    render :json => @result
  end

end

