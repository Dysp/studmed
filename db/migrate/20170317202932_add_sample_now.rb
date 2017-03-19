class AddSampleNow < ActiveRecord::Migration[5.0]
  def change
    drop_table :bloodsamples
  end
end
