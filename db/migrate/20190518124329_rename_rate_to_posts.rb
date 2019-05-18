class RenameRateToPosts < ActiveRecord::Migration[5.2]
  def up  
    change_column :posts, :rate, :float
  end
  
  def down
    change_column :posts, :rate, :string
  end
end
