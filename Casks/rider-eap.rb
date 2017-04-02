cask 'rider-eap' do
  version '171.3655.1246'
  sha256 'eb20ba03aa2cd1063fa9ec3846b8216f784d24234090310a51ac496c9e608b00'

  url "https://download.jetbrains.com/resharper/riderRS-#{version}.dmg"
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
