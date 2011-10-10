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
    system("#{path_to_vlc} -I dummy --play-and-exit #{File.join(File.dirname(__FILE__), 'assets', 'ole_trumpet.mp3')}")
  end
  
  def path_to_vlc
    if RUBY_PLATFORM =~ /darwin/
      path = "/Applications/VLC.app/Contents/Mac OS/VLC"
      raise "VLC does not appear to be installed" unless File.exists?(path)
    else
      path = "vlc"
    end
    return path
  end
  
  def ole_if_valid(repo, msg)
    return unless ENV['ole_repos'].split(',').include?(repo) || msg =~ /\AOLE\:/
    ole
  end
end
