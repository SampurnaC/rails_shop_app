# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
["Electronics", "Home & Living", "Fashion", "Books", "Sports"].each do |category|
  Category.create(name: category)
end
user=User.last

image_paths = Dir[Rails.root.join("app/assets/images/placeholders/*")]


200.times do
  Product.create!(
    title: "test",
    description: "test description",
    price: 3,
    category: Category.first,
    user: user,
    image: File.open(image_paths.sample)
  )
end
