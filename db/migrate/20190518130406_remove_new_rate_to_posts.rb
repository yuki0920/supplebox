class RemoveNewRateToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :new_rate, :float
  end
end
