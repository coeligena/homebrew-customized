cask 'mplayerx' do
  version '1.1.4-1920'
  sha256 '9306b11acd9df45464fc3ddca1a3a757f50ef019ea6a09ce13ad3f51f1ef1592'

  # sourceforge.net/mplayerx-osx was verified as official when first introduced to the cask
  url "https://downloads.sourceforge.net/mplayerx-osx/MPlayerX-#{version}.zip"
  appcast 'https://raw.githubusercontent.com/niltsh/MPlayerX-Deploy/master/appcast.xml',
          checkpoint: '7700102d2f188a738b2e3f2524a2fcbd510c25708ea58bb2e8953ef337bc7355'
  name 'MPlayerX'
  homepage 'http://mplayerx.org/'
  license :oss

  app 'MPlayerX.app'

  zap delete: [
                '~/.mplayer',
                '~/Library/Application Support/MPlayerX',
                '~/Library/Preferences/org.niltsh.MPlayerX.LSSharedFileList.plist',
                '~/Library/Preferences/org.niltsh.MPlayerX.plist',
                '~/Library/Caches/org.niltsh.MPlayerX',
              ]
end
