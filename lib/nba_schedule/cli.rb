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
    puts "    Type 'exit' to leave menu"
    while input != "exit"
      input = gets.strip
      nba_menu
      case input
      when "1"
        space
        puts"#{nba.first_game_day}"
        puts "------------------------"
        nba.first_day
        match_up_info
      when "2"
        space
        puts"#{nba.second_game_day}"
        puts "------------------------"
        nba.second_day
        match_up_info
      when "3"
        space
        puts"#{nba.third_game_day}"
        puts "------------------------"
        nba.third_day
        match_up_info
      when "4"
      end
    end
  end

  def match_up_info
    puts""
    puts "Type in a team name to see their line up"
    input = gets.strip
    input = Teams.new(input)
    space
    puts"#{input.team_name}:"
    puts ""
    puts "Starters"
    puts "-----------------"
    input.starters
  end

  def space
    puts ""
    puts ""
    puts ""
  end
end
