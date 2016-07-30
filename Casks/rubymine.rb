cask 'rubymine' do
<<<<<<< HEAD
  version '2016.1.2'
  sha256 '86ada622827c32bb8dc646f7696bfa63a33e9f0386fb6ab30c89391b3fd5e67b'
=======
  version '2016.2'
  sha256 '0c5f92a343fddf8f6e3c694d122c255c2b1cc6405c1a027d6b1777c67eb04091'
>>>>>>> ac71cd606f575c2b6ae4db8da93d9c44d8d02816

  url "https://download.jetbrains.com/ruby/RubyMine-#{version}.dmg"
  name 'RubyMine'
  homepage 'https://www.jetbrains.com/ruby/'
  license :commercial

  conflicts_with cask: 'rubymine-eap'

  app 'RubyMine.app'

  uninstall delete: '/usr/local/bin/mine'

  zap delete: [
                "~/Library/Application Support/RubyMine#{version.major_minor}",
                "~/Library/Preferences/RubyMine#{version.major_minor}",
                "~/Library/Caches/RubyMine#{version.major_minor}",
                "~/Library/Logs/RubyMine#{version.major_minor}",
              ]
end
