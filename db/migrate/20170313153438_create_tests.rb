class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.integer :paraclinical_id
      t.boolean :xray
      t.text :xray_finding

      t.timestamps
    end
  end
end
