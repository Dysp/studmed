class CreateCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :differentials do |t|
      t.integer :illness_id
      t.string :diff_id

      t.timestamps
    end
  end
end
