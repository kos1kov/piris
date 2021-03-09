class Credit2 < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_plans do |t|
      t.string :name
      t.integer :duration
      t.decimal :percent, precision: 6, scale: 2
    end

    remove_column :credit, :credit_plan
    add_reference :credit, :credit_plan
  end
end
