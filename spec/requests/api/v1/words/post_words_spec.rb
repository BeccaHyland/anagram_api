require 'rails_helper'

describe 'POST /api/v1/words.json' do
  describe 'as a visitor' do
    describe 'with correctly formatted request' do
      it 'posts words to the database' do
        payload = {
          "words": ["read", "dear", "dare"]
        }

        post '/api/v1/words.json', params: payload

        last_word = Word.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(last_word.spelling).to eq(payload[:words][-1])
      end
    end

    describe 'with incorrectly formatted request' do
      it 'does not post words to the database' do
        payload = {
          "words": [""]
        }

        post '/api/v1/words.json', params: payload

        expect(response.status).to eq(400)
      end
    end
  end
end
