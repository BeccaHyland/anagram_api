require 'rails_helper'

describe 'DELETE /api/v1/words.json' do
  before(:each) do
    word1 = Word.create!(spelling: "read", length: 4)
    word1 = Word.create!(spelling: "dear", length: 4)
    word2 = Word.create!(spelling: "dare", length: 4)
    word3 = Word.create!(spelling: "road", length: 4)
    word4 = Word.create!(spelling: "wow", length: 3)
  end
  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'deletes all words from database' do
        delete '/api/v1/words.json'

        words = Word.all

        expect(response).to be_successful
        expect(response.status).to eq(204)
        expect(words.count).to eq(0)
      end
    end
  end
  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'deletes one word from database' do
        delete '/api/v1/words/read.json'

        words = Word.all

        expect(response).to be_successful
        expect(response.status).to eq(204)
        expect(words.count).to eq(4)
      end
    end
    describe 'with a repeated correctly formatted request' do
      it 'returns a 400 error' do
        delete '/api/v1/words/read.json'
        delete '/api/v1/words/read.json'

        expect(response.status).to eq(400)
      end
    end
  end
end
