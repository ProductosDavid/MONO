class AddHabilitadoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :habilitado, :bit
  end
end
