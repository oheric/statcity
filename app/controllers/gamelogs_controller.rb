class GamelogsController < ApplicationController

def index
	@teams = Team.all
	@players = Player.all
	
	@player = Player.new


end

def playerlog
	require 'nokogiri' 
	require 'open-uri'
	@players = Player.all

	

	if params[:playerid]
		search_query = URI.escape(params[:playerid])
	# @players.each do |p| 
	url = "http://sports.yahoo.com/nba/players/" + search_query.to_s + "/gamelog/"
	
	
	doc = Nokogiri::HTML(open(url))
	@playerstats = doc.css(".data-container")
	@playerinfo = doc.css(".player-info")
	@bio = doc.css(".bio")
	@avgstat = doc.css(".stats li")
	@logo = doc.css(".team-logo @style")
	@photo = doc.css(".player-image img @style")
	end
end


def playerusage
end

def pace
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



def load
	@data = File.read("app/assets/javascripts/flare.json")
	render :json => @data
end

end
