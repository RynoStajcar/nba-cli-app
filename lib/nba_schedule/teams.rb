require "pry"
require 'nokogiri'
require 'open_uri_redirections'

class Teams

  attr_accessor :team_name

  @@nba_teams = []

  def initialize(input)
    search(input)
    scrape_team
  end

  def search(input)
    if input.downcase.include?("b"&&"n"&&"k")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/bkn'
      scrape_team
    end
  end

  def get_page
    doc = Nokogiri::HTML(open(@selected_team))
  end

  def scrape_team
    binding.pry

  end


end
