cask 'sunlogin-remote' do
  version '1.1'
  sha256 '81cf6e9b088cf7d05489228fd9f7c84388ab44dbaba5821865089a4d1a1d6a18'

  url "https://download.oray.com/sunlogin/SunloginRemote_v#{version}.dmg"
  name 'Sunlogin Remote'
  name '向日葵控制端'
  homepage 'https://sunlogin.oray.com/'

  app 'Sunlogin Remote.app'
end
