class Teams

  attr_accessor :team_name, :team_starters

  @starters = []

  def initialize(input)
    search(input)
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
    get_page.css("select.select-box option").each do |i|
    if i.text.downcase.split(" ").include?(input.split(" ").first || input.split(" ").last)
        @selected_team = i.values[0]
        @selected_team.insert(0,"http:")
        scrape_team
      end
    end
  end

  def starters
    if self.team_starters == nil
      puts "Try entering team name"
      #binding.pry
    else
      puts"#{self.team_name}:"
      puts ""
      puts "Starters"
      puts "-----------------"
      self.team_starters.detect {|player| puts player}
    end
  end

  def name
    self.team_name.each {|team| puts team.upcase}
  end

  def all
    @all
  end

end
