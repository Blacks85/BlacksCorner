class CreateMealsMedicines < ActiveRecord::Migration
  def change
    create_table :meals_medicines do |t|
      t.integer :meal_id
      t.integer :medicine_id

      t.timestamps
    end
  end
end
