require 'rspec'
require_relative '../app/Item_Container'
require_relative '../app/antique_item'
require_relative '../app/Item'
require_relative '../app/Cart'

describe Cart do

  describe 'managing items' do
    it 'adds items into the cart' do
      cart = Cart.new('Vitalii')
      item1 = Item.new("kettle", price: 200)
      item2 = Item.new("car", price: 200)
      cart.add_items(item1, item2)
      cart.items.should include(item1, item2)
    end

    it 'removes items from itself'

  end

  it 'counts items in itself'
  it 'places order using all the items that were added into the cart'
  it 'clears itself off the items after an order is placed'

end
