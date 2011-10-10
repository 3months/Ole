require 'timeout'
require 'uri'
require 'net/http'

Capistrano::Configuration.instance(:must_exist).load do
  _cset(:ole_url) { "http://localhost:9494" }
  
  after "deploy:update_code", "ole:done"
  
  namespace :ole do
    task :done do
      Timeout::timeout(10) do
        Net::HTTP.get(URI.parse(fetch(:ole_url) + "/ole")) rescue raise "Could not connect to Ole server"
      end
    end
  end
end
