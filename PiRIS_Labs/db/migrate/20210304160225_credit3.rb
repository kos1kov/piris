class Credit3 < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_plans do |t|
      t.string :name
      t.decimal :percent, precision: 6, scale: 2
    end
  end
end
