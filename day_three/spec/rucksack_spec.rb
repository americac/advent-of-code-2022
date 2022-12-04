require "rucksack"

RSpec.describe Rucksack do
  let(:items) do
    [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
  end

  describe "first_compartment" do
    let(:rucksack) { Rucksack.new(items.first) }
    it "returns first half of item string" do
      expect(rucksack.first_compartment.join).to eq("vJrwpWtwJgWr")
    end
  end

  describe "second_compartment" do
    let(:rucksack) { Rucksack.new(items.first) }
    it "returns second half of item string" do
      expect(rucksack.second_compartment.join).to eq("hcsFMMfFFhFp")
    end
  end

  describe "item_count" do
    it "returns accurate item count for first item" do
      first_item_list = Rucksack.new(items.first)
      expect(first_item_list.item_count).to eq 24
    end

    it "returns accurate item count for last item" do
      last_item_list =  Rucksack.new(items.last)
      expect(last_item_list.item_count).to eq 24
    end
  end
end
