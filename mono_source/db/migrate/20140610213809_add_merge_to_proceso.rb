class AddMergeToProceso < ActiveRecord::Migration
  def change
    create_table :merges do |t|
      t.integer :id
      t.string :nombre
      t.integer :proceso_id
      t.integer :plantilla_id
      t.integer :my_js_tree_id
      t.timestamps
    end
  end
end
