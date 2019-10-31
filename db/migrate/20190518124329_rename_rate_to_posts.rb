# frozen_string_literal: true

class RenameRateToPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :rate, 'float USING CAST(rate AS float)'
  end

  def down
    change_column :posts, :rate, :string
  end
end
