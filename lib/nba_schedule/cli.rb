#!/usr/bin/env ruby
class Cli

  def call
    nba_menu
  end

  def nba_menu
    puts "Welcome to NBA Game Day, select which of the next 3 game days you want to see!!"
    nba = Schedule.new
    puts ""
    puts "1.  #{nba.first_day_line_up.size} games on #{nba.first_game_day}"
    puts "2.  #{nba.second_day_line_up.size} games on #{nba.second_game_day}"
    puts "3.  #{nba.third_day_line_up.size} games on #{nba.third_game_day}"
    puts "    Type 'exit' to leave menu"
      input = gets.strip
      if input == "1"
        loop do
        space
        puts"#{nba.first_game_day}"
        puts "------------------------"
        nba.first_day
        detailed_menu
        end
      elsif input == "2"
        loop do
        space
        puts"#{nba.second_game_day}"
        puts "------------------------"
        nba.second_day
        detailed_menu
        end
      elsif input == "3"
        loop do
        space
        puts"#{nba.third_game_day}"
        puts "------------------------"
        nba.third_day
        detailed_menu
        end
      elsif input == "exit"
        exit
      else
        space
        puts "Please use 1-3 to select a game day or exit to leave"
        sleep 3
        space
        nba_menu
    end
  end

  def match_up_info(input)
    teams = Teams.new(input)
    space
    teams.starters
  end

  def detailed_menu
    input = gets.strip
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
