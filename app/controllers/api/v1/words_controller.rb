class Api::V1::WordsController < ApplicationController
  def create
    words = WordMaker.new(word_params)
  end

  private

  def word_params
    params.require(:word).permit(:words)
  end
end
