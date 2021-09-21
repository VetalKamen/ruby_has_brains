require 'rspec'
require_relative '../app/Item'
require_relative '../app/Virtual_Item'

describe Item do

  before(:each) do
    @item = Item.new("kettle", price: 200)
  end

  it 'calculates price according to formula' do
    @item.price.should == 232
  end

  it 'should return info about th object' do
    @item.to_s.should == 'kettle:232.0'
  end

  it 'calculates tax' do
    @item.send(:tax).should_not be_nil
  end
end
