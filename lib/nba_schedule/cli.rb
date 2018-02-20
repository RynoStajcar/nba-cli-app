class NbaSchedule::CLI

  def call
    puts "Todays Games!"
    menu
  end

  def menu
    puts "1. Cavs vs GSW, 7:00pm ET"
    puts "2. Rockets vs Mavs 9:30pm ET"
    input = gets.strip
    case input
    when "1"
      puts "Cavs vs GSW"
      game_info_cavs
    end
  end

  def game_info_cavs
    puts "Vegas Odds"
    puts "   Cavs: 146"
    puts "   GSW: -200"
  end

end
