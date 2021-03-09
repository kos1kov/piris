class Temp3 < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_plans, :credit_id, :string
  end
end
