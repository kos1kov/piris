class Temp2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :credit_plan, :credit
  end
end
