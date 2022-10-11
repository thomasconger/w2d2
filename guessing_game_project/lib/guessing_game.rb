class GuessingGame
    attr_reader :num_attempts

    def initialize (min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            p "You win!"
        elsif num < @secret_num
            #small
            p "Oh no. Too small."
            p "----------"
        else
            p "Oh no. Not that big."
        end
    end

    def ask_user
        p "Enter a number."
        guess = gets.chomp.to_i
        self.check_num(guess)
    end
end
