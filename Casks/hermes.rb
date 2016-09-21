cask 'hermes' do
  version '1.3.0'
  sha256 '661544619346c83c586890a93e6b68af6e86e09b8605acc92d53921c2c160911'

  # github.com/HermesApp/Hermes was verified as official when first introduced to the cask
  url "https://github.com/HermesApp/Hermes/releases/download/v#{version}/Hermes-#{version}.zip"
  appcast 'https://raw.githubusercontent.com/HermesApp/HermesApp.github.io/master/versions.xml',
          checkpoint: 'f02de008d4f279cd956d828a0b36386af81947a2b6cba42f5a79915c978318ab'
  name 'Hermes'
  homepage 'http://hermesapp.org/'
  license :mit

  auto_updates true

  app 'Hermes.app'

  zap delete: [
                '~/Library/Application Support/Hermes',
                '~/Library/Caches/com.alexcrichton.Hermes',
                '~/Library/Preferences/com.alexcrichton.Hermes.plist',
              ]
end
