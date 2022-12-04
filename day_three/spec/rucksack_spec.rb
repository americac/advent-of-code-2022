require "rucksack"

RSpec.describe Rucksack do
  let(:items) do
    [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
  end

  describe "#first_compartment" do
    it "returns first half of item string for first item list" do
      rucksack = Rucksack.new(items.first)
      expect(rucksack.first_compartment.join).to eq("vJrwpWtwJgWr")
    end

    it "returns first half of item string for last item list" do
      rucksack = Rucksack.new(items.last)
      expect(rucksack.first_compartment.join).to eq("CrZsJsPPZsGz")
    end
  end

  describe "#second_compartment" do
    it "returns second half of item string for first item list" do
      rucksack = Rucksack.new(items.first)
      expect(rucksack.second_compartment.join).to eq("hcsFMMfFFhFp")
    end

    it "returns second half of item string for first item list" do
      rucksack = Rucksack.new(items.last)
      expect(rucksack.second_compartment.join).to eq("wwsLwLmpwMDw")
    end
  end

  describe "#item_count" do
    it "returns accurate item count for first item" do
      first_item_list = Rucksack.new(items.first)
      expect(first_item_list.item_count).to eq 24
    end

    it "returns accurate item count for last item" do
      last_item_list =  Rucksack.new(items.last)
      expect(last_item_list.item_count).to eq 24
    end
  end

  describe "#shared_item_types" do
    it "returns an array of item types found in both compartments" do
      rucksack_with_dup_item_types =  Rucksack.new(items.first)
      expect(rucksack_with_dup_item_types.shared_item_types).to eq ['p']
    end

    it "returns an empty array when item types not found in both compartments" do
      item_list = "ttgJtRGJQcxTZsZT"
      rucksack_without_dup_item_types =  Rucksack.new(item_list)
      expect(rucksack_without_dup_item_types.shared_item_types).to be_empty
    end
  end
end
