require 'rspec'
require_relative '../app/Item'
require_relative '../app/Virtual_Item'
require_relative '../app/Real_Item'

describe RealItem do

  it 'uses weight while returning info if the condition is true' do
    item1 = RealItem.new(name: 'kettle', price: 200, weight: 2)
    item2 = RealItem.new(name: 'kettle', price: 200, weight: 10)
    item1_info = []
    item2_info = []
    item1.info { |attr| item1_info << attr }
    item2.info { |attr| item2_info << attr }
    item1_info.join(',').should == '232.0,kettle'
    item2_info.join(',').should == '10,232.0,kettle'

  end

end