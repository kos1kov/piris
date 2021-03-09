class Deposit < ActiveRecord::Migration[5.2]
  def change
    change_table :deposits do |t|
      t.string :depositUser


    end
  end
end
