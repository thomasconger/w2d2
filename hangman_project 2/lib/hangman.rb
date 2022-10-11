class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample()
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = Array.new
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    #find all indices in secret_word with char
    spots = []
    @secret_word.each_char.with_index do |ltr, idx|
      if ltr == char
        spots << idx
      end
    end
    spots
  end

  def fill_indices(char, arr)
    arr.each do |ele|
      @guess_word[ele] = char
    end
  end



end
