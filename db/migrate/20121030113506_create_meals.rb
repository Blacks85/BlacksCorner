class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.string :climate
      t.integer :temperature
      t.datetime :consumed

      t.timestamps
    end
  end
end
