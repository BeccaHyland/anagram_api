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
        subject_of_anagram = "dear"

        get "/api/v1/anagrams/#{subject_of_anagram}.json"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:anagrams].length).to eq(2)
        expect(response_body[:anagrams]).to include("read")
        expect(response_body[:anagrams]).to include("dare")

        delete '/api/v1/words/read.json'

        words = Word.all

        expect(response).to be_successful
        expect(response.status).to eq(204)
        expect(words.count).to eq(4)

        get "/api/v1/anagrams/#{subject_of_anagram}.json"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:anagrams].length).to eq(1)
        expect(response_body[:anagrams]).to_not include("read")
      end
    end
  end
end
