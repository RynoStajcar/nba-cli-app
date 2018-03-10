class  NbaSchedule::Schedule

  attr_accessor :game_days, :week

  @@all = []

  def initialize
    check_for_games
  end

  def get_page
    doc = Nokogiri::HTML(open('http://www.espn.com/nba/schedule'))
  end

  def self.all
    @@all
  end

  def check_for_games
    if get_page.css("h2.table-caption").children.count < 1
      puts "There are currently no games"
      sleep 3
      exit
    else
      scrape_match_ups
      scrape_game_day
    end
  end

  def scrape_match_ups
    @week = [day_1 = [], day_2 = [], day_3 = [], day_4 = [], day_5 = [], day_6 = [], day_7 = []]
    get_page.css("div.responsive-table-wrap").each_with_index do |i, day|
      i.css("td span").each do |team|
        week[day] << team.text
      end
      @week[day] = week[day].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)"}
    end
  end

  def scrape_game_day
    game_days = []
    get_page.css("h2.table-caption").map {|day| game_days << day.text}
    @game_days = game_days
  end

  def list_game_days
    @game_days.detect.with_index {|day, n| puts "#{n+1}. #{day} -- #{@week[n].count} games"}
  end

  def game_day_games(input)
    @week[input-1].map.with_index {|match, n| puts " #{n+1}  #{match}"}
  end

end
