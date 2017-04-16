class AddStuffToCase < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :illness_id, :integer
  end
end
