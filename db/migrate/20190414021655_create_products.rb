# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :url
      t.string :image_url
      t.string :asin
      t.string :price
      t.string :brand_amazon_name
      t.text :official_url
      t.string :brand_id
      t.string :category_id

      t.timestamps
    end
  end
end
