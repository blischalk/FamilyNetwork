require 'spec_helper'
require 'factory_girl'

describe "Users" do
  describe "visiting the dashboard" do
    context 'when not logged in' do
      it  "should redirect to login path" do
        visit root_path
        current_path.should == new_user_session_path
      end
    end
    context 'when logged in' do
      before(:each) do
        user =  FactoryGirl.create(:user)
      end
      it  "should be successful" do
        login_user
        visit root_path
        current_path.should == root_path
      end
    end
  end
end
