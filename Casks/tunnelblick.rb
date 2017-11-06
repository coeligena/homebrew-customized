cask 'tunnelblick' do
  version '3.7.5beta01,4910'
  sha256 'a7a006228e780c520a14434ea387458798ecd6a1f17f8a334cc0459862991218'

  # github.com/Tunnelblick/Tunnelblick/releases/download was verified as official when first introduced to the cask
  url "https://github.com/Tunnelblick/Tunnelblick/releases/download/v#{version.before_comma}/Tunnelblick_#{version.before_comma}_build_#{version.after_comma}.dmg"
  appcast 'https://github.com/Tunnelblick/Tunnelblick/releases.atom',
          checkpoint: '25fed445d9974e8a0450a826a991ee4b79268f0ef072f22ead6f5b50887469d0'
  name 'Tunnelblick'
  homepage 'https://www.tunnelblick.net/'

  auto_updates true

  app 'Tunnelblick.app'#, :target => 'Tunnelblick Moved.app'

  uninstall_preflight do
    set_ownership "#{appdir}/Tunnelblick.app"
  end

  uninstall launchctl: [
                         'net.tunnelblick.tunnelblick.LaunchAtLogin',
                         'net.tunnelblick.tunnelblick.tunnelblickd',
                       ],
            quit:      'net.tunnelblick.tunnelblick'

  zap delete: [
                '~/Library/Caches/com.apple.helpd/SDMHelpData/Other/English/HelpSDMIndexFile/net.tunnelblick.tunnelblick.help',
                '~/Library/Caches/net.tunnelblick.tunnelblick',
              ],
      trash:  [
                '/Library/Application Support/Tunnelblick',
                '~/Library/Application Support/Tunnelblick',
                '~/Library/Preferences/net.tunnelblick.tunnelblick.plist',
              ]

  caveats <<~EOS
    For security reasons, #{token} must be installed to /Applications,
    and will request to be moved at launch.
  EOS
end
