class Position 
	include Mongoid::Document

	field :positiontype, type: String

	# belongs_to :team
	# has_many :players
end