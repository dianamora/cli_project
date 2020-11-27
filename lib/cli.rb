#this is what communicates with the user, controller
require 'pry'

class Cli 

    def start
        puts " 
        This is a galaxy of wondrous aliens, bizarre monsters, strange Droids, 
            powerful weapons, great heroes, and terrible villains.  It is a
                galaxy of fantastic worlds,  magical devices, vast 
                    fleets, awesome machi-nery, terrible 
                        conflict, and unending hope.              .         .
       .        .          .    .    .            .            .                   .
                      .               ..       .       .   .             .
        .      .     T h i s   i s   t h e   g a l a x y   o f   . . .             .
                            .              .       .                    .      .
       .        .               .       .     .            .
                             S T A R  W A R S
       "
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
        input = character.to_i 
        
        if person == nil && !(1...10).include?(input)
            invalid_entry
        elsif person == nil && (1...10).include?(input)
            person = Characters.all[input -1]
            # binding.pry
        end
        person.update_character #ideally, would incorporate a 'check' to see if info is already there (if someone asks for Luke twice)
            puts "Name: #{person.name}"
            puts "Gender: #{person.gender}"
            puts "Birth Year: #{person.birth_year}"
        
    end


    def goodbye
        puts "May the force be with you"
    end

    def invalid_entry
        puts "invalid entry, try again"
    end

end




# input = gets.chomp
#     index = input_to_index(input)
