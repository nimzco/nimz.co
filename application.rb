require "sinatra"
require "sinatra/subdomain"
require "sinatra/content_for"

module Nimz

  class Application < Sinatra::Base
    helpers Sinatra::ContentFor
    register Sinatra::Subdomain

    configure :development do
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      enable :logging
      file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
      file.sync = true
      use Rack::CommonLogger, file
    end

    # Homepage
    get '/' do
      @home       = true
      @body_class = "flex flex--center home-page"
      @html_class = "home-page-wrapper"
      haml :home
    end

    # About
    get '/about' do
      haml :about
    end

    get '/background' do
      haml :background
    end

    get '/templates-ios' do
      @body_class = "sketch-page"
      haml :templates_ios
    end

    subdomain :hire do
      get '/' do
        redirect "https://nimz.co/hire", status: 301
      end
    end

    get '/hire' do
      redirect "https://nimz.co/background", status: 301
    end
  end
end
