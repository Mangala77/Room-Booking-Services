FactoryGirl.define do
  factory :booking do
    start Date.today
    add_attribute :end, Date.today+3
    room_id 1
  end
end
