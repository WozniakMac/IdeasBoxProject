class Box < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        :name,
        [:name, :id]
    ]
  end

  belongs_to :user
  has_many :ideas

  validates :name, length: { in: 4..40 }
  validates :description, length: { in: 10..5000 }

  paginates_per 5
  is_impressionable

  scope :top10, -> {
    select('boxes.slug, boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at, count(ideas.id) AS ideas_count').
        joins('left join ideas on ideas.box_id = boxes.id').
        group('boxes.slug, boxes.id, boxes.user_id, boxes.name, boxes.description, boxes.created_at, boxes.updated_at').
        order('ideas_count DESC') }

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
      return (((new.to_f - old.to_f)/old.to_f) * 100).to_i.to_s + '%'
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
      return (((new.to_f - old.to_f)/old.to_f) * 100).to_i.to_s + '%'
    end
  end

  def impressionist_count_in_day(date)
    self.impressionist_count(:start_date=>date,:end_date=>date.end_of_day)
  end

  def ideas_count_in_day(date)
    self.ideas.where('created_at > ?', date).where('created_at <= ?', date.end_of_day).count
  end

  def color
    color = case self.ideas.count
               when 0..10 then 1
               when 11..20 then 2
               when 21..50 then 3
               when 51..100 then 4
               when 101..200 then 5
               when 201..1000 then 6
               else 7
            end
    return color
  end


end
