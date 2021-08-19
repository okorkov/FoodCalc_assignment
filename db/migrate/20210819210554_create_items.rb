class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
