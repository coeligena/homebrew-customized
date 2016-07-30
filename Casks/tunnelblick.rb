cask 'tunnelblick' do
  if MacOS.release <= :snow_leopard
    version '3.5.9_build_4270.4560'
    sha256 '7651754cab92c5f61fc22b55448875cf14fcf8b6f5b3ba469899740c49b6fae3'
  else
<<<<<<< HEAD
    version '3.6.6beta02_build_4581'
    sha256 'aab2c86279e1eb7b13b4a441d30518a50bc16dd4000500e24ec61f4d929a2a92'
=======
    version '3.6.5_build_4566'
    sha256 '43f983b9ef8b2c197360c59c42ef4af194adf3242018b3815e9f39ed751eaddd'
>>>>>>> ac71cd606f575c2b6ae4db8da93d9c44d8d02816
  end

  url "https://www.tunnelblick.net/release/Tunnelblick_#{version}.dmg"
  name 'Tunnelblick'
  homepage 'https://www.tunnelblick.net'
  license :gpl

  auto_updates true
  depends_on macos: '>= :tiger'

  app 'Tunnelblick.app'#, :target => 'Tunnelblick Moved.app'

  uninstall launchctl: 'net.tunnelblick.tunnelblick.LaunchAtLogin',
            quit:      'net.tunnelblick.tunnelblick'

  caveats <<-EOS.undent
    For security reasons, #{token} must be installed to /Applications,
    and will request to be moved at launch.
  EOS
end
