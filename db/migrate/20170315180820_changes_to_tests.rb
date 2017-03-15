class ChangesToTests < ActiveRecord::Migration[5.0]
  def change
    remove_column :tests, :xray_indication
    remove_column :tests, :mri_indication
    remove_column :tests, :ct_indication
    remove_column :tests, :pet_indication
    remove_column :tests, :pet_mri
    remove_column :tests, :ultrasound_indication

    change_column :tests, :xray, :string
    change_column :tests, :mri, :string
    change_column :tests, :ct, :string
    change_column :tests, :pet, :string
    change_column :tests, :ultrasound, :string
  end
end
