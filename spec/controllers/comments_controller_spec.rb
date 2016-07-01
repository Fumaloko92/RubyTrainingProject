require "rails_helper"

describe CommentsController do
  describe "POST #create" do
    def do_post_create(comment_params)
      post :create, {
      :post_id => post_.id,
      :comment => comment_params
      }
    end
    
    let!(:post_) { FactoryGirl.create(:post) }
    
    describe "user" do
      before (:each) do
        login_with(FactoryGirl.create(:user))
        request.env["HTTP_REFERER"] = "back_"
      end
      
      it "add a new comment" do
        expect{ do_post_create(FactoryGirl.attributes_for(:comment)) }.to change(Comment,:count).by 1
      end
      
      it "redirect to back" do
        expect(do_post_create(FactoryGirl.attributes_for(:comment))).to redirect_to "back_"
      end
    end
    
    describe "guest" do
      it "redirect to log_in page" do
        expect(do_post_create(FactoryGirl.attributes_for(:comment))).to redirect_to new_user_session_path
        expect(do_post_create(FactoryGirl.attributes_for(:comment, title: ""))).to redirect_to new_user_session_path
        expect(do_post_create(FactoryGirl.attributes_for(:comment, content: ""))).to redirect_to new_user_session_path
        expect(do_post_create(FactoryGirl.attributes_for(:comment, content: "", title: ""))).to redirect_to new_user_session_path
      end
    end
  end
  
  describe "PATCH #update" do
    def do_patch_update(comment_params)
      patch :update, {
        :comment => comment_params,
        :id => comment.id,
        :post_id => comment.post.id
      }
    end
    
    let!(:comment) { FactoryGirl.create(:comment) }
    
    describe "user" do
      before (:each) do
        login_with(comment.user)
      end
      
      it "modify the comment and redirect to back" do
        request.env["HTTP_REFERER"] = "back_"
        expect(do_patch_update(FactoryGirl.attributes_for(:comment))).to be
        expect(do_patch_update(FactoryGirl.attributes_for(:comment))).to redirect_to "back_"
      end
    end
    
    describe "guest" do
      it "redirect to log_in no matter the parameters" do
        expect(do_patch_update(FactoryGirl.attributes_for(:comment))).to redirect_to new_user_session_path
        expect(do_patch_update(FactoryGirl.attributes_for(:comment, title: ""))).to redirect_to new_user_session_path
        expect(do_patch_update(FactoryGirl.attributes_for(:comment, content: ""))).to redirect_to new_user_session_path
        expect(do_patch_update(FactoryGirl.attributes_for(:comment, title: "", content: ""))).to redirect_to new_user_session_path
      end
    end
  end
  
  describe "DELETE #destroy" do
    def do_delete_destroy
      delete :destroy, {
        :id => comment.id,
        :post_id => comment.post.id
      }
    end
    
    let! (:comment) { FactoryGirl.create(:comment) }
    
    before (:each) do
      request.env["HTTP_REFERER"] = "back_"
    end
    
    describe "user" do
      it "the owner of the post can delete the comment" do    
        login_with(comment.post.user)
        expect{ do_delete_destroy }.to change(Comment,:count).by -1
      end
      
      it "the owner of the post is redirected to back after deleting the comment" do
        login_with(comment.post.user)
        expect(do_delete_destroy).to redirect_to "back_"
      end
      
      it "the owner of the comment can delete the comment" do       
        login_with(comment.user)
        expect{ do_delete_destroy }.to change(Comment,:count).by -1 
      end
      
      it "the owner of the comment is redirected to back after deleting the comment" do
        login_with(comment.user)
        expect(do_delete_destroy).to redirect_to "back_"
      end
      
      it "another user cannot delete the comment" do
        login_with(FactoryGirl.create(:user))
        expect{ do_delete_destroy }.to_not change(Comment,:count)
      end
      
      it "another user is redirected to log_in" do
        login_with(FactoryGirl.create(:user))
        expect(do_delete_destroy).to redirect_to new_user_session_path
      end
    end
    
    describe "guest" do
      it "a guest cannot delete the comment" do
        expect{ do_delete_destroy }.to_not change(Comment,:count)
      end
      
      it "a guest is redirected to log_in" do
        expect(do_delete_destroy).to redirect_to new_user_session_path
      end
    end
  end
end