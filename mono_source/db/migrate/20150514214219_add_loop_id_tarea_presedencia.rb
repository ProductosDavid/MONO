class AddLoopIdTareaPresedencia < ActiveRecord::Migration
  def change
    add_column :tarea_presedencia, :loop_id, :integer
  end
end
