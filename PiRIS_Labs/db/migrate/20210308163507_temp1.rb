class Temp1 < ActiveRecord::Migration[5.2]
  def change
    rename_table :credit, :credits
  end
end
