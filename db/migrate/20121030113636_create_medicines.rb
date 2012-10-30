class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :description

      t.timestamps
    end
  end
end
