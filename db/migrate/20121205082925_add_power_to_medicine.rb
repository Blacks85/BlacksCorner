class AddPowerToMedicine < ActiveRecord::Migration
  def change
    add_column :medicines, :power, :float
  end
end
