cask 'cyberduck' do
  version '5.0.3.20504'
  sha256 'ce1f20d96d6112f2ba1c5c5144ee07109a6ffd7da6124a66b88a1e06e63bfc32'

  url "https://update.cyberduck.io/Cyberduck-#{version}.zip"
  appcast 'https://version.cyberduck.io/changelog.rss',
          checkpoint: '6333c657d59e41d76aa77dc32c5bfcfd4e5b8ad5a360bbf3469db95c06e9010c'
  name 'Cyberduck'
  homepage 'https://cyberduck.io/'
  license :gpl

  app 'Cyberduck.app'

  zap delete: [
                '~/Library/Application Support/Cyberduck',
                '~/Library/Preferences/ch.sudo.cyberduck.plist',
              ]
end
