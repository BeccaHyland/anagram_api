require 'rails_helper'

describe WordMaker do
  describe 'instance methods (unit testing)' do
    describe '#new_words' do
      it 'returns an array of Word objects' do
        words_from_request = ["absotively", "posilutely"]
        wm = WordMaker.new(words_from_request)

        expect(wm.new_words.first).to be_a(Word)
        expect(wm.new_words.last).to be_a(Word)
      end
    end

    describe '#parsed_words' do
      it 'parses array into word hashes formatted to db' do
        words_from_request = ["absotively", "posilutely"]
        wm = WordMaker.new(words_from_request)

        expected = [
          {spelling: "absotively", length: 10},
          {spelling: "posilutely", length: 10}
        ]

        expect(wm.parsed_words).to eq(expected)
      end
    end

    describe '#words_under_45' do
      it 'removes any submitted words over 45 characters' do
        words_from_request = ["absotively", "posilutely",
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]

        wm = WordMaker.new(words_from_request)

        expect(wm.words_under_45.length).to eq(2)
        expect(wm.words_under_45).to_not include("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      end
    end
  end
end
