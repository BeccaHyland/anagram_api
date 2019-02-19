class WordMaker
  def initialize(post_words_array)
    @post_words_array = post_words_array
  end

  def parsed_words
    @post_words_array.map { |word| {spelling: word, length: word.length} }
  end

  def new_words
    @new_words ||= parsed_words.map { |word_hash| Word.create(word_hash) }
  end
end
