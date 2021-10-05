class Stats

    def initialize()

    end

    # This is the history show reel that is displayed after the initial menu is completed.
    def camp_stats()
        puts 
        puts "Broken Bones since Jan 2020".colorize(:light_yellow) + " [673]".colorize(:green)
        puts
        sleep(1)
        puts "n00bs turned Pro since Jan 2020".colorize(:light_yellow) + " [243]".colorize(:cyan)
        puts
        sleep(1)
        puts  "Cheeseburger meals consumed in the last 52 weeks".colorize(:light_yellow) + " [22m]".colorize(:green)
        puts
        sleep(1)
        puts "Current Shred Lords (students)".colorize(:light_yellow) + " [1063]".colorize(:magenta)
        puts
        sleep(1)
        puts "Previous Shred Lords (students)".colorize(:light_yellow) + " [1.5m]".colorize(:blue)
        puts
        sleep(1)
        puts "Homework completed since camp started".colorize(:light_yellow) + " [0]\n".colorize(:red)
        sleep(1)
    end
end