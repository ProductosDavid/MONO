module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @tipo_organizacionMaster = FactoryGirl.create(:tipo_organizacion)
      @organizacionMaster = FactoryGirl.create(:organizacion, tipo_organizacion_id: @tipo_organizacionMaster.id)
      @tipo_recursoMaster = FactoryGirl.create(:tipo_recurso, unit: "1")
      @usuario = FactoryGirl.create(:usuario, tipo_recurso_id: @tipo_recursoMaster.id, organizacion_id: @organizacionMaster.id, habilitado: 0)
      user = FactoryGirl.create(:user, id: @usuario.id)

      roles = Role.new(:name => "nivel_1")
      roles.id = "1"
      roles.save!
      rolesUser = RolesUsers.new(:role_id => "1", :user_id => @usuario.id)
      rolesUser.save!

      user.reload
      sign_in user
    end
  end
end