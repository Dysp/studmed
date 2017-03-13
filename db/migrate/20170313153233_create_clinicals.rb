class CreateClinicals < ActiveRecord::Migration[5.0]
  def change
    create_table :clinicals do |t|
      t.text :inspection
      t.text :palpation
      t.text :percussion
      t.text :auscultation
      t.integer :illness_id

      t.timestamps
    end
  end
end
