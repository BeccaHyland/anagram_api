class Api::V1::AnagramsController < ApplicationController
  def show
    render json: {anagrams: anagram_search.get_array}
  end

  private

  def anagram_search
    AnagramSearch.new(params[:id])
  end
end
