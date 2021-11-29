require 'spec_helper'

describe OmniAuth::Strategies::Asana do
  let(:access_token) { instance_double('AccessToken', :options => {}) }
  # let(:parsed_response) { instance_double('ParsedResponse') }
  let(:params) { instance_double('RackParams') }
  let(:hash) { instance_double('Hash') }
  # let(:response) { instance_double('Response', :parsed => parsed_response) }

  subject do
    OmniAuth::Strategies::Asana.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq("https://app.asana.com")
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://app.asana.com/-/oauth_authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://app.asana.com/-/oauth_token')
    end
  end

  context "#raw_info" do
    it "should use params" do
      allow(access_token).to receive(:params).and_return(params)
      allow(params).to receive(:[]).with('data').and_return(hash)

      expect(subject.raw_info).to eq(hash)
    end
  end
end
