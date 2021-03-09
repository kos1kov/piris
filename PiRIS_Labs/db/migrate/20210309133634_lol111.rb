class Lol111 < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :credit_plan, :string
  end
end
