class Atm < ActiveRecord::Migration[5.2]
  def change
    create_table :card do |t|
      t.string :number
      t.string :password
      t.integer :attempt, :default => 0
      t.integer :money
    end
  end
end
