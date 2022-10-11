class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = Array.new()
    end

    def full?
        occupants = @occupants.length
        capacity = @capacity

        if  occupants >= capacity
            return true
        else
            return false
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            @occupants << name
            return true
        end
    end



end #room
