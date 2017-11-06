cask 'skim' do
  version '1.4.30'
  sha256 '10166ef0ae47609089b48a1b2e21f1f5d8863a930b08df75378577728e88070f'

  url "https://downloads.sourceforge.net/skim-app/Skim/Skim-#{version}/Skim-#{version}.dmg"
  appcast 'http://skim-app.sourceforge.net/skim.xml',
          checkpoint: 'dd1fa456a150412c700ff53613dd55884b3a99d24153a78a383aa16b02a65133'
  name 'Skim'
  homepage 'http://skim-app.sourceforge.net/'

  app 'Skim.app'
  binary "#{appdir}/Skim.app/Contents/SharedSupport/displayline"
  binary "#{appdir}/Skim.app/Contents/SharedSupport/skimnotes"
  binary "#{appdir}/Skim.app/Contents/SharedSupport/skimpdf"

  zap trash: '~/Library/Preferences/net.sourceforge.skim-app.skim.plist'
end
