# require "./test2"

# THIS FILE IS NOT CURRENTLY BEING USED.

class NameController 
    def self.user_name
        user_name_attempt = 0
        while user_name_attempt < 3
            puts "Hey, whats your name?"
            user_name = gets.chomp.capitalize
            # If the user types in a name then the loop will stop
            if user_name != "" 
               AgeController.age
                break

            # continues the loop until the user types in a name, or until the user_name_attempt is greater than three. 
            else
                user_name_attempt += 1
                if user_name_attempt == 3
                   
                    puts "\n You are nameless, do you need some suggestions?"
                    user_name = "Shred Lord #00761"
                else
                    puts "ERROR!! >> Please enter the name of the student:"
                end
            end  
        end
    end  
end 
