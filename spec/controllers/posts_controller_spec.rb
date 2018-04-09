require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # let!(:first_post)  { Post.create(text: 'Test Post')}
  # let!(:user1)       { User.create}
  login_user

  describe 'GET show' do
    it 'show' do
    user1 = create(:user)
    user2 = create(:user)
    post1 = create(:post, user_id: user1.id, author_id: user2.id)
    get :show , params: {user_id: user1.id, id: post1.id}
    expect(assigns(:post)).to eq(post1)
    end

    it 'show render' do
      user1 = create(:user)
      user2 = create(:user)
      post1 = create(:post, user_id: user1.id, author_id: user2.id)
      get :show , params: {user_id: user1.id, id: post1.id}
      expect(response).to render_template('show')
    end

    # describe 'GET new' do
    #   before { get :new }
    #   user1 = create(:user)
    #   user2 = create(:user)
    #   it { expect(assigns(:post)).to be_a_new(Post) }
    #   it { expect(response).to render_template("new") }
    # end

    describe 'POST create' do
      it 'when valid' do
        user1 = create(:user)
        user2 = create(:user)
        post :create, post: {user_id: user1.id, author_id: user2.id }
        expect(response).to redirect_to(user_path(user1.id))
        # it { expect(flash[:notice]).to be_present }
      end
      #
      # context "when invalid" do
      #   before { post :create, :post => {:title => "Test Title", :body => ""} }
      #
      #   it { expect(response).to render_template("new") }
      #   it { expect(flash[:error]).to be_present }
      # end
    end

    # it { expect(assigns(:post)).to eq(first_post) }
    # it { expect(response).to render_template("show") }

  # describe 'create action' do
  #   it 'create and redirect' do
  #     user1 = create(:user)
  #     user2 = create(:user)
  #     # puts user1.inspect
  #     # puts user2.inspect
  #
  #     create(:user) do |user|
  #       user.posts.create ( attributes_for(:post, user_id: user.id, author_id: user2.id))
  #       # post :create
  #       puts user.posts.inspect
  #       # response.status.should == 200
  #       expect(response.status).to eq(200)
  #       # expect(response).to redirect_to(user_path(user.id))
  #
  #     # post :create, params: {id: user_id: user1.id, author_id: user2.id}
  #     end
  #   end
  # end
  # describe 'new action' do
  #
  #   it 'new' do
  #     user1 = create(:user)
  #     user2 = create(:user)
  #     puts user1.inspect
  #     puts user2.inspect
  #
  #     get :new, params: {user_id: user1.id}
  #
  #
  #   end
  #
  # end
  # # describe 'like action' do
  # #   it 'like' do
  # #     user1 = create(:user)
  # #     user2 = create(:user)
  # #     post = create(:post, user_id: user1.id, author_id: user2.id )
  # #     puts post.inspect
  # #     post :likes, params: { id: user1.id }
  # #   end
  # # end
  end
end

