# frozen_string_literal: true

class AddColumunUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture, :string
  end
end
