require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Asana < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://app.asana.com',
        :authorize_url => 'https://app.asana.com/-/oauth_authorize',
        :token_url => 'https://app.asana.com/-/oauth_token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          if request.params['client_options']
            params[:client_options] = request.params['client_options']
          end
        end
      end

      uid { raw_info['global_id'].to_s }

      info do
        {
          'user_id' => raw_info['global_id']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('user').parsed
      end
    end
  end
end
