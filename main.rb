#Game class
class Game
    attr_reader :title, :year, :rating
    attr_accessor :available

    #intialize
    def init(title, year, rating)
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
        print <<EOF
            #{@title} released in the year #{@year}, with a rating #{@rating}
            (#{status})
        EOF
    end
end

class GameLibrary

    #init list
    def init
        @games = []
    end

    #add game to list
    def addGame(game)
        @games << game
    end

    #lists out games
    def list_games
        @games.each { |game| puts game}
    end

    #title locator
    def searchGameTitle
        @games.find { |game| game.title == title}
    end
end


# test area
gameLibrary = gameLibrary.new
gameLibrary.addGame(Game.new("Mario", "1980", "9/10"))
gameLibrary.addGame(Game.new("Metal Gear", "2001", "9.5/10"))

gameLibrary.list_games