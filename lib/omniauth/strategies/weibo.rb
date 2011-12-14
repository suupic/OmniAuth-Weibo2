require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Weibo < OmniAuth::Strategies::OAuth

      option :name, "weibo"

      option :client_options, {
        :access_token_path => '/oauth/access_token',
        :authorize_path => '/oauth/authorize',
        :request_token_path => '/oauth/request_token/',
        :site => 'http://api.t.sina.com.cn'
      }

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

      uid { raw_info["id"] }

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get("/account/verify_credentials.json").parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'weibo', 'Weibo'
