# frozen_string_literal: true

namespace :user do
  desc 'set a user to administrator'
  task admin: :environment do |_task|
    user = User.find_by(id: ENV['user_id'])
    unless user
      Rails.logger.warn 'user not found. '
      Rails.logger.info 'usage: rails user:admin user_id=xxxx'
      exit(-1)
    end
    if user.administrator.present?
      Rails.logger.warn "user:#{user.id}(#{user.user_name}) is already admin."
      exit
    end

    user.create_administrator!
    Rails.logger.info "user:#{user.id}(#{user.user_name}) is now admin."
  end
end
