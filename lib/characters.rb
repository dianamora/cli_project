#where objects are created and stored for user display, aka StarWars characters

class Characters 
    attr_accessor :name, :gender, :url, :birth_year
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    # def initialize(attr_hash)
    #     attr_hash.each do |k, v|
    #         self.send("#{k}=", v) if self.respond_to?("#{k}=")
    #     end
    #     save
    # end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |character|
            character.name.downcase == name.downcase
        end
    end

    def update_character
        info = Api.update_character(self.url)
        @birth_year = info["birth_year"]
        @gender = info["gender"]
     
    end

end