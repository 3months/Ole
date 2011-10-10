require 'timeout'
require 'net/http'

Capistrano::Configuratrion.instance(:must_exist).load do
  _cset(:ole_url) { "http://localhost:9494" }
  
  after "deploy:update_code", "ole:done"
  
  namespace :ole do
    task :done do
      Timeout(10) do
        Net::HTTP(fetch(:ole_url))
      end
    end
  end
end
