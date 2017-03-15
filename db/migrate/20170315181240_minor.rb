class Minor < ActiveRecord::Migration[5.0]
  def change
    rename_column :tests, :pet_mri_indication, :pet_mri
  end
end
