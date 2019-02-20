class WordMaker
  def initialize(post_words_array)
    @post_words_array = post_words_array
  end

  def new_words
    @new_words ||= parsed_words.map { |word_hash| Word.new(word_hash) }
  end

  def parsed_words
    words_under_45.map { |word| {spelling: word, length: word.length} }
  end

  def words_under_45
    @post_words_array.find_all { |word| word.length <= 45 && word.length > 0}
  end
end
