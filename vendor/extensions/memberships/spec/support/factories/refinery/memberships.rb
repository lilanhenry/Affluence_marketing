
FactoryGirl.define do
  factory :membership, :class => Refinery::Memberships::Membership do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

