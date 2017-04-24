cask 'password-gorilla' do
  version '1.5.3.7.3'
  sha256 '51c443fb58a3628c2a45bd3160096abb9b017f33e6a08628636168f996ad0414'

  # gorilla.dp100.com was verified as official when first introduced to the cask
  url "https://gorilla.dp100.com/downloads/gorilla.mac.#{version.no_dots}.zip"
  appcast 'http://gorilla.dp100.com/downloads/',
          checkpoint: '565d731e4ce49b9f948d244da4427b0294673c3c701608b7501c1dfb4d200272'
  name 'Password Gorilla'
  homepage 'https://github.com/zdia/gorilla'

  app 'Password Gorilla.app'

  caveats <<-EOS.undent
    Gatekeeper may need to be temporarily disabled for the first launch.
    See https://gorilla.dp100.com/downloads/MacOS-Gatekeeper.html
  EOS
end
