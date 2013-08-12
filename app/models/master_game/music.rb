class MasterGame::Music < ActiveRecord::Base
  belongs_to :score_type
  belongs_to :master_game
  has_one :music_game, through: :score_type
  has_many :music_scores
  has_many :user_scores, through: :music_scores

  validates :title, presence: true
  validates :score_type_id, presence: true
  validates :master_game_id, presence: true
end
