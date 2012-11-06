
FactoryGirl.define do
  factory :investment, :class => Refinery::Investments::Investment do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

