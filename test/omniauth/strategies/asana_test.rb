require 'test_helper'

describe OmniAuth::Strategies::Asana do
  let(:access_token) { {} }

  let(:subject) { OmniAuth::Strategies::Asana.new({}) }

  context 'client options' do
    it 'should have correct site' do
      subject.stub(:access_token, access_token) do
        _(subject.options.client_options.site).must_equal('https://app.asana.com')
      end
    end

    it 'should have correct authorize url' do
      subject.stub(:access_token, access_token) do
        _(subject.options.client_options.authorize_url).must_equal('https://app.asana.com/-/oauth_authorize')
      end
    end

    it 'should have correct token url' do
      subject.stub(:access_token, access_token) do
        _(subject.options.client_options.token_url).must_equal('https://app.asana.com/-/oauth_token')
      end
    end
  end

  context '#raw_info' do
    it 'should use relative paths' do
      mock = Minitest::Mock.new
      parsed_response = 'parsed_response'
      mock.expect :params, { 'data' => parsed_response }
      subject.stub(:access_token, mock) do
        _(subject.raw_info).must_equal(parsed_response)
      end
      mock.verify
    end
  end
end
