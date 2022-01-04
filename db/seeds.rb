# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#faker
require 'faker'
100.times do 
        name = Faker::Commerce.product_name
        description = Faker::Lorem.sentence(word_count: 10)
        product = Product.create(
        name: name,
        description: description,
        user_id: 4,
        category_id: rand(1..3)  
        )
        rand(1..3).times do
            product.product_variants.create(
            batch_no: Faker::Name.unique.first_name,
            weight: rand(500..2500),
            price: Faker::Commerce.price,
            quantity: rand(500..3500),
            expiry:  Faker::Date.between(from: '2022-09-23', to: '2023-09-25'),
            user_id: 4
            )
        end
end