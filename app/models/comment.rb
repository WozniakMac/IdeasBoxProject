class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :comment, length: { in: 4..256 }
end
