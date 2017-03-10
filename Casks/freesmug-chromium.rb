cask 'freesmug-chromium' do
  # https://chromium.googlesource.com/chromium/src/+/86154b409eed6ea7f9177f6bf576e76533ab2f7b
  # https://codereview.chromium.org/1267183003/#ps20001
  # https://omahaproxy.appspot.com/
  # changelog http://googlechromereleases.blogspot.co.at/2015/08/stable-channel-update_20.html
  # next changelog http://googlechromereleases.blogspot.it/2015/09/stable-channel-update.html
  version '44.0.2403.157'
  sha256 '71215ab335d132c1ad3c6b3fcb5ebc75d4b3384b7c988f7980377cc35280c6f2'

  # sourceforge.net/osxportableapps was verified as official when first introduced to the cask
  url "https://downloads.sourceforge.net/osxportableapps/Chromium_OSX_#{version}.dmg"
  appcast 'https://sourceforge.net/projects/osxportableapps/rss?path=/Chromium',
          checkpoint: '907b6cb3ad61d53e4f5c655a624b2eeaaec5c2b58af5128bce8dda796e01f65c'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'

  app 'Chromium.app'
end
