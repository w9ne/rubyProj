#Game class
class Game
    attr_reader :title, :year, :rating
    attr_accessor :available

    #intialize
    def initialize(title, year, rating)
        @title = title
        @year = year
        @rating = rating
        @available = true
    end

    #checkout game
    def checkout
        @available = false
    end 

    #return game
    def returnGame
        @available = true
    end

    def gameStatus
        status = @available ? "Available" : "Unavailable"
        <<~EOF
            #{@title} released in the year #{@year}, with a rating of #{@rating}
            (#{status})
        EOF
    end
end

#subclass to game (a seperation of retro and modern)
class RetroGame < Game
  attr_reader :platform

  # grabbing "game" class title year and rating with the addition of platform
  def initialize(title, year, rating, platform)
    super(title, year, rating)
    @platform = platform
  end

  #Borrows game status from parent class, with addition of platform string
  def gameStatus
    base = super
    base + "  [Retro - Platform: #{@platform}]\n"
  end
end

# modern game is similar
class ModernGame < Game
  attr_accessor :has_dlc

  def initialize(title, year, rating, has_dlc)
    super(title, year, rating)
    @has_dlc = has_dlc
  end

  def gameStatus
    base = super
    dlc_text = @has_dlc ? "Has DLC" : "No DLC"
    base + "  [Modern - #{dlc_text}]\n"
  end
end

# Actual game lib
class GameLibrary

    #init list
    def initialize
        @games = []
    end

    #add game to list
    def addGame(game)
        @games << game
    end

    #lists out games
    def list_games
        @games.each { |game| puts game.gameStatus }
    end

    #title locator
    def searchGameTitle
        @games.find { |game| game.title == title}
    end

    #Print games name?
    def listGameTitle
        @games.each { |game| puts game.title}
    end
end



# test area
gameLib = GameLibrary.new

#retro
gameLib.addGame(RetroGame.new("Mario", "1980", "9/10", "NES"))
gameLib.addGame(RetroGame.new("Ace Combat Zero", "2006", "10/10", "PS2"))

#modern
gameLib.addGame(ModernGame.new("Forza Horizon 6", "2026", "7/10", false))
gameLib.addGame(ModernGame.new("Sekiro: Shadows Die Twice", "2019", "10/10", false))

gameLib.list_games #lists game statuses