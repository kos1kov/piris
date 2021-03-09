class Credits < ActiveRecord::Migration[5.2]
  def change
    create_table :credit do |t|
      t.string :credit_plan
      t.date :start_date
      t.date :end_date
      t.float :percent_sum
      t.integer :percent
      t.integer :sum
      t.belongs_to :users
    end
  end
end
