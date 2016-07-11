FactoryGirl.define do
  factory :post do |f|
    title "Test title"
    content "Test content"
    avatar "uploads/post/test.jpg"
    f.association :user, :factory => :user
  end
end
