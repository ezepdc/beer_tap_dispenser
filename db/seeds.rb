puts "Cleaning database..."
User.destroy_all
Dispenser.destroy_all
Spending.destroy_all

puts "Creating..."

user = User.create(
  email: "eze@pdc.com",
  password: "123456"
)
puts "User with id: #{user.id} has been created"

dispenser = Dispenser.create(
  user: user,
  flow_volume: 0.064,
  price: 12.25
)
puts "Dispenser with id: #{dispenser.id} has been created"

puts "Finished!"
