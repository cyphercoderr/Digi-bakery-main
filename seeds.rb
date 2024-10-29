# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fillings = ['peanut butter', 'chocolate', 'marshmallow', 'icing']

50.times do
  Order.create(
    customer_name: Faker::Name.name,
    item: "Cookies with #{fillings.sample}",
    quantity: Faker::Number.between(from: 2, to: 24),
    pick_up_at: Faker::Number.between(from: 1, to: 10).days.from_now
  )
end
