class RemoveTypeFromMeals < ActiveRecord::Migration
  def up
    remove_column :meals, :type
  end

  def down
    add_column :meals, :type, :string
  end
end
