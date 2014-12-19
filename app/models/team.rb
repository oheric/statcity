# changed the teamnames to prices instead

class Team 
	include Mongoid::Document

	field :teamname, type: String

	has_many :players
end