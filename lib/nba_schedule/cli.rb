#!/usr/bin/env ruby
class Cli

  def nba_menu
    puts "Welcome to NBA Game Day, select which game day you want to see!!"
    nba = Schedule.new
    puts ""
    puts "#{nba.game_day}"
    input = gets.to_i
      if input > nba.game_days.count || input.to_i == 0
        puts "Invalid selection, try entering the number beside the game day"
        sleep 3
        space
        nba_menu
      end
      loop do
      space
      puts"#{nba.game_days[input-1]}"
      puts "------------------------"
      nba.game_day_games(input)
      detailed_menu
    end
  end


  def match_up_info(input)
    teams = Teams.new(input)
    space
    teams.starters
  end

  def detailed_menu
    input = gets.strip
    space
      if input == "menu"
        nba_menu
      elsif input == "exit"
        exit
      else
        match_up_info(input)
        puts""
        puts "Hit enter to go back"
        gets.strip
      end
    end

  def space
    puts ""
    puts ""
    puts ""
  end

end
