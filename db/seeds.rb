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
  cocktail_db_serialized2 = open(url2).read
  cocktail_db2 = JSON.parse(cocktail_db_serialized2)
  file = cocktail_db2['drinks'][0]['strDrinkThumb']
  cocktail = Cocktail.new(name: cocktail_db2['drinks'][0]['strDrink'])
  cocktail.photo.attach(io: file, filename: 'cocktail-image.jpg', content_type: 'image/jpg')
  cocktail.save
end
