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
          checkpoint: '1bf5f5f0d8b69f86c949926d4ac66245ef2ecdc00adaddc330c78752c4cb65e1'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'

  app 'Chromium.app'
end
