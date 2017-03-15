class AddSynonymsToIllness < ActiveRecord::Migration[5.0]
  def change
    add_column :illnesses, :synonyms, :string
  end
end
