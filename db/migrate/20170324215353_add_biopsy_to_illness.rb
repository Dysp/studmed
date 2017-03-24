class AddBiopsyToIllness < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :biopsy, :text
  end
end
