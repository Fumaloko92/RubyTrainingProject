require "rails_helper"

describe Genre do
  it { should have_and_belong_to_many(:games) }
  
  it "the factory can create a correct instance of the object" do
     expect(FactoryGirl.build(:genre)).to be_valid
  end
  
  describe "validation" do
    describe "it is invalid when" do
      it  { should validate_presence_of(:name) }
    end
  end
end