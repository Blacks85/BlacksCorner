class CreateSymptons < ActiveRecord::Migration
  def change
    create_table :symptons do |t|
      t.string :description

      t.timestamps
    end
  end
end
