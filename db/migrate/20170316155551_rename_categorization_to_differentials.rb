class RenameCategorizationToDifferentials < ActiveRecord::Migration[5.0]
  def change
    rename_table :categorizations, :differentials
  end
end
