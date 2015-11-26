class AddHabilitadoToRecurso < ActiveRecord::Migration
  def change
    add_column :recursos, :habilitado, :bit
  end
end