class CreateFestivos < ActiveRecord::Migration
  def change
    create_table :festivos do |t|
      t.integer :dia
      t.integer :mes
      t.string :descripcion
    end
  end
end
