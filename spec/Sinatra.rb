require 'sinatra'

configure do
  set :port => 4010
end

get '/' do
  "Hello!"
end

post '/post' do
  puts request.body.read
  return "yoyoyoyoy!"
end