# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require('csv')

class CreateFromCSV 

  def self.createNewItem(item)
    name = item[0]
    description = item[1]
    category = item[2]
    item = Item.new(
      name: name,
      description: description,
    )
    item.category = Category.find_or_create_by(name: category)
    item.save
  end

end

CSV.foreach(Rails.root.join('db/data/menu_items.csv'), headers: true) do |item|
  CreateFromCSV.createNewItem(item)
end