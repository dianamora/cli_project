#where external data will be brought in, instantiate objects

require 'pry'
require_relative './characters.rb'
class Api 

    # attr_accessor :query

    # def initialize
    #     @query = query
    # end

    def self.fetch_characters
        
        url = "https://www.swapi.tech/api/people/"

        uri = URI(url)
        response = Net::HTTP.get(uri)
        characters = JSON.parse(response)

    end


    def self.update_character(url)
        # url = "https://www.swapi.tech/api/people/#{input}"
        # input = gets.chomp

      
        # case input
        # when "1"
        #     url = "https://www.swapi.tech/api/people/1"
        # when "2"
        #     url = "https://www.swapi.tech/api/people/2"
        # when "3"
        #     url = "https://www.swapi.tech/api/people/3"
        # when "4"
        #     url = "https://www.swapi.tech/api/people/4"
        # when "5"
        #     url = "https://www.swapi.tech/api/people/5"
        # when "6"
        #     url = "https://www.swapi.tech/api/people/6"
        # when "7"
        #     url = "https://www.swapi.tech/api/people/7"
        # when "8"
        #     url = "https://www.swapi.tech/api/people/8"
        # when "9"
        #     url = "https://www.swapi.tech/api/people/9"
        # when "10"
        #     url = "https://www.swapi.tech/api/people/10"
        # else 
        #     url = "https://www.swapi.tech/api/people/#{query}"
        # end

        uri = URI(url)
        response = Net::HTTP.get(uri)
        characters = JSON.parse(response)
        characters["result"]["properties"]
        # binding.pry
    end

    def self.create_characters #displays list of characters 1-10
        character = fetch_characters
        # self.fetch_characters.each{|character| Characters.new character.name}
        character["results"].each{|character| Characters.new(character["name"], character["url"])}
    end

    # def display_character #displays a selected characters' name, gender, and birth year
    #     info = update_character
    #     info["results"].each{|info| Characters.new(info["name"], info["gender"], info["birth year"])}
    # end
  

end
# binding.pry
#index0 of Characters.all



# def self.fetch_characters
    #     response = RestClient.get("https://www.swapi.tech/api/people/")
    #     character_array = JSON.parse(response.body)["results"]
    #     character_array.each do |character|
    #         Characters.new(character)
    #     end
    # end

     # character_array = characters
        # character_array.each do |character|
        #     Characters.new(character)
        # end

        #The following was originally directly under fetch_characters:
        
    # I now have to create a new method that TAKES the information 
    #     we've just obtained about characters, one character at a time, and include another api request (uri=code snippet) 
    #     to request their individual profile URLs and pull the info
    #      we want from those pages (gender, birth year). Then we want to finish by actually displaying that data