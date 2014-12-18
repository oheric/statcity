class Team 
	include Mongoid::Document

	field :teamname, type: String

	has_many :players
end