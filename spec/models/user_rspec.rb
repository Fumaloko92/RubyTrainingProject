require "rails_helper"

describe User do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  
  it "the factory can create a correct instance of the object" do
     expect(FactoryGirl.build(:user)).to be_valid
  end
  
  describe "validation" do
    describe "it is invalid when" do
      it  { should validate_presence_of(:email) }
      it  { should validate_presence_of(:name) }
      it  { should validate_presence_of(:surname) }
      it  { should validate_presence_of(:birthday) }
    end
  end
end