class  NbaSchedule::Schedule

  attr_accessor :game_days

  def initialize
    scrape_game_day
  end

  def get_page
    doc = Nokogiri::HTML(open('http://www.espn.com/nba/schedule'))
  end

  def scrape_game_day
    week = [day_1 = [], day_2 = [], day_3 = [], day_4 = [], day_5 = [], day_6 = [], day_7 = []]
    get_page.css("div.responsive-table-wrap").each_with_index do |i, day|
      i.css("td span").each do |team|
        week[day] << team.text
      end
    end
    @first_day_line_up = week[0].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @second_day_line_up = week[1].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @third_day_line_up = week[2].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @forth_day_line_up = week[3].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @fifth_day_line_up = week[4].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @sixth_day_line_up = week[5].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
    @seventh_day_line_up = week[6].each_slice(2).collect {|top| "#{top.first} vs #{top.last}(h)" }
  end

  def game_day
    game_days = []
      if get_page.css("h2.table-caption").children.count < 1
        puts "There are currently no games"
        sleep 3
        exit
      else
        get_page.css("h2.table-caption").map.with_index {|day, n| game_days.push("#{n+1}. #{day.text} -- #{how_many(n)} games")}
      end
    @game_days = game_days
    @game_days.detect {|day| puts "#{day}"}
  end

  def how_many(day)
    case day
    when 0
      @first_day_line_up.count
    when 1
      @second_day_line_up.count
    when 2
      @third_day_line_up.count
    when 3
      @forth_day_line_up.count
    when 4
      @fifth_day_line_up.count
    when 5
      @sixth_day_line_up.count
    when 6
      @seventh_day_line_up.count
    end
  end

  def game_day_games(input)
    case input
    when 1
      @first_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 2
      @second_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 3
      @third_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 4
      @forth_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 5
      @fifth_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 6
      @sixth_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    when 7
      @seventh_day_line_up.map.with_index {|match, n| puts " #{n+1}  #{match}"}
      option_list
    end
  end

  def option_list
    puts ""
    puts "Type team name for team line up"
    puts "Type 'menu' to go back to main menu or type exit"
  end

end
