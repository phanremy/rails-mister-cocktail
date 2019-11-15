# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

50.times do
  url2 = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  # puts url2
  cocktail_db_serialized2 = open(url2).read
  # puts cocktail_db_serialized2
  cocktail_db2 = JSON.parse(cocktail_db_serialized2)
  # puts cocktail_db2
  file = cocktail_db2['drinks'][0]['strDrinkThumb']
  # puts file
  cocktail = Cocktail.new(name: cocktail_db2['drinks'][0]['strDrink'])
  # puts cocktail
  # cocktail.photo.attach(io: file, filename: 'drink-image.jpg', content_type: 'image/jpg')
  # puts cocktail.photo.key
  cocktail.save
end
