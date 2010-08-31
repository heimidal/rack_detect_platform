require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rack::DetectPlatform do
  before do
    @app = test_app
    @rack = Rack::DetectPlatform.new(@app)
  end

  it 'sets platform to iphone' do
    env = test_env('HTTP_USER_AGENT' => iphone)
    @rack.call(env)

    env['X_PLATFORM'].should == "iphone"
  end

  it 'sets platform to iphone when the device is running Android' do
    env = test_env('HTTP_USER_AGENT' => android)
    @rack.call(env)

    env['X_PLATFORM'].should == "iphone"
  end

  it 'sets platform to ipad' do
    env = test_env('HTTP_USER_AGENT' => ipad)
    @rack.call(env)

    env['X_PLATFORM'].should == "ipad"
  end

  it "doesn't set the platform if it can't find it" do
    env = test_env
    @rack.call(env)

    env.key?('X_PLATFORM').should be_false
  end

  it "calls the app" do
    env = test_env
    @app.should_receive(:call).with(env)

    @rack.call(env)
  end
end

def test_env(overwrite = {})
  {
    'GATEWAY_INTERFACE'=> 'CGI/1.2',
    'HTTP_ACCEPT'=> 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'HTTP_ACCEPT_CHARSET'=> 'ISO-8859-1,utf-8;q=0.7,*;q=0.7',
    'HTTP_ACCEPT_ENCODING'=> 'gzip,deflate',
    'HTTP_ACCEPT_LANGUAGE'=> 'en-us,en;q=0.5',
    'HTTP_CONNECTION'=> 'keep-alive',
    'HTTP_HOST'=> 'localhost:4567',
    'HTTP_KEEP_ALIVE'=> 300,
    'HTTP_USER_AGENT'=> 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3) Gecko/20090920 Firefox/3.5.3 (Swiftfox)',
    'HTTP_VERSION'=> 'HTTP/1.1',
    'PATH_INFO'=> '/',
    'QUERY_STRING'=> '',
    'REMOTE_ADDR'=> '127.0.0.1',
    'REQUEST_METHOD'=> 'GET',
    'REQUEST_PATH'=> '/',
    'REQUEST_URI'=> '/',
    'SCRIPT_NAME'=> '',
    'SERVER_NAME'=> 'localhost',
    'SERVER_PORT'=> '4567',
    'SERVER_PROTOCOL'=> 'HTTP/1.1',
    'SERVER_SOFTWARE'=> 'Mongrel 1.1.5',
    'rack.multiprocess'=> false,
    'rack.multithread'=> true,
    'rack.request.form_hash'=> '',
    'rack.request.form_vars'=> '',
    'rack.request.query_hash'=> '',
    'rack.request.query_string'=> '',
    'rack.run_once'=> false,
    'rack.url_scheme'=> 'http',
    'rack.version'=> '1: 0'
  }.merge(overwrite)
end

def test_app
  Class.new { def call(app); true; end }.new
end

# User agents for testing
def ipad
  'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10'
end

def iphone
  'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3'
end

def android
  'Mozilla/5.0 (Linux; U; Android 1.0; en-us; dream) AppleWebKit/525.10+ (KHTML, like Gecko) Version/3.0.4 Mobile Safari/523.12.2'
end