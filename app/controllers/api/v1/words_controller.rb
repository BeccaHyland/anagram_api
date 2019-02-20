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

  def destroy
    word = word_params[:id]
    Word.find_by_spelling(word).delete
    render json: {}, status: 204
  end

  def destroy_all
    Word.destroy_all
    render json: {}, status: 204
  end

  private

  def word_params
    params.permit(:id)
  end

  def word_maker
    WordMaker.new(params[:words])
  end
end
