FactoryGirl.define do
  factory :post do |f|
    title "Test title"
    content "Test content"
    f.association :user, :factory => :user
  end
end
