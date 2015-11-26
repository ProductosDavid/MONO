class AddMergeCompuertaToProceso < ActiveRecord::Migration
  def change
    create_table :merge_compuerta do |t|
      t.integer :id
      t.integer :proceso_id
      t.string :ruta_id
      t.integer :plantilla_id
      t.integer :merge_id
      t.timestamps
    end
  end
end
