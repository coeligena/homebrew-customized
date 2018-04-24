cask 'sshshell' do
  version :latest
  sha256 :no_check

  homepage '16.06'
  url "http://localhost:8000/Internet%2C%20Networking%20%26%20Basic%20Tools/SSH%20Shell/SSH%20Shell%20#{homepage}.zip"
  name 'SSH Shell'
  

  app 'SSH Shell.app'

  postflight do
    system 'tag', '-a', 'Purple', "#{staged_path}/SSH Shell.app"
  end
end