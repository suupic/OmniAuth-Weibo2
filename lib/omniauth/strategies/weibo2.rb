require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Weibo2 < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.weibo.com',
        :authorize_url => 'https://api.weibo.com/oauth2/authorize',
        :token_url => 'https://api.weibo.com/oauth2/access_token',
        :raw_info_url => 'https://api.weibo.com/2/users/show.json'
      }

      def request_phase
        super
      end

      uid { raw_info['id'] }

      info do
        {
          'nickname' => raw_info['screen_name'],
          'email' => "#{raw_info['id']}@weibo.com",
          'name' => raw_info['name'],
          'location' => raw_info['location'],
          'description' => raw_info['description'],
          'image' => raw_info['profile_image_url'],
          'urls' => {
            'weibo' => raw_info['domain'].present?? "http://weibo.com/#{raw_info['domain']}" : "http://weibo.com/u/#{raw_info['id']}",
            'blog' => raw_info['url']
          }
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get(default_options[:client_options][:raw_info_url]).parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'weibo2', 'Weibo2'