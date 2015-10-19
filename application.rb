require "sinatra"
require "sinatra/subdomain"
require "sinatra/content_for"

module Nimz

  class Application < Sinatra::Base
    helpers Sinatra::ContentFor
    register Sinatra::Subdomain

    subdomain do
      # Homepage
      get '/' do
        @home = true
        erb :home
      end
      get '/hire' do
        # erb :hire
        redirect "http://hire.nimz.dev"
        # redirect 'http://hire.nimz.co'
      end
    end
    subdomain :hire do
      get '/' do
        erb :hire
      end
    end
  end
end
