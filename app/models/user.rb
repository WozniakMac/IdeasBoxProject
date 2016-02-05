class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :boxes
  has_many :ideas
  has_many :votes
  has_many :comments
  SIZES = { high: "200", medium: "78", thumb: "40" }

  has_attached_file :avatar, styles: { high: "200x200>", medium: "78x78>", thumb: "40x40>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  include Gravtastic
  gravtastic

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

  def get_avatar(size)
    if self.avatar_file_name.nil?
      return self.gravatar_url(secure: false, size: SIZES[size])
    else
      return self.avatar.url(size)
    end
  end

end
