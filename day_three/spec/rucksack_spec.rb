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

  describe ".item_priority" do
    let(:expected_hash) do
      {
        a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7,
        h: 8, i: 9, j: 10, k: 11, l: 12, m: 13, n: 14,
        o: 15, p: 16, q: 17, r: 18, s: 19 , t: 20, u: 21,
        v: 22, w: 23, x: 24, y: 25, z: 26,
        A: 27, B: 28, C: 29, D: 30, E: 31, F: 32, G: 33,
        H: 34, I: 35, J: 36, K: 37, L: 38, M: 39, N: 40,
        O: 41, P: 42, Q: 43, R: 44, S: 45, T: 46, U: 47,
        V: 48, W: 49, X: 50, Y: 51, Z: 52
      }
    end

    it "returns the expected hash" do
      expect(Rucksack.new(items.first).item_priority).to eq expected_hash
    end
  end

  describe ".all_item_types" do
    let(:expected_array) do
      [
        'a', 'b', 'c', 'd', 'e', 'f', 'g',
        'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'o', 'p', 'q', 'r', 's', 't', 'u',
        'v', 'w', 'x', 'y', 'z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G',
        'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U',
        'V', 'W', 'X', 'Y', 'Z'
      ]
    end

    it "returns the expected hash" do
      expect(Rucksack.new(items.first).all_item_types).to eq expected_array
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
