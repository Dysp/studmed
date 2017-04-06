class MajorChanges < ActiveRecord::Migration[5.0]
  def change
    drop_table :tests
    remove_column :illnesses, :blood_sample
    remove_column :illnesses, :biopsy
    remove_column :illnesses, :diagnosis
    remove_column :illnesses, :prognosis
    add_column :illnesses, :symptoms, :text
    drop_table :clinicals
  end
end
