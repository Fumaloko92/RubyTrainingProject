FactoryGirl.define do
  factory :platform do |f|
    name "PC"
    cpu_if_applicable "2.0 Ghz"
    ram_if_applicable "8 Gb"
    memory_if_applicable "5 Gb"
    video_if_applicable "512 Mb"
    f.association :game, :factory => :game
  end
end