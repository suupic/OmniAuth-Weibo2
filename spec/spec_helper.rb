$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)


require 'rspec'
require 'omniauth'
require 'omniauth-oauth'
require 'omniauth-oauth2'

RSpec.configure do |config|
  #
end

class String
  def present?
    return !self.nil? && !self.empty?
  end
end
