class AddStatusToMealfoods < ActiveRecord::Migration
  def change
    change_column :foods_meals, :updated_at, :datetime, :null => true, :default => nil
    change_column :meals_medicines, :created_at, :datetime, :null => true, :default => nil
    change_column :meals_medicines, :updated_at, :datetime, :null => true, :default => nil
    change_column :meals_symptons, :created_at, :datetime, :null => true, :default => nil
    change_column :meals_symptons, :updated_at, :datetime, :null => true, :default => nil
  end
end
