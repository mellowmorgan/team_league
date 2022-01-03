class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  belongs_to :game
end