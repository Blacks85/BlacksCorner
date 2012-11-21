class AddFeciToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :feci, :string
  end
end
