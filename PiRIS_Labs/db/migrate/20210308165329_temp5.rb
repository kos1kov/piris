class Temp5 < ActiveRecord::Migration[5.2]
  def change
    rename_column :credits, :users_id, :user_id
  end
end
