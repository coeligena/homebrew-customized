cask 'sshtunnel' do
  version :latest
  sha256 :no_check

  homepage '16.03.1'
  url "http://localhost:8000/Internet%2C%20Networking%20%26%20Basic%20Tools/SSH%20Tunnel/SSH%20Tunnel%20#{homepage}.zip"
  name 'SSH Tunnel'
  

  app 'SSH Tunnel.app'

  postflight do
    system 'tag', '-a', 'Purple', "#{staged_path}/SSH Tunnel.app"
  end
end