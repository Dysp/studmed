class CreateBloodsamples < ActiveRecord::Migration[5.0]
  def change
    create_table :bloodsamples do |t|
      t.integer :paraclinical_id
      t.boolean :creatinine
      t.string :creatinine_value

      t.timestamps
    end
  end
end
