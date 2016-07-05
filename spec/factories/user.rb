FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => "User" do
    name "Giorgio"
    surname "Rossi"
    birthday DateTime.new(1990,2,3) 
    email 
    password "12345678"
    password_confirmation "12345678"
  end
end
