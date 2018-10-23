class User < ActiveRecord::Base

  has_many :tweets
  has_secure_password
  def self.find_by_slug(slug)
    User.all.each do |user| 
      if user.slug == slug
    binding.pry
    a[0]
  end

  def slug

    self.username.downcase.gsub(' ','-')
  end
end
