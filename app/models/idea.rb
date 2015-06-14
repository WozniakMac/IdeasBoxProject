class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

  def set_status(status)
  	self.status = IDEA_STATUS[status]
  end
end
