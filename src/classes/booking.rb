# This is where I store my bookings for the current session.
class Booking
    
    attr_reader :name, :age, :locations, :semester
    BOOKINGS = []
    
    def initialize(user_name, user_age, campus, semester_dates)
        @name = user_name
        @age = user_age
        @locations = campus
        @semester = semester_dates
        BOOKINGS << self
    end
end


