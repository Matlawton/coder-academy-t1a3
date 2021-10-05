require 'tty-prompt'
require_relative "./utilities/titles.rb"
require_relative "./utilities/camp_stats.rb"
require_relative "./classes/booking_controller.rb"
require_relative "./classes/booking.rb"
require_relative "./classes/location.rb"

    def menu()
        # Welcome to Bone Death Academy!
        welcome

        # What would you like to do?
        prompt = TTY::Prompt.new
        bookingcontroller = BookingController.new
        history = Stats.new
        
        start_menu = { 
            "Are you an aspiring student? (ShredLord)" => 1,
            "Are you the guardian of an aspiring student? (Seasoned)" => 2,
            "Exit" => 3
            }
        response_from_user = prompt.select("Welcome all new shredders, getters and seasoned setters!", start_menu)

        case response_from_user
        when  1
            puts "\nTo make a booking, an aspiring Shred Lord must be over the age of 16".colorize(:red)
            sleep(1)
            puts "\nAre you over the age of 16? (yes/no)".colorize(:light_yellow)
            user_age = gets.chomp
                if user_age == 'no' || user_age == 'n' || user_age == 'No'
                not_age
                menu()  
            else
                puts "What Bone Death Academy is known for!!\n"
                us_them
                sleep(1)
                history.camp_stats
                bookingcontroller.main_view
            end 
        when 2
            guar_dian()
            puts "\n Welcome Guardians of future students \n"
            puts "\n What Bone Death Academy is known for!! \n"
            history.camp_stats
            bookingcontroller.main_view
        when 3
            clear_term()
            good_bye()
            puts "Thank you for choosing Bone Death Academy!\n\n"
            sleep(1)
            exit  
    end
end

menu()
