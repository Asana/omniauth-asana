# rubocop:disable Metrics/BlockLength
require "spec_helper"

describe OmniAuth::Strategies::Asana do
  subject(:strategy) { described_class.new({}) }

  let(:access_token) { instance_double("AccessToken", :options => {}) }
  let(:params) { instance_double("RackParams") }
  let(:hash) { instance_double("Hash") }

  before do
    allow(strategy).to receive(:access_token).and_return(access_token)
  end

  describe "#options" do
    describe "#client_options" do
      it "has correct site" do
        expect(strategy.options.client_options.site).to eq("https://app.asana.com")
      end

      it "has correct authorize url" do
        expect(strategy.options.client_options.authorize_url).to eq("https://app.asana.com/-/oauth_authorize")
      end

      it "has correct token url" do
        expect(strategy.options.client_options.token_url).to eq("https://app.asana.com/-/oauth_token")
      end
    end
  end

  describe "#raw_info" do
    it "uses params" do
      allow(access_token).to receive(:params).and_return(params)
      allow(params).to receive(:[]).with("data").and_return(hash)

      expect(strategy.raw_info).to eq(hash)
    end
  end
end
# rubocop:enable Metrics/BlockLength
