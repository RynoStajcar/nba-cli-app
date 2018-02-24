require "pry"
require 'nokogiri'
require 'open_uri_redirections'

class Teams

  attr_accessor :team_name, :team_starters

  @starters = []

  def initialize(input)
    search(input)
    scrape_team
  end

  def get_page
    doc = Nokogiri::HTML(open('http://www.espn.com/nba/team/depth/_/name/bkn'))
  end

  def team_page
    doc = Nokogiri::HTML(open(@selected_team))
  end

  def scrape_team
    starters = []
    self.team_name = team_page.css("b").first.text
    team_page.css("div.mod-content").each do |i|
      i.css("b").each {|player| starters << player.text}
      self.team_starters = starters
    end
  end

  def search(input)
    teams = []
    get_page.css("select.select-box option").each do |i|
    if i.text.downcase.split(" ").include?(input)
        @selected_team = i.values[0]
        @selected_team.insert(0,"http:")
        scrape_team
    else
      end
        binding.pry
    end
  end

  def starters
    self.team_starters.each {|player| puts player}
  end

  def name
    self.team_name.each {|team| puts team.upcase}
  end

end
