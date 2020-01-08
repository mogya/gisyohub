require 'rails_helper'

RSpec.describe TwitterUser, type: :model do
  describe 'attr= method' do
    let(:user_object) { build(:twitter_tweet_response).user }
    subject { TwitterUser.new { |record| record.attrs = user_object } }
    it 'assings user parameters' do
      expect(subject.screen_name).to eq user_object.screen_name
      expect(subject.twitter_user_id).to eq user_object.id
    end
  end

  describe 'store method' do
    subject { TwitterUser.new { |record| record.attrs = user_object } }
    context 'normal case' do
      let(:user_object) { build(:twitter_tweet_response).user }
      it 'can store user' do
        expect { TwitterUser.store(user_object) }.to change(TwitterUser, :count).by(1)
      end
    end
    context 'invalid content' do
      let(:user_object) { OpenStruct.new }
      it 'raise exception' do
        expect { TwitterUser.store(user_object) }.to raise_error(ArgumentError)
      end
    end
  end
end
