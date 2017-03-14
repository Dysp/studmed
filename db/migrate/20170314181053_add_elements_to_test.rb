class AddElementsToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :mri, :boolean
    add_column :tests, :mri_indication, :string

    add_column :tests, :ct, :boolean
    add_column :tests, :ct_indication, :string

    add_column :tests, :pet, :boolean
    add_column :tests, :pet_indication, :string

    add_column :tests, :pet_mri, :boolean
    add_column :tests, :pet_mri_indication, :string

    add_column :tests, :ultrasound, :boolean
    add_column :tests, :ultrasound_indication, :string

    rename_column :tests, :xray_finding, :xray_indication
    change_column :tests, :xray_indication, :string
  end
end
