# frozen_string_literal: true

class ChangeDataRateToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :new_rate, :float
  end
end
