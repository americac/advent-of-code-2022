require "rucksack_calculator"

RSpec.describe RucksackCalculator do
  let(:rucksacks) do
    [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
  end
  let(:rucksack_calculator) { RucksackCalculator.new(rucksacks) }

  describe "#sum_shared_item_type_priorities" do
    it "returns the correct sum" do
      expect(rucksack_calculator.sum_shared_item_type_priorities).to eq 157
    end
  end

  describe "#set_shared_item_types" do
    it "returns shared item types when found" do
      rucksack_calculator.set_shared_item_types
      expect(rucksack_calculator.shared_item_types).to eq ["p", "L", "P", "v", "t", "s"]
    end

    it "returns empty array when no shared item types found" do
      no_shared_item_types =
        [
          "vJrwXWtwJgWrhcsFMMfFFhFp",
          "jqHRNqRjqzjGDLGArsFMfFZSrBrFZsSB",
          "PmmdzqPrVvAwwTWBwg",
          "wMqvLMZHhHMvwLHjbacjnnSBnbTQFn",
          "ttgJtRGJQcaTZaZT",
          "CrZsJsPPZsGzwweLwLmpwMDw",
        ]
      rucksack_calculator = RucksackCalculator.new(no_shared_item_types)
        rucksack_calculator.set_shared_item_types
       expect(rucksack_calculator.shared_item_types).to be_empty
    end
  end

  describe "#set_priorities" do
    it "sets priorities for shared item types when found" do
      rucksack_calculator.set_shared_item_types
      rucksack_calculator.set_priorities
      expect(rucksack_calculator.priorities).to eq [16, 38, 42, 22, 20, 19]
    end

    it "returns empty array when no shared item types found" do
      no_shared_item_types =
        [
          "vJrwXWtwJgWrhcsFMMfFFhFp",
          "jqHRNqRjqzjGDLGArsFMfFZSrBrFZsSB",
          "PmmdzqPrVvAwwTWBwg",
          "wMqvLMZHhHMvwLHjbacjnnSBnbTQFn",
          "ttgJtRGJQcaTZaZT",
          "CrZsJsPPZsGzwweLwLmpwMDw",
        ]
       rucksack_calculator = RucksackCalculator.new(no_shared_item_types)
       expect(rucksack_calculator.priorities).to be_empty
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
      expect(RucksackCalculator.new(rucksacks).item_priority).to eq expected_hash
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
      expect(RucksackCalculator.new(rucksacks).all_item_types).to eq expected_array
    end
  end
end
