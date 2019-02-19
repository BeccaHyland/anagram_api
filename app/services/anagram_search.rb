class AnagramSearch
  def initialize(subject, limit = nil)
      @subject = subject
  end

  def get_array
    alphabetized_subject = @subject.chars.sort.join.downcase
    anagrams = []

    matching_length_array.each do |word|
      if alphabetized_subject == word.chars.sort.join.downcase
        anagrams.push(word)
      end
    end
    anagrams
  end


  def matching_length_array
    length = @subject.length
    Word.where(length: length).pluck(:spelling)
  end
end
