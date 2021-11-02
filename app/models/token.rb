class Token < ApplicationRecord
  belongs_to :user

  validates :token, :expires_at, :user_id, presence: true
  after_initialize :generate_token

  private
  def generate_token
    loop do
      self.token = SecureRandom.hex(32)
      break unless Token.where(token: self.token).any?
    end
    self.expires_at ||= 2.hours.from_now
  end
end
