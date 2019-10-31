# frozen_string_literal: true

class RenameTitileColumnToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :titile, :title
  end
end
