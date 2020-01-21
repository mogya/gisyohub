# frozen_string_literal: true

worker_processes 1
working_directory '/rails/'

listen '/tmp/unicorn.sock'
listen ENV['PORT']
pid '/tmp/unicorn.pid'
