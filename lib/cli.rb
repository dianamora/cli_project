#this is what communicates with the user, controller
require 'pry'

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
            Api.create_characters
            character_list
            menu2
        elsif input == "exit"
            goodbye
        else 
            invalid_entry
            menu
        end
    end

    def menu2
        puts "Would you like to see another character? y or n"
        input = gets.strip.downcase
        if input == "y"
            character_list
            menu2
        elsif input == "n"
            goodbye
        else 
            invalid_entry
        end
    end


    def character_list
        # api = Api.new
        # api.display_character
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
        if person == nil
            invalid_entry
        else 
        person.update_character
            puts "Name: #{person.name}"
            puts "Gender: #{person.gender}"
            puts "Birth Year: #{person.birth_year}"
        end
    end

    def goodbye
        puts "May the force be with you"
    end

    def invalid_entry
        puts "invalid entry, try again"
    end

end
