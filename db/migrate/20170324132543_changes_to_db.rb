class ChangesToDb < ActiveRecord::Migration[5.0]
  def change
    drop_table :paraclinicals
    rename_column :tests, :paraclinical_id, :illness_id
  end
end
