require "rails_helper"

describe Game do
  it { should have_and_belong_to_many(:users) }
  it { should have_and_belong_to_many(:genres) }
  it { should have_many(:platforms) }
  
  it "the factory can create a correct instance of the object" do
     expect(FactoryGirl.build(:game)).to be_valid
  end
  
  describe "validation" do
    describe "it is invalid when" do
      it  { should validate_presence_of(:name) }
    end
  end
end