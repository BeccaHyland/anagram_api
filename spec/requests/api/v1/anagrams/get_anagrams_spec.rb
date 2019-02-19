require 'rails_helper'

describe 'GET /api/v1/anagrams/:subject.json' do
  before(:each) do
    word1 = Word.create!(spelling: "read", length: 4)
    word1 = Word.create!(spelling: "dear", length: 4)
    word2 = Word.create!(spelling: "dare", length: 4)
    word3 = Word.create!(spelling: "road", length: 4)
    word4 = Word.create!(spelling: "wow", length: 3)
  end

  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'returns array of any anagrams matching subject' do
        subject_of_anagram = "read"

        get "/api/v1/anagrams/#{subject_of_anagram}.json"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:anagrams]).to be_an(Array)
        expect(response_body[:anagrams].length).to eq(2)
        expect(response_body[:anagrams]).to include("dare")
        expect(response_body[:anagrams]).to include("dear")
        expect(response_body[:anagrams]).to_not include("read")
      end
    end

    describe 'with limit included in correctly formatted request' do
      it 'returns array of any anagrams matching subject' do
        subject_of_anagram = "read"
        limit = 1

        get "/api/v1/anagrams/#{subject_of_anagram}.json/?limit=#{limit}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:anagrams]).to be_an(Array)
        expect(response_body[:anagrams].length).to eq(1)
      end
    end
  end
end
