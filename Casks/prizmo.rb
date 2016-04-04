cask 'prizmo' do
  version :latest
  sha256 :no_check

  url "http://www.creaceed.com/downloads/prizmo3.zip"
  appcast 'http://www.creaceed.com/appcasts/prizmo3.xml',
          checkpoint: '67f7f81fe7504cd71f51d9707e6f7fb76b054a21560db94ebe401d3c6205e304'
  name 'Prizmo'
  homepage 'http://www.creaceed.com/prizmo'
  license :freemium

  depends_on macos: '>= :yosemite'

  app 'Prizmo.app'
end
