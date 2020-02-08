require 'rails_helper'

describe 'sessions', type: :request do
  context 'index' do
    context 'not logged-in' do
      it 'returns unauthorized' do
        get '/sessions'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'logged-in' do
      let(:user) { create(:user) }
      before 'assign user on session' do
        allow_any_instance_of(ActionDispatch::Request)
          .to receive(:session).and_return(user_id: user.id)
      end
      it 'returns user informations' do
        get '/sessions'
        expect(response).to have_http_status(:ok)

        respond_user = JSON.parse(response.body)
        expect(respond_user['id']).to eq(user.id)
        expect(respond_user['user_name']).to eq(user.user_name)
        expect(respond_user['scope']).to match_array(['user'])
        expect(respond_user).not_to have_key('access_token')
        expect(respond_user).not_to have_key('access_secret')
        expect(respond_user).not_to have_key('raw_auth')
      end
    end
  end
end
