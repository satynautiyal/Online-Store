# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    #User.create([{ name: 'admin', email: "admin@gmail.com", password: "123456", role: "admin"}])
    Category.create([{name: "Men's Fashion", category_of: 0},{name: "Women's Fashion", category_of: 0},{name: "Watches", category_of: 0},{name: "Mobile", category_of: 0},{name: "Televison", category_of: 0},{name: "Massage", category_of: 1}])
    #faker
require 'faker'
#For Products
100.times do 
        name = Faker::Commerce.product_name
        description = Faker::Lorem.sentence(word_count: 10)
        product = Product.create(
        name: name,
        description: description,
        user_id: 1,
        category_id: rand(1..5)  
        )
        if(Product.all.length!=0)
            rand(1..3).times do
                product.product_variants.create(
                batch_no: Faker::Name.unique.first_name,
                weight: rand(500..2500),
                price: Faker::Commerce.price,
                quantity: rand(500..3500),
                expiry:  Faker::Date.between(from: '2022-09-23', to: '2023-09-25'),
                user_id: 1
                )
            end
        end
end

#For Orders
50.times do
    if Order.all.length != 0
        @date= @date+rand(15..30)
    else
        @date='2021-09-12'.to_date
    end
    rand(1..3).times do
        Order.create(
        orderable_type: "ProductVariant",
        orderable_id: rand(1..100),
        total_amount: rand(300..9000),
        start_time: rand(1..24),
        qty: rand(1..15),
        user_id: 2,
        cart: "false",
        end_time: rand(1..24),
        date: Faker::Date.between(from: '2014-09-12', to: '2022-01-14'),
        duration: rand(15..90),
        created_at: @date,
        )
    end
end

#For Users
10.times do
    if User.all.length != 0
        @date= @date+rand(1..5)
    else
        @date='2014-09-12'.to_date
        User.create([{ name: 'admin', email: "admin@gmail.com", password: "123456", role: "admin"}])
    end
    rand(10..50).times do
        User.create(
        name: Faker::Name.unique.first_name,
        email: Faker::Name.unique.first_name+"@gmail.com",
        password: "123456",
        created_at: @date,
        role: rand(1..2)
        )
    end
end