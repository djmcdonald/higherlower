require 'sinatra'
require 'json'

before do
  content_type :json
end

get '/start' do
  { random: Random.new.rand(100) }.to_json
end

get '/higher/:number' do
  ran = Random.new.rand(100)

  if ran > params[:number].to_i
    status 412
    { random: ran, number: params[:number].to_i }.to_json
  else
    { random: ran }.to_json
  end
end

get '/lower/:number' do
  ran = Random.new.rand(100)

  if ran < params[:number].to_i
    status 412
    { random: ran, number: params[:number].to_i }.to_json
  else
    { random: ran }.to_json
  end
end

