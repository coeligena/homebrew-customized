cask 'prizmo' do
  version :latest
  sha256 :no_check

  url "http://www.creaceed.com/downloads/prizmo3.zip"
  appcast 'http://www.creaceed.com/appcasts/prizmo3.xml',
          checkpoint: '16e7f3d4e35494389f7582fd8ca8ed8b196aeb88e4a2bfd4a4dab7899d4ea510'
  name 'Prizmo'
  homepage 'http://www.creaceed.com/prizmo'
  license :freemium

  depends_on macos: '>= :yosemite'

  app 'Prizmo.app'
end
