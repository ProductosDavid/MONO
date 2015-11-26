class AddColumnasProceso < ActiveRecord::Migration
  def change
    add_column :procesos, :lunes, :integer
    add_column :procesos, :martes, :integer
    add_column :procesos, :miercoles, :integer
    add_column :procesos, :jueves, :integer
    add_column :procesos, :viernes, :integer
    add_column :procesos, :sabado, :integer
    add_column :procesos, :domingo, :integer
    add_column :procesos, :fechaini, :date
    add_column :procesos, :fechafin, :date
  end
end
