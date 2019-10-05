# frozen_string_literal: true

worker_processes 1
working_directory /rails/

listen '/tmp/unicorn.sock'
listen ENV['RAILS_PORT']
pid '/tmp/unicorn.pid'

stderr_path "/log/unicorn/#{ENV['RAILS_ENV']}_error.log"
stdout_path "/log/unicorn/#{ENV['RAILS_ENV']}.log"
