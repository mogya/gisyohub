# frozen_string_literal: true

module V1
  module Users
    # /users API.
    class Api < Grape::API
      desc 'get user'
      get do
        present User.first, with: Entities::User
      end
    end
  end
end
