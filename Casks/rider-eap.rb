cask 'rider-eap' do
  version '163.8671'
  sha256 'b7eb5bf01a7e84c0e6a329cba73f7306fe35c7a9e4715710e6a7e3daab633136'

  url "http://download.jetbrains.com/resharper/riderRS-#{version}.dmg"
  name 'AppCode'
  homepage 'https://www.jetbrains.com/rider/'
  license :commercial

  app 'Rider EAP.app'

  zap :delete => [
                  '~/Library/Preferences/com.jetbrains.Rider-EAP.plist',
                  '~/Library/Preferences/Rider10',
                  '~/Library/Application Support/Rider10',
                  '~/Library/Caches/Rider10',
                  '~/Library/Logs/Rider10',
                 ]

  conflicts_with :cask => 'rider'
end
