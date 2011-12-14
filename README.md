# OmniAuth Weibo2

**Note:** This gem is designed to work with weibo.com v2 which authorize via OAuth2

## Getting Started
This is an example that you might put into a Rails initializer at
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo2, "APP_KEY", "APP_SECRET"
end
```
## <a name="resources"></a>Resources
The [Weibo Wiki](http://open.weibo.com/wiki/Oauth2)

