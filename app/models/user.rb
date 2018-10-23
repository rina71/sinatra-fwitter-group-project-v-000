class User < ActiveRecord::Base

  has_many :tweets
  has_secure_password
  def self.find_by_slug(slug)

    a = User.all.map{|user| user.slug == slug}
    a[0]
  end

  def slug

    self.username.downcase.gsub(' ','-')
  end
end
