# frozen_string_literal: true

module V1
  module Users
    module Entities
      class User < Grape::Entity # :nodoc:
        expose :id
        expose :user_name
        expose :image_url
      end
    end
  end
end
