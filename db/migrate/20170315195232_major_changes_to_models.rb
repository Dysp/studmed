class MajorChangesToModels < ActiveRecord::Migration[5.0]
  def change
    rename_column :illnesses, :etiology, :etio_and_pato
    remove_column :illnesses, :patogenesis
    change_column :illnesses, :incidence, :string
    remove_column :illnesses, :prevalence
    remove_column :illnesses, :anamnesis

    add_column :clinicals, :anamnesis, :string

    change_column :paraclinicals, :lfu, :string
    change_column :paraclinicals, :ekg, :string
  end
end
