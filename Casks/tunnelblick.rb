cask 'tunnelblick' do
  if MacOS.release <= :snow_leopard
    version '3.5.8_build_4270.4530'
    sha256 'd634a9a5fd06f95c7325987197fb7890119bf0a40a3958284814958a14c20ce3'
  else
    version '3.6.2beta06_build_4555'
    sha256 'c8bd4488f58d379cc2dcbab9320c3db45bae39ea53444afb90534686108e203b'
  end

  url "https://www.tunnelblick.net/release/Tunnelblick_#{version}.dmg"
  appcast 'https://www.tunnelblick.net/appcast.rss',
        checkpoint: '91e22e98032e0143efb02618a5ea3cb1927c40d7e877bc609b2287da09da7a5c'
  name 'Tunnelblick'
  homepage 'https://www.tunnelblick.net'
  license :gpl

  auto_updates true
  depends_on macos: '>= :tiger'

  app 'Tunnelblick.app', :target => 'Tunnelblick Moved.app'

  uninstall launchctl: 'net.tunnelblick.tunnelblick.LaunchAtLogin',
            quit:      'net.tunnelblick.tunnelblick'

  caveats <<-EOS.undent
    For security reasons, #{token} must be installed to /Applications,
    and will request to be moved at launch.
  EOS
end
