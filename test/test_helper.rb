require 'simplecov'
SimpleCov.start
require 'rack/test'
require 'minitest/autorun'
require 'minitest/focus'
require 'minitest-spec-context'
require 'minitest/reporters'

require 'omniauth'
require 'omniauth-asana'
require 'oauth2'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
