cask 'tunnelblick' do
  if MacOS.release <= :snow_leopard
    version '3.5.8_build_4270.4530'
    sha256 'd634a9a5fd06f95c7325987197fb7890119bf0a40a3958284814958a14c20ce3'
  else
    version '3.6.3beta02_build_4559'
    sha256 '200b4d376db41aa740074d64f06a58d2115db2a5e56e1c4ed576d15a35205465'
  end

  url "https://www.tunnelblick.net/release/Tunnelblick_#{version}.dmg"
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
