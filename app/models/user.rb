class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :boxes
  has_many :ideas
  has_many :votes
  has_many :comments
  SIZES = { high: "200", medium: "78", thumb: "40" }

  has_attached_file :avatar, styles: { high: "200x200>", medium: "78x78>", thumb: "40x40>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  include Gravtastic
  gravtastic

  validates :username, length: { in: 4..100 }
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

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.new
        user.username = data["name"]
        user.provider = access_token.provider
        user.email = data["email"]
        user.uid = access_token.uid
        user.password = Devise.friendly_token[0,20]
        unless user.valid?
          user.make_username_valid
        end
        user.save
        user
      end
    end
  end

  def self.find_for_facebook(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.new
        user.username = data["name"]
        user.provider = access_token.provider
        user.email = data["email"]
        user.uid = access_token.uid
        user.password = Devise.friendly_token[0,20]
        unless user.valid?
          user.make_username_valid
        end
        user.save
        user
      end
    end
  end

  def make_username_valid
    self.username = self.username.gsub(/[^a-zA-Z0-9]/, "")
    self.username = self.username + Random.new.rand(1000..9999) if self.username.length < 4
    until User.where(:username => self.username).empty?
      self.username = self.username + Random.new.rand(1..9)
    end
  end
end
