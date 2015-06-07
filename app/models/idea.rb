class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  has_many :comments
  has_many :votes

  def set_status(status)
  	self.status = case status
	  	when :new then 1
	  	when :planed then 2
	  	when :inprogress then 3
	  	when :complited then 4
  	end
  end
end
