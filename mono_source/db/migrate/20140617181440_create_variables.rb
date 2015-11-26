class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :nombre
      t.string :valor

      t.timestamps
    end
  end
end
