
# Add categories

4.times do
  Category.create! name: Faker::Hacker.ingverb.capitalize
end

category_ids = Category.pluck(:id)

# Add products

print 'Product '

30.times do
product = Product.create! name: "#{Faker::Hacker.verb} #{Faker::Hacker.noun}".capitalize,
  description: Faker::Hacker.say_something_smart,
  long_description: Faker::Lorem.paragraphs(3).join('\n\n'),
  category_id: category_ids.sample,
  price: Faker::Number.decimal(3,2)
product.remote_photo_url = Faker::Avatar.image(
    product.name.parameterize,
    '640x480',
    'jpg',
    "set#{[1, 2, 3].sample}",
    "bg#{[1, 2].sample}"
)
product.save
print '.'
end
puts

# Add admin user

user = User.new(
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  admin: true
)
user.skip_confirmation!
user.save!
puts 'Added admin user'

user = User.new(
  email: 'user@user.com',
  password: '123456',
  password_confirmation: '123456',
  admin: false
)
user.skip_confirmation!
user.save!
puts 'Added random user'

type = ShippingType.new(
  name: 'Poczta Polska',
  cost: 10.50
)
type.save!
puts 'Added poczta polska shipping type'

type = ShippingType.new(
  name: 'Kurier',
  cost: 15.60
)
type.save!
puts 'Added kurier shipping type'
