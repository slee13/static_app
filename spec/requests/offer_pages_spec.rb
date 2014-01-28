require 'spec_helper'

describe "Offer pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "offer creation" do
    before { visit user_path(user) }

    describe "with invalid information" do

      it "should not create a offer" do
        expect { click_button "Post" }.not_to change(Offer, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'offer_content', with: "Lorem ipsum" }
      it "should create a offer" do
        expect { click_button "Post" }.to change(Offer, :count).by(1)
      end
    end
  end
end