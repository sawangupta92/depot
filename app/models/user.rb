class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :ratings

  validates :name, presence: true, uniqueness: true

  # has_secure_password

  after_destroy :ensure_an_admin

  def self.sort(collection, column, direction)
    collection.order(column => direction)    
  end

  private
  
    def ensure_an_admin
      if User.count.zero?
        raise 'can not delete this one' 
      end
    end
end
