class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin
  private
  def ensure_an_admin
    if User.count.zero?
      raise 'can not delete this one' 
    end
  end
end
