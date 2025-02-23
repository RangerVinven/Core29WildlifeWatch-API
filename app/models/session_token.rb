class SessionToken < ApplicationRecord
  belongs_to :user
  before_create :generate_token

  def expired?
    expires_at < Time.current
  end

  private

  def generate_token
    self.token = SecureRandom.hex(32)  # Generates a random token
    self.expires_at ||= 7.days.from_now # Token expires in 7 days
  end
end
