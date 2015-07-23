# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
  
Internet.email

Address.street_address
Address.city
Address.state_abbr
Address.zip

Commerce.product_name
Commerce.price
Date.between(2.years.ago, Date.today)

Name.first_name
Name.last_name
Phone.number

Business.credit_card_number
Business.credit_card_expiry_date
  
=end

require 'faker'

def strip_phone_number(number)
  n = number.split("x")[0].gsub("-", "").gsub(" ", "").gsub("(", "").gsub(")", "").gsub(".", "")
end

# Generate users
1000.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
              phone: strip_phone_number(Faker::PhoneNumber.phone_number), primary_address_id: (1..5000).to_a.sample)
end

# Generate products
10000.times do
  Product.create(price: Faker::Commerce.price, name: Faker::Commerce.product_name, description: Faker::Lorem.sentence)
end

# Generate addresses
5000.times do
  Address.create(street_num_name: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip)
end

# Generate orders
5000.times do
  u = User.all.sample
  Order.create(user_id: u.id, address_id: u.primary_address_id, payment_id: rand(1..5000))
end

# Generate payments
5000.times do
  u = User.all.sample
  Payment.create(cc_number: Faker::Business.credit_card_number, name_cc: "#{u.first_name} #{u.last_name}",
                 expiration_date: Faker::Business.credit_card_expiry_date, billing_address_id: u.primary_address_id)
end

# Product orders
5000.times do |i|
  order = Order.find(i+1)
  item_count = rand(1..10)
  item_count.times do
    ProductOrder.create(order_id: order.id, product_id: Product.all.sample.id, quantity: rand(1..5))
  end
end

# User addresses
1000.times do |i|
  user = User.find(i+1)
  count = rand(1..3)
  count.times do
    UserAddress.create(user_id: user.id, address_id: Address.all.sample)
  end
end