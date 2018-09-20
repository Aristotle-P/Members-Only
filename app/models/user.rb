class User < ApplicationRecord
  before_create :set_remember
  has_many :posts
  has_secure_password

  def set_remember
    self.remember_digest = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end

  def remember
    set_remember
    update_attribute(:remember_digest, self.remember_digest)
  end
end
