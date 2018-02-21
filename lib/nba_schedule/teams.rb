require "pry"
require 'nokogiri'
require 'open_uri_redirections'

class Teams

  attr_accessor :team_name

  @@nba_teams = []

  def initialize
    scrape_team
  end

  def get_page
    doc = Nokogiri::HTML(open('https://basketball.realgm.com/nba/depth-charts'))
  end

  def scrape_team
    get_page.css("h2.clearfix").each do |i|
      @@nba_teams << i.text
    end
    binding.pry
  end
end
