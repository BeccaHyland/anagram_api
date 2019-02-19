require 'rails_helper'

describe AnagramSearch do
  describe 'instance methods (unit testing)' do
    before(:each) do
      word1 = Word.create!(spelling: "read", length: 4)
      word1 = Word.create!(spelling: "dear", length: 4)
      word2 = Word.create!(spelling: "dare", length: 4)
      word3 = Word.create!(spelling: "road", length: 4)
      word4 = Word.create!(spelling: "wow", length: 3)
    end

    describe '#get_array' do
      it 'returns array of anagrams matching subject or empty array if none' do
        subject = "read"
        search = AnagramSearch.new(subject)

        expect(search.get_array).to be_an(Array)
        expect(search.get_array.length).to be(2)
        expect(search.get_array).to include("dare")
        expect(search.get_array).to include("dear")
        expect(search.get_array).to_not include("read")
      end
    end

    describe '#matching_length_array' do
      it 'returns array of words having same length as subject' do
        subject = "read"
        search = AnagramSearch.new(subject)

        expect(search.matching_length_array).to be_an(Array)
        expect(search.matching_length_array.length).to eq(4)
        expect(search.matching_length_array).to_not include("wow")
      end
    end
  end
end
