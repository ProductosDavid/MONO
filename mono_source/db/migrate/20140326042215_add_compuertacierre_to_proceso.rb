class AddCompuertacierreToProceso < ActiveRecord::Migration
  def change
    create_table :compuerta_cierres do |t|
      t.integer :id
      t.string :nombre
      t.integer :tipo
      t.integer :my_js_tree_id
      t.integer :proceso_id
      t.integer :plantilla_id

      t.timestamps
    end
  end
end
