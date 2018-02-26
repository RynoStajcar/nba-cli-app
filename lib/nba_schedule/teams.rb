class Teams

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
    @team_name = team_page.css("b").first.text
    team_page.css("div.mod-content").each_with_index do |i, index|
      i.css("b").each {|player| starters << player.text}
      @team_starters = starters
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
    if @team_starters == nil
      puts "Try entering team name"
    else
      puts"#{@team_name}:"
      puts ""
      puts "Starters"
      puts "-----------------"
      @team_starters.each {|player| puts player}
    end
  end

  def name
    @team_name.each {|team| puts team.upcase}
  end

end
