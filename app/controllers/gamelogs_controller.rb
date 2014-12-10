class GamelogsController < ApplicationController

def index

end


def show
	require 'nokogiri'
	require 'open-uri'

# Want to separate business logic here
# url = 'http://sports.yahoo.com/nba/players/5007/gamelog/'
# doc = Nokogiri::HTML(open(url))

# @gamelogstats = doc.css('.data-container')


	# @gamelogscraper = GameLogScraper.new('http://sports.yahoo.com/nba/players/5007/gamelog/')
	# @gamelogstats = @gamelogscraper.get_class_items('.data-container')
end

def playerlog
	require 'nokogiri'
	require 'open-uri'

end

def playerusage
	require 'nokogiri'
	require 'open-uri'
end

def pace
	require 'nokogiri'
	require 'open-uri'
end
end
