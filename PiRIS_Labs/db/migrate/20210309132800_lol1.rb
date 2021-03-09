class Lol1 < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :credit_type, :string
  end
end
