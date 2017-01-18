cask 'tunnelblick' do
  if MacOS.version <= :snow_leopard
    version '3.5.10_build_4270.4563'
    sha256 '2219f7ffcf5a5be7fb5f55945a19f6b3966e73d500feb03d8c376a0e00640ade'
  else
    version '3.7.0beta01_build_4780'
    sha256 'dc6da2b31ad8059fe19c9c243429e162f3ab9f0066e7d4264b5494c03b7a274e'
  end

  url "https://www.tunnelblick.net/release/Tunnelblick_#{version}.dmg"
  name 'Tunnelblick'
  homepage 'https://www.tunnelblick.net/'

  auto_updates true
  depends_on macos: '>= :tiger'

  app 'Tunnelblick.app'#, :target => 'Tunnelblick Moved.app'

  uninstall launchctl: 'net.tunnelblick.tunnelblick.LaunchAtLogin',
            quit:      'net.tunnelblick.tunnelblick'

  zap delete: [
                '~/Library/Application Support/Tunnelblick',
                '~/Library/Caches/com.apple.helpd/SDMHelpData/Other/English/HelpSDMIndexFile/net.tunnelblick.tunnelblick.help',
                '~/Library/Caches/net.tunnelblick.tunnelblick',
                '~/Library/LaunchAgents/net.tunnelblick.tunnelblick.LaunchAtLogin.plist',
                '~/Library/Preferences/net.tunnelblick.tunnelblick.plist',
              ]

  caveats <<-EOS.undent
    For security reasons, #{token} must be installed to /Applications,
    and will request to be moved at launch.
  EOS
end
