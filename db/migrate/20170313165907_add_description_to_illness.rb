class AddDescriptionToIllness < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :description, :string
  end
end
