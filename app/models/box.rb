class Box < ActiveRecord::Base
  belongs_to :user
  has_many :ideas

  validates :name, length: { in: 4..20 }
  validates :description, length: { in: 10..20000 }

  paginates_per 5
  is_impressionable

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

  def ideas_trending?(days)
    self.ideas.where('created_at >= ?', DateTime.now - days).count > self.ideas.where('created_at >= ?', DateTime.now - 2*days).where('created_at < ?', DateTime.now - days).count
  end

  def views_trending?(days)
    self.impressionist_count(:start_date=>DateTime.now - days) > self.impressionist_count(:start_date=>DateTime.now - 2*days, :end_date=> DateTime.now - days)
  end

  def ideas_trending(days)
    new = self.ideas.where('created_at >= ?', DateTime.now - days).count
    old = self.ideas.where('created_at >= ?', DateTime.now - 2*days).where('created_at < ?', DateTime.now - days).count
    if old == 0 and new > 0
      return '100%'
    elsif old == 0 and new == 0
      return '0%'
    else
      return (((new.to_f - old.to_f)/old.to_f) * 100).to_s(2) + '%'
    end
  end

  def views_trending(days)
    new = self.impressionist_count(:start_date=>DateTime.now - days)
    old = self.impressionist_count(:start_date=>DateTime.now - 2*days, :end_date=> DateTime.now - days)
    if old == 0 and new > 0
      return '100%'
    elsif old == 0 and new == 0
      return '0%'
    else
      return (((new.to_f - old.to_f)/old.to_f) * 100).to_s(2) + '%'
    end
  end

end
