class Rucksack
  attr_accessor :items, :item_count, :first_compartment, :second_compartment, :all_item_types

  def initialize(items)
    @items = items.split('')
  end

  def first_compartment
    @first_compartment ||= items.take(item_count/2)
  end

  def second_compartment
    @second_compartment ||= items.last(item_count/2)
  end

  def item_count
    @item_count ||= items.count
  end

  def shared_item_types
    first_compartment.uniq & second_compartment.uniq
  end
end
