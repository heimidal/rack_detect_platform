require 'rack'

module Rack
  class DetectPlatform
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      user_agent = env['HTTP_USER_AGENT'].to_s

      platforms.each do |re, platform|
        if user_agent =~ re
          env['X_PLATFORM'] = platform
          break
        end
      end

      @app.call(env)
    end

    # For the time being, Android is being identified as an iPhone. We'll split this out later.
    def platforms
      {
        /(iPhone|Android)/ => 'iphone',
        /iPad/ => 'ipad'
      }
    end
  end
end