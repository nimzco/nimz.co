require "sinatra"
require "sinatra/subdomain"
require "sinatra/content_for"

module Nimz

  class Application < Sinatra::Base
    helpers Sinatra::ContentFor
    register Sinatra::Subdomain

    if ENV['RACK_ENV'] == 'development'
      configure do
        enable :logging
        file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
        file.sync = true
        use Rack::CommonLogger, file
      end
    end

    subdomain :hire do
      get '/' do
        haml :hire
      end
    end

    # Homepage
    get '/' do
      @home = true
      haml :home
    end

    get '/hire' do
      if ENV['RACK_ENV'] == 'development'
        redirect "//hire.nimz.dev"
      else
        redirect '//hire.nimz.co'
      end
    end

  end
end
