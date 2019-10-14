# frozen_string_literal: true

require 'grape'

module V1
  class Root < Grape::API # :nodoc:
    default_format :json

    mount Users::Api => '/users'

    add_swagger_documentation
  end
end
