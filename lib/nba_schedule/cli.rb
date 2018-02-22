#!/usr/bin/env ruby
require "pry"
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
    input = gets.strip
    case input
    when "1"
      nba.first_day
      puts""
      puts "Type in a team to see their line up"
      input = gets.strip
      input = Teams.new(input)
      #binding.pry
      puts""
      puts"#{input.team_name}:"
      puts ""
      puts "Starters"
      puts "-----------------"
      input.starters
    when "2"
      nba.second_day
      puts""
      puts "Type in a team to see their line up"
    when "3"
      nba.third_day
      puts""
      puts "Type in a team to see their line up"
    end
  end

  def game_info_cavs
    puts "Vegas Odds"
    puts "   Cavs: 146"
    puts "   GSW: -200"
  end

end
