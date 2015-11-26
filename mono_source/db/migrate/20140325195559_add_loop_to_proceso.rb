class AddLoopToProceso < ActiveRecord::Migration
  def change
    create_table :loops do |t|
      t.integer :id
      t.string :nombre
      t.integer :compuerta_id
      t.integer :actividad_id
      t.integer :proceso_id
      t.integer :plantilla_id

      t.timestamps
      end
  end
end
