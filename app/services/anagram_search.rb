class AnagramSearch
  def initialize(subject, limit = nil)
      @subject = subject
      @limit = limit
  end

  def get_array
    alphabetized_subject = @subject.chars.sort.join.downcase
    anagrams_cleaner(
      matching_length_array.find_all do |word|
        alphabetized_subject == word.chars.sort.join.downcase
      end
    )
  end

  def anagrams_cleaner(array)
    array.delete(@subject)
    @limit ? array.uniq.take(@limit.to_i) : array.uniq
  end

  def matching_length_array
    length = @subject.length
    Rails.cache.fetch("length_#{length}_words") { puts 'querying db...'; Word.where(length: length).pluck(:spelling) }
  end
end
