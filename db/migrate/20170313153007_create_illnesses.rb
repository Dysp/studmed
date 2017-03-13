class CreateIllnesses < ActiveRecord::Migration[5.0]
  def change
    create_table :illnesses do |t|
      t.text :etiology
      t.text :patogenesis
      t.integer :incidence
      t.integer :prevalence
      t.string :category
      t.text :anamnesis

      t.timestamps
    end
  end
end
