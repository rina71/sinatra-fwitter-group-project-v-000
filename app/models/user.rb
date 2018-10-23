class User < ActiveRecord::Base

  has_many :tweets
  has_secure_password
  def find_by_slug(slug)
    User.all.each{|user| user.username.slug = slug}
    name = s
  end

  def slug
    self.username.downcase.gsub(' ','-')
  end
end
