class User < ApplicationRecord
  has_secure_password
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_many :games

  def games_playeds
    self.games.length
  end

  def wins
    self.games.where(won: true).count
  end

  def losses
    self.games.where(won: false).count
  end

end
