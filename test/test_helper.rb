require 'simplecov'
if ENV['COVERAGE']
  SimpleCov.start do
    add_filter "/test/"
  end
end

require 'minitest/autorun'
require 'mocha/setup'

require 'kuromi'

Mocha::Configuration.prevent(:stubbing_non_existent_method)
Mocha::Configuration.prevent(:stubbing_method_unnecessarily)
Mocha::Configuration.prevent(:stubbing_non_public_method)

