class Lolpfsd < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :active, :boolean
  end
end
