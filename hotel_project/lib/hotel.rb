require_relative "room"

class Hotel

    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new()
        rooms.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        words = @name.split(" ")
        capitalized = words.map {|ele| ele[0].upcase + ele[1..-1]}
        capitalized.join(" ")

    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room)
        if self.room_exists?(room)
            unless @rooms[room].add_occupant(person)
                puts "sorry, room is full"
            end
            puts "check in successful"
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        #if all hotel rooms are full, return false
        #else, return true
        no_vacancy = @rooms.all? do |name, room|
            room.full?
        end
        if no_vacancy then return false else return true end
    end

    def list_rooms
        #print every room name, with available spaces
        #use available space
        @rooms.each do |name, room|
            puts name + ".*" + room.available_space.to_s
        end
    end
end
