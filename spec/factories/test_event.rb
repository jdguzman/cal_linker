FactoryGirl.define do
  factory :test_event, class: TestEvent do
    name 'This is a test.'
    starting_at { DateTime.now }
    ending_at { 2.hours.from_now }
    description 'This is description for the this event.'
  end
end
