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
      input = gets.strip
      case input
      when "1"
        loop do
        space
        puts"#{nba.first_game_day}"
        puts "------------------------"
        nba.first_day
        detailed_menu
        end
      when "2"
        loop do
        space
        puts"#{nba.second_game_day}"
        puts "------------------------"
        nba.second_day
        detailed_menu
        end
      when "3"
        loop do
        input = nil
        space
        puts"#{nba.third_game_day}"
        puts "------------------------"
        nba.third_day
        detailed_menu
        end
      when "4"
    end
  end

  def match_up_info(input)
    input = Teams.new(input)
    space
    puts"#{input.team_name}:"
    puts ""
    puts "Starters"
    puts "-----------------"
    input.starters
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
