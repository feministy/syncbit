require 'sinatra'
require 'httparty'
require 'json'
require 'uri'
require 'pry'

def client_id
  "961af0fb2d3042e9ba5e72a16dd5d721"
end

def client_secret
  "65c9997c9455471e9de3faece17dcba1"
end

def redirect_uri
  "http://localhost:4567/authorize"
end

# Authorization URL:
# https://runkeeper.com/apps/authorize

# Access Token URL:
# https://runkeeper.com/apps/token

# Client ID:
# 961af0fb2d3042e9ba5e72a16dd5d721

# Client Secret:
# 65c9997c9455471e9de3faece17dcba1

get '/' do
  @url = "https://runkeeper.com/apps/authorize?client_id=#{client_id}&response_type=code&redirect_uri=http://localhost:4567/authorize"
  haml :index
end

get '/authorize' do
  @code = params[:code]
  haml :authorize
end
