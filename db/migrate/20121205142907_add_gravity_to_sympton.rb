class AddGravityToSympton < ActiveRecord::Migration
  def change
    add_column :symptons, :gravity, :integer
  end
end
