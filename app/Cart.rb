require_relative 'Virtual_Item'

class Cart

  attr_reader :items

  include ItemContainer

  class ItemNotSupported < StandardError; end

  UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem].freeze

  def initialize(owner)
    @items = []
    @owner = owner
  end

  def add_items(*items)
    @items += items
  end

  def save_to_file
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each do |i|
        raise ItemNotSupported if UNSUPPORTED_ITEMS.include?(i.class)

        f.puts i
      end
    end
  end

  def read_from_file
    File.readlines("#{@owner}_cart.txt").each do |i|
      @items << i.to_real_item
    end

    @items.uniq!
  rescue Errno::ENOENT
    File.open("#{@owner}_cart.txt", "w") {}
    puts "file #{@owner}-cart.txt created"
  end

end