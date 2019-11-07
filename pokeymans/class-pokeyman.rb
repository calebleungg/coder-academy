class Pokeyman
    attr_accessor :name, :health, :lvl, :exp, :happiness, :hunger, :max_health, :lvl_caps

    def initialize(name)
        @name = name
        @health = rand(60..100)         # starting health is generated randomly between 60-100
        @lvl = 5
        @exp = 0
        @happiness = 100
        @hunger = 0
        @max_health = @health
        
        # hash storing level up information and additional stats gained, key is the exp cap 
        @lvl_caps = {100 => {hp_up: 20}, 200 => {hp_up: 40}, 400 => {hp_up: 80}, 800 => {hp_up: 150}, 1600 => {hp_up: 300} }
    end

end
