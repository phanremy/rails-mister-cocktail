# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
cocktail_db_serialized = open(url).read
cocktail_db = JSON.parse(cocktail_db_serialized)
cocktail_db['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
cocktail_db_serialized = open(url).read
cocktail_db = JSON.parse(cocktail_db_serialized)
file = URI.open("https://www.thecocktaildb.com/images/media/drink/wpxpvu1439905379.jpg")
cocktail = Cocktail.new(name: cocktail_db['drinks'][0]['strDrink'])
cocktail.photo.attach(io: file, filename: "margarita.jpg", content_type: 'image/jpg')
cocktail.save

url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mojito"
cocktail_db_serialized = open(url).read
cocktail_db = JSON.parse(cocktail_db_serialized)
file = URI.open("https://www.thecocktaildb.com/images/media/drink/rxtqps1478251029.jpg")
cocktail = Cocktail.new(name: cocktail_db['drinks'][0]['strDrink'])
cocktail.photo.attach(io: file, filename: "mojito.jpg", content_type: 'image/jpg')
cocktail.save

100.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  # puts url
  cocktail_db_serialized = open(url).read
  # puts cocktail_db_serialized
  cocktail_db = JSON.parse(cocktail_db_serialized)
  # puts cocktail_db
  file = URI.open(cocktail_db['drinks'][0]['strDrinkThumb'])
  # puts file
  cocktail = Cocktail.new(name: cocktail_db['drinks'][0]['strDrink'])
  # puts cocktail
  cocktail.photo.attach(io: file, filename: "#{cocktail.name}.jpg", content_type: 'image/jpg')
  cocktail.save
end
