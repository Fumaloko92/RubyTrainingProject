require "rails_helper"

describe Platform do
  it { should belong_to(:game) }

  it "the factory can create a correct instance of the object" do
     expect(FactoryGirl.build(:game)).to be_valid
  end
  
  describe "validation" do
    describe "it is invalid when" do
      it  { should validate_presence_of(:name) }
    end
  end
end