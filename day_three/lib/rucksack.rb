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

  def item_priority
    @item_priority ||= all_item_types.each_with_index.map { |item, i| {"#{item}": i + 1}}.reduce({}, :merge)
  end

  def all_item_types
    @all_item_types ||= ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def item_types_in_both_compartments
    first_compartment.uniq & second_compartment.uniq
  end
end
