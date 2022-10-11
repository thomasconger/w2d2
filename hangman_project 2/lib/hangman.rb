require "byebug"

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

  def try_guess(guess)
    if self.already_attempted?(guess)
      puts "that has already been attempted"
      false
    else
        @attempted_chars << guess
        #check  i f matching indices, i f so fill
        m_indices = self.get_matching_indices(guess)
        if m_indices == []
          @remaining_incorrect_guesses -= 1
        else
          self.fill_indices(guess, m_indices)
        end
        true
    end #if already attempted
  end #try guess

  def ask_user_for_guess
    puts "Enter a char:"
    attempt = gets.chomp
    self.try_guess(attempt)
  end

  def win?
    user_thinks = @guess_word.join("")
    actual = @secret_word
    if user_thinks == actual
      puts "WIN"
      true
    else
      false
    end

  end #win

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end #lose?

  def game_over?

     if self.win? || self.lose?
      puts @secret_word
      true
     else
      false
     end

  end #game_over?
end  #hangman
