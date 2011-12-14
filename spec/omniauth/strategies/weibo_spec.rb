require 'spec_helper'
require 'omniauth/strategies/weibo'

describe OmniAuth::Strategies::Weibo do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Weibo.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct site' do
      subject.options.client_options[:site].should eq('http://api.t.sina.com.cn')
    end

    it 'has correct authorize path and url' do
      subject.options.client_options[:authorize_path].should eq('/oauth/authorize')
    end

    it 'has correct access token path and url' do
      subject.options.client_options[:access_token_path].should eq('/oauth/access_token')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:raw_info) {{"id"=>12345678}}
      subject.uid.should eq(12345678)
    end
  end

  describe '#info' do
    before :each do
      @raw_info_hash = {
        "id"=>12345678,
        "screen_name"=>"xixilive_nick",
        "name"=>"xixilive",
        "province"=>"11",
        "city"=>"8",
        "location"=>"北京海淀区",
        "description"=>"description content",
        "url"=>"http://xixilive.blog.163.com",
        "profile_image_url"=>"http://tp2.sinaimg.cn/12345678/50/1281523744",
        "domain"=>"xixilive"
      }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    context 'when data is present in raw info' do
      it 'returns the name' do
        subject.info['name'].should eq('xixilive')
      end

      it 'returns the nickname' do
        subject.info['nickname'].should eq('xixilive_nick')
      end

      it 'returns the email' do
        subject.info['email'].should eq('12345678@weibo.com')
      end

      it 'returns the location' do
        subject.info['location'].should eq('北京海淀区')
      end

      it 'returns the location' do
        subject.info['location'].should eq('北京海淀区')
      end

      it 'returns the description' do
        subject.info['description'].should eq('description content')
      end

      it 'returns the urls' do
        subject.info['urls']['weibo'].should eq('http://weibo.com/xixilive')
        subject.info['urls']['blog'].should eq('http://xixilive.blog.163.com')
      end

    end
  end

  describe '#extra' do
    before :each do
      subject.stub(:raw_info) { {"name"=>"xixilive"} }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end