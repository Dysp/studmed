class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.text :medical
      t.text :surgical
      t.integer :illness_id

      t.timestamps
    end
  end
end
