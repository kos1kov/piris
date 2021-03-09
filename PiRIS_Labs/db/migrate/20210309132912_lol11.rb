class Lol11 < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :typeOfCurrency, :string

  end
end
