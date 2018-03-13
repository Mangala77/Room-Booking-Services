class Booking < ActiveRecord::Base
  attr_accessor  :room_id, :start, :end
  belongs_to :room
  scope :conflict, ->(time_range){ where(start: time_range).or(end_overlap(time_range))}
  scope :end_overlap, ->(time_range){ where(end: time_range)}

end
