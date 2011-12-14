require File.expand_path('../lib/omniauth-weibo2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  
  gem.add_development_dependency 'rspec', '~> 2.7'

  gem.authors       = ["Mickey"]
  gem.email         = ["xixilive@gmail.com"]
  gem.description   = %q{This gem is designed to work with weibo.com,include 2 strategies, weibo and weibo2}
  gem.summary       = %q{OmniAuth strategy for weibo.com,include weibo and weibo2}
	gem.homepage			= 'http://github.com/xixilive/omniauth-weibo2'
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-weibo2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Weibo2::VERSION
end
