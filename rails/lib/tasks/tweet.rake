require 'twitter_client_factory'
namespace :tweet do
  desc 'call twitter api and store tweets'
  task :scrape do
    client = TwitterClientFactory.new_client
    client.search("#ruby -rt", lang: "ja").first.text
  end
end
