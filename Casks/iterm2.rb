cask 'iterm2' do
  # note: "2" is not a version number, but an intrinsic part of the product name
  version '3.0.7'
  sha256 'd4fae6dd9e7f3173791bd7b56bc4fd3520fb197a374776833735e0f95fd6fa20'

  url "https://iterm2.com/downloads/stable/iTerm2-#{version.dots_to_underscores}.zip"
  appcast 'https://iterm2.com/appcasts/final.xml',
          checkpoint: '080d6081333679f3f93bb8fbd04fe85fcfab9bd84970baf776861f181b688da4'
  name 'iTerm2'
  homepage 'https://www.iterm2.com/'
  license :gpl

  auto_updates true
  depends_on macos: '>= :mountain_lion'
  depends_on arch: :intel

  app 'iTerm.app'

  zap delete: '~/Library/Preferences/com.googlecode.iterm2.plist'
end
