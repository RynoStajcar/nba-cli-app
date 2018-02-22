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
    if input.downcase.include?("b"&&"n"&&"k")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/bkn'
      scrape_team
    elsif input.downcase.include?("c"&&"h"&&"t")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/cha'
      scrape_team
    elsif input.downcase.include?("a"&&"l"&&"t")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/atl'
      scrape_team
    elsif input.downcase.include?("b"&&"o"&&"s")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/bos'
      scrape_team
    elsif input.downcase.include?("c"&&"h"&&"i")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/chi'
      scrape_team
    elsif input.downcase.include?("c"&&"l"&&"e")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/cle'
      scrape_team
    elsif input.downcase.include?("d"&&"a"&&"l")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/dal'
      scrape_team
    elsif input.downcase.include?("d"&&"e"&&"n")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/den'
      scrape_team
    elsif input.downcase.include?("d"&&"e"&&"t")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/det'
      scrape_team
    elsif input.downcase.include?("g"&&"s"&&"w")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/gs'
      scrape_team
    elsif input.downcase.include?("h"&&"o"&&"u")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/hou'
      scrape_team
    elsif input.downcase.include?("i"&&"n"&&"d")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/ind'
      scrape_team
    elsif input.downcase.include?("l"&&"a"&&"c")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/lac'
      scrape_team
    elsif input.downcase.include?("l"&&"a")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/lal'
      scrape_team
    elsif input.downcase.include?("m"&&"e"&&"g")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mem'
      scrape_team
    elsif input.downcase.include?("m"&&"i"&&"a")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mia'
      scrape_team
    elsif input.downcase.include?("m"&&"i"&&"l")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/mil'
      scrape_team
    elsif input.downcase.include?("m"&&"i"&&"n")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/min'
      scrape_team
    elsif input.downcase.include?("n"&&"o")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/no'
      scrape_team
    elsif input.downcase.include?("n"&&"e"&&"w")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/ny'
      scrape_team
    elsif input.downcase.include?("o"&&"k"&&"c")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/okc'
      scrape_team
    elsif input.downcase.include?("o"&&"r"&&"l")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/orl'
      scrape_team
    elsif input.downcase.include?("p"&&"h"&&"i")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/phi'
      scrape_team
    elsif input.downcase.include?("p"&&"h"&&"x")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/phx'
      scrape_team
    elsif input.downcase.include?("p"&&"o"&&"r")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/por'
      scrape_team
    elsif input.downcase.include?("s"&&"a"&&"c")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/sac'
      scrape_team
    elsif input.downcase.include?("s"&&"a"&&"t")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/sa'
      scrape_team
    elsif input.downcase.include?("t"&&"o"&&"r")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/tor'
      scrape_team
    elsif input.downcase.include?("u"&&"t"&&"a")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/utah'
      scrape_team
    elsif input.downcase.include?("w"&&"s"&&"h")
      @selected_team = 'http://www.espn.com/nba/team/depth/_/name/wsh'
      scrape_team
    end
  end

end
