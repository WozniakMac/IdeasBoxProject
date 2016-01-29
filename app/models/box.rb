class Box < ActiveRecord::Base
  belongs_to :user
  has_many :ideas

  validates :name, length: { in: 4..20 }
  validates :description, length: { in: 10..20000 }

  paginates_per 5

  scope :top5, -> {
        select('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at, count(ideas.id) AS ideas_count').
            joins('left join ideas on ideas.box_id = boxes.id').
            group('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at').
            order('ideas_count DESC').
            limit(5) }

  scope :top, -> {
        select('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at, count(ideas.id) AS ideas_count').
            joins('left join ideas on ideas.box_id = boxes.id').
            group('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at').
            order('ideas_count DESC') }

  scope :top10, -> {
    select('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at, count(ideas.id) AS ideas_count').
        joins('left join ideas on ideas.box_id = boxes.id').
        group('boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at').
        order('ideas_count DESC').
        limit(10) }

end
