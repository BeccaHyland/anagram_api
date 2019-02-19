class Api::V1::WordsController < ApplicationController
  def create
    words = word_maker.new_words
    if words.each do |word|
        word.save
      end
      render json: {message: "Success!"}, status: 201
    else
      render json: {}, status: 400
    end
  end

  private

  def word_maker
    WordMaker.new(params[:words])
  end
end
