class Idea < ActiveRecord::Base
  has_attached_file :photo, styles: { high: "752x485>", medium: "368x237>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

  before_save :set_color

  paginates_per 5

  validates :title, length: { in: 4..200 }
  validates :description, length: { in: 10..20000 }

  enum status: {
       fresh: 1,
       planned: 2,
       in_progress: 3,
       completed: 4,
       canceled: 5
      }

  scope :popular, ->{fresh.where('like_counter > dislike_counter').order('dislike_counter - like_counter')}

  private
    def set_color
      self.color ||= Random.new.rand(1..19)
    end
end
