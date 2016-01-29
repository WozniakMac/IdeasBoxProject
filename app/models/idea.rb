class Idea < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::TextHelper
  include ApplicationHelper

  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

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

end
