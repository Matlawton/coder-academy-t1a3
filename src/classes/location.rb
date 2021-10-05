class Location

    # Currently only three locations.
    def locations
        prompt = TTY::Prompt.new
        select_loc = { 
            "Sydney - Five Dock" => 1,
            "Melbourne - CBD" => 2,
            "Phobos - Satellite of Mars" => 3,
        }
        loc_from_user = prompt.select("Please select your campus location", select_loc)
    
        case loc_from_user
        when  1
            puts "You selected >> Sydney"
            puts "Press 'Enter' to confirm"
            return "Sydney - Five Dock"             
        when 2
            puts "you selected >> Melbourne"
            puts "Press 'Enter' to confirm" 
        when 3
            puts "To the moon my guy!"
            puts "Press 'Enter' to confirm" 
        end
    end
end
