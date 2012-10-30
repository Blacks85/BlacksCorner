class AddStatusToMealsfoods < ActiveRecord::Migration
  def change
    change_column :foods_meals, :created_at, :datetime, :null => true, :default => nil
  end
end
