class Api::V1::WordsController < ApplicationController
  def create
    words = word_maker.new_words
    if words.length > 0
      words.each do |word|
        word.save
      end
      render json: {message: "Success!"}, status: 201
    else
      render json: {error: "Try a different word"}, status: 400
    end
  end

  def destroy
    word = word_params[:id]
    query_result = Word.find_by_spelling(word)
    if query_result
      query_result.delete
      render json: { message: "Successfully deleted: #{query_result}"}, status: 204
    else
      render json: { error: "Try a different word" }, status: 400
    end
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
