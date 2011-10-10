class Ole < Sinatra::Base
  
  get '/ole' do
    system("cvlc #{File.join(File.dirname(__FILE__), 'assets', 'ole_trumpet.mp3')} --play-and-exit")
  end
  
end
