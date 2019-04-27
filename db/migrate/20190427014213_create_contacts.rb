class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :titile
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
