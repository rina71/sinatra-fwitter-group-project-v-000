class User < ActiveRecord::Base

  has_many :tweets
  has_secure_password
  def find_by_slug(slug)
    User.find
  end

  def slug
    self.username.gsub(' ','-')
  end
end
