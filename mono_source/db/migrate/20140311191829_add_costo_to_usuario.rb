class AddCostoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :costo, :integer
  end
end
