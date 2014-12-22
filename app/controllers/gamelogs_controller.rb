class GamelogsController < ApplicationController

def index
	@teams = Team.all
	@players = Player.all
	@player = Player.new
	@stats = JSON.parse(HTTParty.get("https://statcityapi.herokuapp.com/playerstats/show").body)


end

def playerlog
	require 'nokogiri' 
	require 'open-uri'
	@players = Player.all

	

	if params[:playerid]
		search_query = URI.escape(params[:playerid])
	# @players.each do |p| 
	url = "http://sports.yahoo.com/nba/players/" + search_query.to_s + "/gamelog/"
	
# nokogiri information	
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

end


# reading from flare.json
def load
	@data = File.read("app/assets/javascripts/flare.json")
	render :json => @data
end

end
