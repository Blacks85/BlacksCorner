class CreateMealsSymptons < ActiveRecord::Migration
  def change
    create_table :meals_symptons do |t|
      t.integer :meal_id
      t.integer :sympton_id

      t.timestamps
    end
  end
end
