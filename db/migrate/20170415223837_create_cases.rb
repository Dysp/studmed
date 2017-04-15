class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.text :content

      t.timestamps
    end
  end
end
