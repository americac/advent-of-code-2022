require 'rucksack'

class RucksackCalculator
  attr_accessor :rucksacks, :shared_item_types, :all_item_types, :item_priority, :shared_priorities, :priorities
  def initialize(rucksacks)
    @rucksacks = rucksacks
    @shared_item_types = []
    @priorities = []
  end

  def sum_shared_item_type_priorities

  end

  def set_priorities
    shared_item_types.each do |item_type|
      priorities << item_priority[item_type.to_sym]
    end

    priorities.flatten!
  end

  def set_shared_item_types
    rucksacks.each do |rucksack|
      shared_item_types << Rucksack.new(rucksack).shared_item_types
    end

    shared_item_types.flatten!
  end

  def item_priority
    @item_priority ||= all_item_types.each_with_index.map { |item, i| {"#{item}": i + 1}}.reduce({}, :merge)
  end

  def all_item_types
    @all_item_types ||= ('a'..'z').to_a + ('A'..'Z').to_a
  end
end
