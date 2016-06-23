require "rails_helper"

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  
  it "the factory can create a correct instance of the object" do
     expect(FactoryGirl.build(:comment)).to be_valid
  end
  
  describe "validation" do
    describe "it is invalid when" do
      it  { should validate_presence_of(:title) }
      it  { should validate_presence_of(:content) }
    end
  end
end