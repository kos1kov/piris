class Lol1111 < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :user, :string
  end
end
