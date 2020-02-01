# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user privillage methods' do
    let(:user) { build_stubbed(:user) }
    subject { user.privileges }

    describe 'normal user is not admin nor worker nor author' do
      it { is_expected.to match_array(%i[user]) }
    end

    describe 'author' do
      let!(:author) { build_stubbed(:author, user: user) }
      it { is_expected.to match_array(%i[author user]) }
    end

    describe 'worker' do
      let!(:worker) { build_stubbed(:worker, user: user) }
      it { is_expected.to match_array(%i[worker user]) }
    end

    describe 'admin' do
      let!(:admin) { build_stubbed(:administrator, user: user) }
      it { is_expected.to match_array(%i[administrator user]) }
    end
  end
end
