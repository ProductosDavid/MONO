class AddRutaIdTareaPresendencia < ActiveRecord::Migration

  def change
    add_column :tarea_presedencia, :ruta_id, :integer
  end
end
