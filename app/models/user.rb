class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :boxes
  has_many :ideas
  has_many :votes
  has_many :comments

  validates :username, length: { in: 4..20 }
  validates :username, exclusion: { in: %w(admin superuser) }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def is_owner?(model_item)
  	model_item.user == self
  end

  def is_admin?
  	self.role == 1
  end

  def to_s
    username.nil? ? email : username
  end

end
