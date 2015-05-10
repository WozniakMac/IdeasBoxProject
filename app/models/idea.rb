class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  has_meny :comments, :votes
end
