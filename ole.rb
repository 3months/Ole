class Ole < Sinatra::Base
  
  get '/ole' do
    ole
  end
  
  get '/ole/github' do
    payload = JSON.parse(params[:payload])
    last_commit = payload.commits.last.message
    repository = payload.repository.name
    ole_if_valid(repository, last_commit)
  end
  
  private
  
  def ole
    system("cvlc #{File.join(File.dirname(__FILE__), 'assets', 'ole_trumpet.mp3')} --play-and-exit")
  end
  
  def ole_if_valid(repo, msg)
    return unless ENV['ole_repos'].split(',').include?(repo) || msg =~ /\AOLE\:/
    ole
  end
end
