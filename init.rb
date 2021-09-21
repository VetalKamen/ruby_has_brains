require_relative 'app/Store_Application'
StoreApplication.config do |app|
  app.name = 'My Store'
  app.environment = :production

  app.admin do |admin|
    admin.email = "kemenyash98@gmail.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end
end

# p StoreApplication.environment
# p StoreApplication.name
# p StoreApplication::Admin.email
# p StoreApplication::Admin.login

@items = []
@items << AntiqueItem.new('car', price: 101, weight: 100)
@items << RealItem.new(weight: 100, price: 101, name: 'kettle')
@items << RealItem.new(weight: 100, price: 101, name: 'dishwasher')

# @items.each { |i| puts i.name }

cart = Cart.new("roman")
cart.add_item RealItem.new(weight: 100, price: 101, name: 'car')
cart.add_item RealItem.new(weight: 100, price: 150, name: 'car')
cart.add_item RealItem.new(weight: 100, price: 120, name: 'kettle')
# p cart.all_cars

order = Order.new
# @items.each { |i| order.add_item(i) }

order.place
p order.placed_at.strftime("%b %-d, %Y %H:%M:%S")
p order.time_on_sending_email


