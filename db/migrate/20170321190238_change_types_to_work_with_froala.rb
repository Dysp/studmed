class ChangeTypesToWorkWithFroala < ActiveRecord::Migration[5.0]
  def change
    change_column :illnesses, :description, :text
  end
end
