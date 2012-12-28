class RemoveClimateFromMeals < ActiveRecord::Migration
  def up
    remove_column :meals, :climate
  end

  def down
    add_column :meals, :climate, :string
  end
end
