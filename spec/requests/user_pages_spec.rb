require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path } # go to locolhost:30000/users/new

    it { should have_selector('h1',text:'sign up') } # show text h1
  end

  describe "signup" do
    before { visit signup_path }
    let( :submit ) { "sign up" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_buttom submit }.not_to change(User, :count)

      end
    end

    describe "with invalid information" do
      before do
        fill_in "Name",                  with: "Madd Alee"
        fill_in "Email",                 with: "madalee@hotmail.com"
        fill_in "Password",              with: "madalee"
        fill_in "Password Confirmation", with: "madalee"
      end

      it "should create a user" do
         expect { click_buttom submit }.to change(User, :count).by(1)
      end
    end
  end
end
