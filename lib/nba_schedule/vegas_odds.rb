require "pry"
require 'nokogiri'
require 'open_uri_redirections'

class Cli::VegasOdds

  attr_accessor :date

  def initialize
    scrape_odds
  end

  def get_page
    doc = Nokogiri::HTML(open('https://www.oddsshark.com/nba/odds'))
  end

  def scrape_odds
    all = []
    home = []
    away = []
    get_page.css("div.op-left-column-wrapper").each do |i|
      self.date = i.css("span").first.text
      i.css("span a").collect do |i|
        all << i.text
      end
      home << all[0..1]
    #binding.pry
    end
  end


end
