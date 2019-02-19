require 'rails_helper'

describe 'DELETE /api/v1/words.json' do
  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'deletes all words from database' do
        delete '/api/v1/words.json'

        words = Word.all

        expect(response).to be_successful
        expect(response.status).to eq(204)
        expect(words.count).to eq(0)

        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:anagrams].length).to eq(0)
      end
    end
  end
end
