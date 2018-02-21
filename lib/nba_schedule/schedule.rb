require "pry"
require 'nokogiri'
require 'open_uri_redirections'
class  Schedule

attr_accessor :first_game_day, :first_day_line_up

  def initialize
    self.scrape_game_day
  end

  def get_page
    doc = Nokogiri::HTML(open('http://www.espn.com/nba/schedule'))
  end

  def scrape_game_day
    day_1 = []
    day_2 = []
    day_3 = []
    self.first_game_day = get_page.css("h2.table-caption")[0].text
    get_page.css("div.responsive-table-wrap").each_with_index do |i, day|
      if day == 0
        i.css("td span").collect {|team| day_1 << team.text}
      elsif day == 1
        i.css("td span").collect {|team| day_2 << team.text}
      elsif day == 2
        i.css("td span").collect {|team| day_3 << team.text}
      end
    end
    binding.pry
  end




end









# def scrape_game_week
#   self.first_game_day = get_page.css("h2.table-caption")[0].text
#   self.second_game_day = get_page.css("h2.table-caption")[1].text
#   self.third_game_day = get_page.css("h2.table-caption")[2].text
#   self.fourth_game_day = get_page.css("h2.table-caption")[3].text
#   self.fifth_game_day = get_page.css("h2.table-caption")[4].text
# end
