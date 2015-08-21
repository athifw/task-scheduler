FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    day 1
    hour 12
  end

end
