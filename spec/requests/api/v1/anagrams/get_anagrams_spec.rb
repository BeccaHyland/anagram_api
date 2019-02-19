require 'rails_helper'

describe 'GET /api/v1/anagrams/:subject.json' do
  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'returns array of any anagrams matching subject' do
        subject_of_anagram = "read"

        get "/api/v1/anagrams/#{subject_of_anagram}.json"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(get_response[:anagrams]).to be_an(Array)
        expect(get_response[:anagrams]).to include("dare")
        expect(get_response[:anagrams]).to include("dear")
      end
    end
  end
end
