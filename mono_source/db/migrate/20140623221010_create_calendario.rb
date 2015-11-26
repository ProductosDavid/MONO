class CreateCalendario < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
      t.integer :id
      t.date :fecha
      t.string :dia
      t.integer :horas
      t.integer :proceso_id
      t.timestamps
    end
  end
end
