class User < ActiveRecord::Base

  has_many :tweets
  has_secure_password
  def find_by_slug
    User.find
  end

  def slug
    binding.pry
    self.username.gsub(' ','-')
  end
end
