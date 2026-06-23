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
    def searchGameTitle(search_title)
        @games.find { |game| game.title == search_title}
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


# Menu Area
def mainMenu(library)
    #loops my choices and choice gets inputted
    loop do
        puts "\n=== Game Library Menu ==="
        puts "1. List all games"
        puts "2. Add a new game"
        puts "3. Search for a game by title"
        puts "4. Checkout a game"
        puts "5. Return a game"
        puts "6. Quit"
        print "Choose an option: "
        choice = gets.chomp

        #case choice selection
        case choice
        when "1"
            library.list_games
        when "2"
            print "Title: "
            title = gets.chomp
            print "Year: "
            year = gets.chomp
            print "Rating: "
            rating = gets.chomp
            print "Type (retro/modern): "
            type = gets.chomp.downcase

            # Add game logic
            if type == "retro"
                print "Platform: "
                platform = gets.chomp
                library.addGame(RetroGame.new(title, year, rating, platform))
            else
                print "Has DLC? (y/n): "
                has_dlc = gets.chomp.downcase == "y"
                library.addGame(ModernGame.new(title, year, rating, has_dlc))
            end
            puts "Game added!"
        when "3"
             print "Enter title to search: "
            search_title = gets.chomp
            result = library.searchGameTitle(search_title)

            #Search try error
            if result
                puts result.gameStatus
            else
                puts "No game found with that title."
            end

        when "4"
            print "Enter title to checkout: "
            title = gets.chomp
            game = library.searchGameTitle(title)

            #Search try error
            if game
                game.checkout
                puts "#{title} checked out."
            else
                puts "Game not found."
            end
        when "5"

            print "Enter title to return: "
            title = gets.chomp
            game = library.searchGameTitle(title)

            #Search try error
            if game
                game.returnGame
                puts "#{title} returned."
            else
                puts "Game not found."
            end
        
        when "6"
            puts "Thank you for visiting GameStore!"
            break
        else
            puts "Please choose a number from 1-6"
        end
    end
end


#start prog
mainMenu(gameLib)


