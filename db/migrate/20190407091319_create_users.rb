# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :nickname
      t.string :weight
      t.string :height
      t.string :gender
      t.string :comment

      t.timestamps
    end
  end
end
