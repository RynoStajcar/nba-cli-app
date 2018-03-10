class NbaSchedule::Teams

  attr_accessor :selected_team, :team_name, :team_starters

  @@all = []



  def initialize(input)
    search(input)
    @@all << self
  end

  def self.all
    @@all
  end

  def get_page
    doc = Nokogiri::HTML(open('http://www.espn.com/nba/team/depth/_/name/bkn'))
  end

  def team_page
    doc = Nokogiri::HTML(open(@selected_team))
  end

  def scrape_team_name
    @team_name = team_page.css("b").first.text
  end

  def scrape_team_starters
    starters = []
    team_page.css("div.mod-content").each_with_index do |i, index|
      i.css("b").each {|player| starters << player.text}
      @team_starters = starters
    end
  end

  def search(input)
    input = input.downcase
    get_page.css("select.select-box option").each do |i|
    if i.text.downcase.split(" ").include?(input.split(" ").first || input.split(" ").last)
        @selected_team = i.values[0]
        @selected_team.insert(0,"http:")
        scrape_team_name
        scrape_team_starters
      end
    end
  end

  def name
    @team_name
  end

  def starters
    @team_starters.detect {|player| puts player}
  end

end
