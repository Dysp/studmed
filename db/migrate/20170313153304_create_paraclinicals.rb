class CreateParaclinicals < ActiveRecord::Migration[5.0]
  def change
    create_table :paraclinicals do |t|
      t.string :biopsy
      t.boolean :lfu
      t.boolean :ekg
      t.integer :illness_id

      t.timestamps
    end
  end
end
