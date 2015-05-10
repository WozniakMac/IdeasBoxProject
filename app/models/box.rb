class Box < ActiveRecord::Base
  belongs_to :user
  has_meny :ideas
end
