class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :boxes 
  has_many :ideas
  has_many :votes
  has_many :comments

  def is_owner?(model_item)
  	model_item.user == self
  end

  def is_admin?
  	self.role == 1
  end

end
