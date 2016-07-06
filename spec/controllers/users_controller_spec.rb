require "rails_helper"

describe UsersController do
  describe "PATCH #update_password" do
    def do_patch_update_password(update_password_params)
      patch :update_password, {
        :user => update_password_params
      }
    end
    
    let!(:user) { FactoryGirl.create(:user) }
    
    describe "user" do
      before (:each) do
        login_with(user)
      end
      
      it "should change the password" do
        expect{ do_patch_update_password(:current_password => user.password, :password => "newpassword", :password_confirmation => "newpassword") }.to change{user.password}.from("12345678").to("newpassword")
      end
      
      it "should redirect to the main page" do
        expect(do_patch_update_password(:current_password => user.password, :password => "newpassword", :password_confirmation => "newpassword")).to redirect_to root_path
      end
      
      it "should not change the password" do
        expect{ do_patch_update_password(:current_password => "fakepassword", :password => "newpassword", :password_confirmation => "newpassword") }.to_not change{user.password}.from("12345678")
      end
      
      it "should refresh the page" do
        expect(do_patch_update_password(:current_password => "fakepassword", :password => "newpassword", :password_confirmation => "newpassword")).to redirect_to edit_user_registration_path       
      end
    end
    
    describe "guest" do
      it "should not do anything whatever parameter" do
        expect(do_patch_update_password(:current_password => "", :password => "newpassword", :password_confirmation => "newpassword")).to redirect_to new_user_session_path
        expect(do_patch_update_password(:current_password => "fakepassword", :password => "", :password_confirmation => "newpassword")).to redirect_to new_user_session_path       
        expect(do_patch_update_password(:current_password => "fakepassword", :password => "newpassword", :password_confirmation => "")).to redirect_to new_user_session_path       
        expect(do_patch_update_password(:current_password => "", :password => "", :password_confirmation => "newpassword")).to redirect_to new_user_session_path       
        expect(do_patch_update_password(:current_password => "", :password => "newpassword", :password_confirmation => "")).to redirect_to new_user_session_path       
        expect(do_patch_update_password(:current_password => "fakepassword", :password => "", :password_confirmation => "")).to redirect_to new_user_session_path       
        expect(do_patch_update_password(:current_password => "", :password => "", :password_confirmation => "")).to redirect_to new_user_session_path       
      end
    end
  end
  
  describe "PATCH #update_profile" do
    def do_patch_update_profile(update_profile_params) 
      patch :update_info, {
        :user => update_profile_params
      }
    end
    
    let!(:user) { FactoryGirl.create(:user) }
    
    describe "user" do
      before (:each) do
        login_with(user)
      end
      
      it "should change profile information" do
        expect{ do_patch_update_profile(:name => "name", :surname => "surname", :birthday => Date.today) }.to change{user.name}.from(user.name).to("name")
        expect{ do_patch_update_profile(:name => "name", :surname => "surname", :birthday => Date.today) }.to change{user.surname}.from(user.surname).to("surname")
        expect{ do_patch_update_profile(:name => "name", :surname => "surname", :birthday => Date.today) }.to change{user.birthday}.from(user.birthday).to(Date.today)  
      end
      
      it "should redirect to the main page" do
        expect(do_patch_update_profile(:name => "name", :surname => "surname", :birthday => Date.today)).to redirect_to root_path
      end
    end
    
    describe "guest" do
      it "should not do anything whatever parameter" do
        expect(do_patch_update_profile(:name => "name", :surname => "surname", :birthday => Date.today)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "", :surname => "surname", :birthday => Date.today)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "name", :surname => "", :birthday => Date.today)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "", :surname => "", :birthday => Date.today)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "name", :surname => "surname", :birthday => nil)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "name", :surname => "", :birthday => nil)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "", :surname => "surname", :birthday => nil)).to redirect_to new_user_session_path
        expect(do_patch_update_profile(:name => "", :surname => "", :birthday => nil)).to redirect_to new_user_session_path

      end
    end
  end
  
  describe "PATCH #update_email" do
    def do_patch_update_email(update_email_params)
      patch :update_email, {
        :user => update_email_params
      }
    end
    
    let! (:user) { FactoryGirl.create(:user) }
    
    describe "user" do
      before (:each) do
        login_with(user)
      end
      
      it "should change the email" do
        expect{ do_patch_update_email(:email => "newemail@email.it", :current_password => user.password) }.to change{user.email}.from(user.email).to("newemail@email.it")
      end
      
      it "should redirect to main page" do
        expect(do_patch_update_email(:email => "newemail@email.it", :current_password => user.password)).to redirect_to root_path
      end
    end
    
    describe "guest" do
      it "should not do anything whatever parameter" do
        expect(do_patch_update_email(:email => "newemail@email.it", :current_password => "password")).to redirect_to new_user_session_path
        expect(do_patch_update_email(:email => "newemail@email.it", :current_password => "")).to redirect_to new_user_session_path
        expect(do_patch_update_email(:email => "", :current_password => "password")).to redirect_to new_user_session_path
        expect(do_patch_update_email(:email => "", :current_password => "")).to redirect_to new_user_session_path
      end
    end
  end
end