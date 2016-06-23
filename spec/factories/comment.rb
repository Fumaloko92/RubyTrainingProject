FactoryGirl.define do
  factory :comment do |f|
    title "Test title"
    content "Test content"
    f.association :user, :factory => :user
    f.association :post, :factory => :post
  end
end
