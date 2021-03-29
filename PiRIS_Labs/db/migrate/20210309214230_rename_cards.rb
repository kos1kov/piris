class RenameCards < ActiveRecord::Migration[5.2]
  def change
    rename_table :card, :cards
  end
end
