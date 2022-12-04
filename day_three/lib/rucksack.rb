class Rucksack
  attr_accessor :items, :item_count, :first_compartment

  def initialize(items)
    @items = items.split('')
  end

  def first_compartment
    @first_compartment ||= items.take(item_count/2)
  end

  def item_count
    @item_count ||= items.count
  end
end
