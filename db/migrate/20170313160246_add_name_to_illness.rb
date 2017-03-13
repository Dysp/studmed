class AddNameToIllness < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :name, :string
  end
end
