class AddBloodpressureToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :bloodpressuremin, :integer
    add_column :meals, :bloodpressuremax, :integer
  end
end
