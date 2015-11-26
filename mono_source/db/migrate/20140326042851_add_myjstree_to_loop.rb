class AddMyjstreeToLoop < ActiveRecord::Migration
  def change
    add_column :loops, :my_js_tree_id, :integer
  end
end
