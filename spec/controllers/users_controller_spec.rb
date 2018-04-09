require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  describe 'GET #index' do
    it 'user' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'show action' do
    it 'renders show' do
      user = create(:user)
      puts user.inspect
      get :show, params: { id: user.id }
      response.should render_template('show')
    end

    # it 'not renders show' do
    #   get :show, params: { id: 0}
    # end

    describe 'create action' do

    end
  end

  describe 'edit action' do

    it 'edit not valid' do
      user = create(:user)
      puts user.inspect
      get :show, params: { id: user.id }
      get :edit, params: { id: user.id, email: 'bla@bla.ru' }
      expect(response).to render_template(:edit)
    end
  describe 'update action' do

    it 'update' do
      @user = create(:user)
      put :update, id: @user, user: attributes_for(:user, email: 'new@email.com')
      @user.reload
      expect(@user.email).to eq('new@email.com')
    end

  end
    # it 'update valid' do
    #   user = create(:user)
    #   put :update, params: { id: user.id, email: '' }
    #   # expect(response).to redirect_to action: :show, id: user.id
    #   expect(response).to render_template(:edit)
    # end


  end

  # describe 'follow action' do
  #   user1 = create(:user)
  #   user2 = create(:user)
  #   it 'follow' do
  #     create(:user) do |user|
  #       post :follow, params: { current_user: user, user_id: user1.id }
  #     end
  #
  #   end
  #
  # end

end
