require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Asana < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => "https://app.asana.com",
        :authorize_url => "https://app.asana.com/-/oauth_authorize",
        :token_url => "https://app.asana.com/-/oauth_token",
      }

      def authorize_params
        super.tap do |params|
          params[:client_options] = request.params["client_options"] if request.params["client_options"]
        end
      end

      uid { raw_info["id"].to_s }

      info do
        {
          "name" => raw_info["name"],
          "email" => raw_info["email"],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.params["data"]
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end
