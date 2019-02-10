cask 'seil' do
  if MacOS.version <= :yosemite
    version '11.3.0'
    sha256 '5fd57db4f96b833c4f1005b3d68711bb9ea52f0db8e98a0793eb2a9ff5d290b2'
  else
    version '12.1.2'
    sha256 '1c7a684a56f34633ec5844b4438347612a9705d1728adc88eba7011937d65e99'
  end

  url "https://pqrs.org/osx/karabiner/files/Seil-#{version}.dmg"
  appcast 'https://pqrs.org/osx/karabiner/files/seil-appcast.xml'
  name 'Seil'
  homepage 'https://pqrs.org/osx/karabiner/seil.html'

  depends_on macos: '<= :el_capitan'

  pkg 'Seil.sparkle_guided.pkg'

  uninstall quit:    'org.pqrs.Seil',
            kext:    'org.pqrs.driver.Seil',
            pkgutil: 'org.pqrs.driver.Seil'

  zap trash: [
               '~/Library/Caches/org.pqrs.PCKeyboardHack',
               '~/Library/Caches/org.pqrs.Seil',
               '~/Library/Preferences/org.pqrs.PCKeyboardHack.plist',
               '~/Library/Preferences/org.pqrs.Seil.plist',
             ]

  caveats do
    discontinued
  end
end
