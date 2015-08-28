class Idea < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

  enum status: {
       fresh: 1,
       planned: 2,
       in_progress: 3,
       completed: 4,
       canceled: 5
      }

  def base_uri
    box_idea_path(self.box,self)
  end

  def created_at_as_text
    time_ago_in_words(self.created_at)
  end

  def as_json(options={})
    super(only: [:id, :box_id, :title, :description, :created_at, :updated_at, :status, :like_counter, :dislike_counter] ,:methods => [:base_uri, :created_at_as_text])
  end
end
