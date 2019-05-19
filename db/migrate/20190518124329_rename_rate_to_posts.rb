class RenameRateToPosts < ActiveRecord::Migration[5.2]
  def up
    if Rails.env.development? || Rails.env.test?
      change_column :posts, :rate, :float
    else Rails.env.production?
      change_column :posts, :rate, 'float USING CAST(rate AS float)'
    end
  end
  
  def down
    change_column :posts, :rate, :string
  end
end
