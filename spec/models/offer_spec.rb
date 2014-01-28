require 'spec_helper'

describe Offer do

  let(:user) { FactoryGirl.create(:user) }
  before { @offer = user.offers.build(content: "Lorem ipsum") }

  subject { @offer }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @offer.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @offer.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @offer.content = "a" * 71 }
    it { should_not be_valid }
  end

end