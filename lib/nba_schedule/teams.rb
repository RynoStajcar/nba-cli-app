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
    doc = Nokogiri::HTML(open(@selected_team))
  end

  def scrape_team
    starters = []
    self.team_name = get_page.css("b").first.text
    get_page.css("div.mod-content").each do |i|
      i.css("b").each {|player| starters << player.text}
      self.team_starters = starters
    end
  end

  def starters
    self.team_starters.each {|player| puts player}
  end

  def name
    self.team_name.each {|team| puts team.upcase}
  end

  def search(input)
    if input.downcase.include?("brooklyn")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/bkn'
      scrape_team
    elsif input.downcase.include?("charlotte")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/cha'
      scrape_team
    elsif input.downcase.include?("atlanta")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/atl'
      scrape_team
    elsif input.downcase.include?("boston")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/bos'
      scrape_team
    elsif input.downcase.include?("chicago")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/chi'
      scrape_team
    elsif input.downcase.include?("cleveland")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/cle'
      scrape_team
    elsif input.downcase.include?("dallas")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/dal'
      scrape_team
    elsif input.downcase.include?("denver")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/den'
      scrape_team
    elsif input.downcase.include?("detroit")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/det'
      scrape_team
    elsif input.downcase.include?("golden state")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/gs'
      scrape_team
    elsif input.downcase.include?("houston")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/hou'
      scrape_team
    elsif input.downcase.include?("indiana")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/ind'
      scrape_team
    elsif input.downcase.include?("la")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/lac'
      scrape_team
    elsif input.downcase.include?("los angeles")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/lal'
      scrape_team
    elsif input.downcase.include?("memphis")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mem'
      scrape_team
    elsif input.downcase.include?("miami")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mia'
      scrape_team
    elsif input.downcase.include?("milwaukee")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mil'
      scrape_team
    elsif input.downcase.include?("minnesota")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/min'
      scrape_team
    elsif input.downcase.include?("new orleans")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/no'
      scrape_team
    elsif input.downcase.include?("new york")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/ny'
      scrape_team
    elsif input.downcase.include?("oklahoma city")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/okc'
      scrape_team
    elsif input.downcase.include?("orlando")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/orl'
      scrape_team
    elsif input.downcase.include?("philadelphia")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/phi'
      scrape_team
    elsif input.downcase.include?("phoenix")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/phx'
      scrape_team
    elsif input.downcase.include?("portland")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/por'
      scrape_team
    elsif input.downcase.include?("sacramento")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/sac'
      scrape_team
    elsif input.downcase.include?("san antonio")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/sa'
      scrape_team
    elsif input.downcase.include?("toronto")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/tor'
      scrape_team
    elsif input.downcase.include?("utah")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/utah'
      scrape_team
    elsif input.downcase.include?("washington")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/wsh'
      scrape_team
    else
      puts "Wrong input"

    end
  end

end
