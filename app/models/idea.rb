class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

  IDEA_STATUS = {
      new: 1,
      planed: 2,
      inprogress: 3,
      complited: 4
    }

  def set_status(status)
  	self.status = IDEA_STATUS[status]
  end
end
