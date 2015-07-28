class Idea < ActiveRecord::Base
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

end
