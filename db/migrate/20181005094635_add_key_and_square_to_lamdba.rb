# Add column key and square_value to lamdba table
class AddKeyAndSquareToLamdba < ActiveRecord::Migration[5.2]
  def change
    add_column :lamdbas, :key, :int
    add_column :lamdbas, :square_value, :int
  end
end
