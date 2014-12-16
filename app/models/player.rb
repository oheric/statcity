class Player
  include Mongoid::Document

  field :name, type: String
  field :yahooid, type: Integer

  belongs_to :team
end
