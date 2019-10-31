# frozen_string_literal: true

class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :content
      t.string :picture

      t.timestamps
    end
  end
end
