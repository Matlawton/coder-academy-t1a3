require 'tty-box'
require 'tty-prompt'
require "colorize"
require "tty-progressbar"
require_relative "../utilities/camp_stats.rb"
require_relative "booking.rb"

# Booking controller is my main controller that handles all the booking information and the booking menu UI
class BookingController

    attr_reader :user_name, :user_age, :campus, :semester_dates

    def initialize()
        @book_menu = { 
            "Create a Booking" => 1,
            "View an existing Booking" => 2,
            "Delete an existing Booking" => 3,
            "View current number of Enrolments" => 4,
            "View Campus Locations" => 5,
            "Exit" => 6
        }
    end

    def main_view()
        location = Location.new
        prompt = TTY::Prompt.new
        bar = TTY::ProgressBar.new("Your Booking Progress [:bar]".colorize(:blue), bar_format: :asterisk, total: 10)

        book_menu_selection = prompt.select("What would you like to do?", @book_menu)
            
        case book_menu_selection
        # The beginning of our booking system. Enter Name.
        when  1
            new_book()
            1.times do
                sleep(1)
                bar.advance  # increases by 1
            end
            puts "\n\nPlease enter the name of student:"
            user_name = gets.chomp

            if user_name != nil
                puts " >> #{user_name} sounds like the name of a Shred Lord!".colorize(:magenta)     
                2.times do
                    sleep(1)
                    bar.advance  
                end
                puts "\n\nYOU MUST BE 16+ TO MAKE A BOOKING!".colorize(:light_red)  
                puts "\nPlease enter the age of student:"  
                user_age = gets.chomp.to_i   
                puts " >> You entered #{user_age} ... that's cool..".colorize(:green)  
            end
            if user_age < 16
                not_age()
                menu()
            end

            # LOCATION. 
            if user_age != nil
                3.times do
                    sleep(1)
                    bar.advance 
                end

            prompt = TTY::Prompt.new
            select_loc = { 
                "Sydney - Five Dock" => 1,
                "Melbourne - CBD" => 2,
                "Phobos - Satellite of Mars" => 3,
            }
            loc_from_user = prompt.select("\nPlease select your campus location", select_loc)

            case loc_from_user
            when  1
                puts "Only Legends >> Sydney".colorize(:magenta)
                campus = "Sydney - Five Dock"            
            when 2
                puts "Locals choice >> Melbourne".colorize(:magenta)
                campus = "Melbourne - CBD"
            when 3
                puts "To the moon my guy!".colorize(:cyan)
                campus = "Phobos - Satellite of Mars"
            end
        
            puts " >> #{campus} is one the best!".colorize(:red)

            end

            # CAMPUS           
            if campus != nil
                5.times do
                    sleep(1)
                    bar.advance 
                  end
            prompt = TTY::Prompt.new
            select_sem = { 
            "January 2022 - June 2022" => 1,
            "July 2022 - December 2022)" => 2
            }
            sem_from_user = prompt.select("Please select your semester dates", select_sem)
    
        case sem_from_user
            when  1
                puts "You selected >> Term 1" 
                semester_dates = "January 2022 - June 2022"    
            when 2
                puts "you selected >> Term 2"
                semester_dates = "July 2022 - December 2022)"
        end
                puts " >> Hells yeah, you chose #{semester_dates}!".colorize(:red)

            end
            if campus != nil
                new_booking = Booking.new(user_name, user_age, campus, semester_dates)
                current_bookings = Booking::BOOKINGS
                puts "\nPlease review your booking and then press 'Enter' to confirm when you are happy :) \n\n"
                sleep(1)
                i = 0
                current_bookings.each {|x|
                    print TTY::Box.frame "Booking No: #{i += 1}".colorize(:light_magenta), "Name: #{x.name}", "Age: #{x.age}", "Location: #{x.locations}", "Semester: #{x.semester}", "Cost = " + "AUD $9.99".colorize(:yellow)
                }
                puts "(Please press 'Enter' to continue)"
                gets.chomp
                clear_term
                puts "Thank you for making a booking and taking the first step to become a Shred Lord!!\n\n".colorize(:yellow)
                main_view()
            
            end

        when 2
            current_bookings = Booking::BOOKINGS
            clear_term()
            puts "Here is your current booking information. \n\n"
            sleep(1)
            i = 0
            current_bookings.each {|x|
                print TTY::Box.frame "Booking No: #{i += 1}".colorize(:light_magenta), "Name: #{x.name}", "Age: #{x.age}", "Location: #{x.locations}", "Semester: #{x.semester}", "Cost = " + "AUD $9.99".colorize(:yellow)
        }
        if current_bookings.length < 1
            puts "Sorry, but you have not made a booking yet!\n\n".colorize(:red)
            puts "Why don't we get started and create a booking!!\n\n".colorize(:cyan)
            main_view()

        end
        
        puts "press enter to return to main menu"
        gets
        clear_term()
        main_view()

        when 3
            def delete_book
                clear_term
                current_bookings = Booking::BOOKINGS
                if current_bookings.length < 1
                    puts "Sorry, but you have not made a booking yet!\n".colorize(:red)
                    puts "Why don't we get started and create a booking!!\n\n".colorize(:cyan)
                    main_view()
        
                else
                i = 0
                puts "Whould you like to delete a booking?"
                puts "Please select which booking to delete by typing the booking number(eg, '2')".colorize(:light_cyan)
                current_bookings.each {|x|
                    print TTY::Box.frame "Booking No: #{i += 1}".colorize(:light_magenta), "Name: #{x.name}", "Age: #{x.age}", "Location: #{x.locations}", "Semester: #{x.semester}", "Cost = " + "AUD $9.99".colorize(:yellow)
                }
                puts "Please select which booking to delete by typing the booking number(eg, '2')".colorize(:light_cyan)
                input = gets.chomp
                index = input.to_i-1
                current_bookings.delete_at(index)
                clear_term
                puts "You deleted booking number #{index+1}!\n\n".colorize(:light_magenta)
                main_view()
            end
            end
            delete_book()
          
        when 4
            clear_term()
            stu_dents()
            puts "Are you interested in knowing how many other students have enrolled at your campus and chosen semester? \n\n"  
            current_bookings=Booking::BOOKINGS
            if current_bookings.length < 1
                puts "Sorry there are no camp stats at the moment\n\n".colorize(:red)
                puts "Why don't we get started and create a booking!!\n\n".colorize(:cyan)
                main_view()
            else
                puts "There are currently #{current_bookings.length} students enrolled with us that are attending your chosen semester and campus.\n\n"
                main_view()
            end
        when 5
            clear_term()
            loc_ati_on()
            puts "\nHere is a list of our current and future campus locations: \n"     
            puts "\nSydney - Five Dock\n\n".colorize(:green)
            puts "Melbourne - CBD\n\n".colorize(:green)
            puts "Phobos - Satellite of Mars\n\n".colorize(:green)
            puts "Coder Academy Labs - Under Construction\n\n".colorize(:yellow)    
            main_view()
        when 6
            clear_term()
            good_bye()
            puts "Thank you for choosing Bone Death Academy!\n\n"
            sleep(1)
            exit
        end

@booking = Booking.new(user_name, user_age, campus, semester_dates)
       end
end


