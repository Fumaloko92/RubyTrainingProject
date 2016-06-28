require "rails_helper"

describe PostsController do
  describe "GET #index" do
    def do_get_index
      get :index
    end
    
    it "renders :index template" do
      expect(do_get_index).to render_template(:index)
    end
  end
  
  describe "GET #new" do
    def do_get_new
      get :new
    end
     
    describe "user" do
      it "renders :new template" do
        login_with(FactoryGirl.create(:user))
        expect(do_get_new).to render_template(:new)
      end
        
      it "expects a new post instance variable" do
        login_with(FactoryGirl.create(:user))
        do_get_new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
      
    describe "guest" do
      it "renders :log_in template" do
        expect(do_get_new).to redirect_to(new_user_session_path)
      end
    end
  end
  
  describe "POST #create" do
    def do_post(post_params)
      post :create, {
        :post => post_params
      }
    end
    
    describe "user" do
      before (:each) do
        login_with(FactoryGirl.create(:user))
      end
      it "renders :posts template if the parameters are valid" do
        expect(do_post(:title => "Test title",:content => "Test content")).to redirect_to(posts_path)
      end
      
      it "creates and saves another post if the parameters are valid" do
        expect { do_post(:title => "Test title",:content => "Test content") }.to change(Post, :count).by 1
      end
      
      it "renders the :post_new template if the parameters are not valid" do
        expect(do_post(:title => "",:content => "Test content")).to render_template("posts/new")
        expect(do_post(:title => "Test title",:content => "")).to render_template("posts/new")
        expect(do_post(:title => "",:content => "")).to render_template("posts/new")
      end
      
      it "does not create another post if the parameters are not valid" do
        expect{do_post(:title => "",:content => "Test content")}.to_not change(Post, :count)
        expect{do_post(:title => "Test title",:content => "")}.to_not change(Post, :count)
        expect{do_post(:title => "",:content => "")}.to_not change(Post, :count)
      end
    end
    
    describe "guest" do
      it "renders :log_in template no matters the validity of the parameters" do
        expect(do_post(:title => "Test title",:content => "Test content")).to redirect_to(new_user_session_path)
        expect(do_post(:title => "",:content => "Test content")).to redirect_to(new_user_session_path)
        expect(do_post(:title => "Test title",:content => "")).to redirect_to(new_user_session_path)
        expect(do_post(:title => "",:content => "")).to redirect_to(new_user_session_path)
      end
      
      it "should not be able to create a new post no matters the validity of the parameters" do
         expect{do_post(:title => "Test title",:content => "Test content")}.to_not change(Post, :count)
         expect{do_post(:title => "",:content => "Test content")}.to_not change(Post, :count)
         expect{do_post(:title => "Test title",:content => "")}.to_not change(Post, :count)
         expect{do_post(:title => "",:content => "")}.to_not change(Post, :count)
      end
    end
  end
end