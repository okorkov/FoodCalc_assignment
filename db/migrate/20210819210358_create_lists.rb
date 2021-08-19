class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :user_id
      t.boolean :is_favorite, default: false

      t.timestamps
    end
  end
end
