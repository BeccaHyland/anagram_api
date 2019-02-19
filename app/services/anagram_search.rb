class AnagramSearch
  def initialize(subject, limit = nil)
      @subject = subject
  end

  def get_array
    alphabetized_subject = @subject.chars.sort.join.downcase

    matching_length_array.find_all do |word|
      alphabetized_subject == word.chars.sort.join.downcase
    end
  end


  def matching_length_array
    length = @subject.length
    Word.where(length: length).pluck(:spelling)
  end
end
