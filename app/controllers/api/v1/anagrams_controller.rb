class Api::V1::AnagramsController < ApplicationController
  def show
    anagrams = anagram_search.get_array
    render json: {anagrams: anagrams}
  end

  private

  def anagram_search
    AnagramSearch.new(params[:id], params[:limit])
  end
end
