class AddParaclinicalToIllness < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :paraclinical, :text
  end
end
