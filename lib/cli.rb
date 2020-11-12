#this is what communicates with the user, controller

class Cli 

    def start
        puts "Welcome Padawan"
        puts "To view Star Wars character, enter 'characters'"
        puts "To leave, enter 'exit'"
        menu
    end

    def menu
        input = gets.strip.downcase
        if input == "characters"
            api = Api.new
            api.create_characters
            character_list
            menu
        elsif input == "exit"
            goodbye
        else 
            invalid_entry
        end
    end

    def character_list
        api = Api.new
        api.display_character
        Characters.all.each_with_index do |character, index|
            puts "#{index + 1}. #{character.name}"
        end
        puts ""
        puts ""
        puts "which character would you like to learn about? Enter Name:"
        input = gets.strip.downcase
       

        character_selection(input)
    end

    def character_selection(character)
        person = Characters.find_by_name(character)
        person.each do |n|
            puts "Name: #{n.name}"
            puts "Gender: #{n.gender}"
            puts "Birth Year: #{n.birth_year}"
        end
    end

    def goodbye
        puts "May the force be with you"
    end

    def invalid_entry
        puts "invalid entry, try again"
    end

end
