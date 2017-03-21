class RenamingDifferentials < ActiveRecord::Migration[5.0]
  def change
    rename_column :differentials, :diff_id, :differential_id
  end
end
