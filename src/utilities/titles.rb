require "tty-font"
require_relative "../classes/booking_controller.rb"

    #  This is how I can clear the terminal screen when and if required
    def clear_term
        puts "\e[2J\e[f" # Found this block of code on ruby-forums.com
    end

    # This is my main menu welcome message.
    def welcome()
        clear_term
        font = TTY::Font.new(:doom)
        puts
        puts "---".colorize(:light_magenta) *22
        puts " " *28 + "WELCOME TO".colorize(:light_yellow)
        puts font.write("BONE DEATH").colorize(:light_magenta)
        puts " " *24 + "SKATEBOARD ACADEMY".colorize(:light_yellow)
        puts "---".colorize(:light_magenta) *22
        puts
    end

    # If a user is not 16 and above then.
    def not_age
        font = TTY::Font.new(:doom)
        puts clear_term
        puts font.write("WRECKED").colorize(:red)
        puts "Sorry my dude, go get your Mum to continue.."
        puts "\n Press any key to go back to the main menu"
        gets.chomp
    end

    # This is my main booking system menu title.
    def new_book()
        font = TTY::Font.new(:doom)
        puts
        puts "---" *22
        puts font.write(" "*7 +"BOOK NOW").colorize(:blue)
        puts font.write("SHRED LATER").colorize(:blue)
        puts " "*20 + "Terms & Conditions apply"
        puts "---" *22
        puts
    end

    # This is my title for the locations section.
    def loc_ati_on
        font = TTY::Font.new(:doom)
        puts font.write("LOCATION").colorize(:red)
        puts font.write("STATION").colorize(:red)
    end

    # This title displays "n00bs" when the user selects the menu option to view students currently enrolled at selected campus.
    def stu_dents()
        font = TTY::Font.new(:doom)
        puts
        puts "---" *13
        puts font.write("N00BS").colorize(:blue)
        puts "---" *13
        puts
    end

    # This title is displayed when the use 'exits' the program.
    def good_bye
        font = TTY::Font.new(:doom)
        puts clear_term
        puts font.write("LATER!!").colorize(:red)
    end

    # This title is displayed if the user is a student and is above the age of 16.
    def us_them
        font = TTY::Font.new(:doom)
        puts clear_term
        puts font.write("ABOUT  US").colorize(:blue)
    end

    # This title is displayed is the user is a parent or guardian of the student.
    def guar_dian
        font = TTY::Font.new(:doom)
        puts clear_term
        puts font.write("ELDERLEGEND!!").colorize(:blue)
    end