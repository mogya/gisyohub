# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'attr= method' do
    subject { Tweet.new { |record| record.attrs = tweet_object } }
    let(:tweet_object) { build(:twitter_tweet_response) }
    it 'assings tweet parameters' do
      expect(subject.tweet_id).to eq tweet_object.id
      expect(subject.twitter_user_id).to eq tweet_object.user.id
      expect(subject.text).to eq tweet_object.text
      expect(subject.tweeted_at).to eq tweet_object.created_at
    end
  end

  describe 'store method' do
    subject { Tweet.new { |record| record.attrs = tweet_object } }
    context 'normal case' do
      let(:tweet_object) { build(:twitter_tweet_response) }
      it 'can store tweet' do
        expect { Tweet.store(tweet_object) }.to change(Tweet, :count).by(1)
      end
    end
    context 'invalid tweet_object' do
      let(:tweet_object) { OpenStruct.new }
      it 'raise exception' do
        expect { Tweet.store(tweet_object) }.to raise_error(ArgumentError)
      end
    end
    context 'update' do
      let!(:existing_tweet) do
        create(:tweet, tweet_id: 1, text: 'existing tweet.')
      end
      let(:tweet_object) do
        build(:twitter_tweet_response) do |obj|
          obj.id = 1
          obj.text = 'new text'
        end
      end
      it 'override existing record' do
        expect { Tweet.store(tweet_object) }.to(
          change(Tweet, :count).by(0)
        )
        tweet = Tweet.find_by(tweet_id: 1)
        expect(tweet.text).to eq('new text')
      end
    end
  end
end
