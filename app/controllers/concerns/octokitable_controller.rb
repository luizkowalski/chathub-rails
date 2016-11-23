module OctokitableController
  extend ActiveSupport::Concern

  def build_cache
    cache_stack = Faraday::RackBuilder.new do |builder|
      builder.use Faraday::HttpCache
      builder.use Octokit::Response::RaiseError
      builder.adapter Faraday.default_adapter
    end

    Octokit.middleware = cache_stack
  end

  def octokit_client
    build_cache
    @client ||= Octokit::Client.new(access_token: session[:token])
  end
end
