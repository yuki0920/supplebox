# frozen_string_literal: true

class AddIndexToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :brand_id, :string, index: true
  end
end
