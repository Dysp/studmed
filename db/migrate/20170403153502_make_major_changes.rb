class MakeMajorChanges < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :diagnosis, :text
    add_column :illnesses, :treatment, :text
    add_column :illnesses, :prognosis, :text

    remove_column :clinicals, :inspection
    remove_column :clinicals, :palpation
    remove_column :clinicals, :percussion
    remove_column :clinicals, :auscultation
    remove_column :clinicals, :anamnesis

    add_column :clinicals, :other, :string
    add_column :clinicals, :endoscopy, :string
    add_column :clinicals, :symptoms, :string
  end
end
