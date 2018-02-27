class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :photo
      t.integer :price
      t.string :console
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
