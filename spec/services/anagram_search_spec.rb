require 'rails_helper'

describe AnagramSearch do
  describe 'instance methods (unit testing)' do
    describe '#get_array' do
      it 'returns array of anagrams matching subject or empty array if none' do
        subject = "read"
        search = AnagramSearch.new(subject)

        expect(search.get_array).to be_an(Array)
      end
    end

    describe '#matching_length_array' do
      it 'returns array of words having same length as subject' do
        word1 = Word.create(spelling: "dear", length: 4)
        word2 = Word.create(spelling: "dare", length: 4)
        word3 = Word.create(spelling: "road", length: 4)
        word4 = Word.create(spelling: "wow", length: 3)

        subject = "read"
        search = AnagramSearch.new(subject)
        expect(search.matching_length_array).to be_an(Array)
      end
    end
  end
end
