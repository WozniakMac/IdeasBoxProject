class Idea < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::TextHelper

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

  scope :popular, ->{fresh.where('like_counter > dislike_counter').order('dislike_counter - like_counter')}

  def base_uri
    box_idea_path(self.box,self)
  end

  def created_at_as_text
    time_ago_in_words(self.created_at) +" #{I18n.t('ago')}"
  end

  def liked(current_user)
    return 0 if current_user == nil
    self.votes.where("user_id = #{current_user.id} and rate = true").count
  end

  def disliked(current_user)
    return 0 if current_user == nil
    self.votes.where("user_id = #{current_user.id} and rate = false").count
  end


  def as_json(options={})
    json = super(only: [:id, :box_id, :title, :description, :created_at, :updated_at, :status, :like_counter, :dislike_counter] ,:methods => [:base_uri, :created_at_as_text])
    json[:liked] = liked(options[:user])
    json[:disliked] = disliked(options[:user])
    json[:author_name] = self.user.to_s
    json[:comments_count] = I18n.t('comment',count: self.comments.count)
    return json
  end
end
