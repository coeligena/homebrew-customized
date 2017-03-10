cask 'rider-eap' do
  version '171.3085.726'
  sha256 '37b257a9e79fe30402d73297494dcccaadccaa4fcd5ad6a9907eaf685d67c376'

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
