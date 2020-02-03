module Twitter
  class SearchResults
    def next_page
      return nil unless next_page?
      hash = query_string_to_hash(@attrs[:search_metadata][:next_results])
      since_id = @attrs[:search_metadata][:since_id]
      hash[:since_id] = since_id unless since_id.zero?
      hash
    end
  end

  module REST
    class Request
      # check requesting url
      # def perform
      #   # STDERR.puts("requesting #{@uri} with #{@options}")
      #   response = http_client.headers(@headers).public_send(@request_method, @uri.to_s, @options_key => @options)
      #   response_body = response.body.empty? ? '' : symbolize_keys!(response.parse)
      #   response_headers = response.headers
      #   fail_or_return_response_body(response.code, response_body, response_headers)
      # end
    end
    module Utils
      # check raw response
      # def perform_request_with_object(request_method, path, options, klass)
      #   response = perform_request(request_method, path, options)
      #   byebug
      #   STDERR.puts("response #{response}")
      #   klass.new(response)
      # end
    end
  end
end

