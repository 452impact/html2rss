require 'hashie'

module Html2rss
  module Utils
    ##
    # A Hash with indifferent access, build with {https://github.com/intridea/hashie Hashie}.
    class IndifferentAccessHash < Hash
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::IndifferentAccess
    end

    def self.build_absolute_url_from_relative(url, channel_url)
      url = URI(url) if url.is_a?(String)

      return url if url.absolute?

      URI(channel_url).tap do |uri|
        uri.path = url.path.to_s.start_with?('/') ? url.path : "/#{url.path}"
        uri.query = url.query
        uri.fragment = url.fragment if url.fragment
      end
    end
  end
end