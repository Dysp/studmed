class AddBloodsampleToIllness2 < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :blood_sample, :string
  end
end
