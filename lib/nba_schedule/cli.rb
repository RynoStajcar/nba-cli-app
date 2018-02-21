#!/usr/bin/env ruby
require "pry"
class Cli

  def call
    nba_menu
  end

  def nba_menu
    puts "Next NBA game day"
    nba = Schedule.new
    puts "  #{nba.first_game_day}"
    input = gets.strip

  end

  def game_info_cavs
    puts "Vegas Odds"
    puts "   Cavs: 146"
    puts "   GSW: -200"
  end

end
