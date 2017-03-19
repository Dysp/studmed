class FuckingShit < ActiveRecord::Migration[5.0]
  def change
    change_column :illnesses, :blood_sample, :text
  end
end
