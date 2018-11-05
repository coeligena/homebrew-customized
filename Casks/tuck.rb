cask 'tuck' do
  version :latest
  sha256 :no_check

  url 'https://www.irradiatedsoftware.com/downloads/Tuck.zip'
  appcast 'https://www.irradiatedsoftware.com/updates/profiles/tuck.php',
  name 'Tuck'
  homepage 'https://www.irradiatedsoftware.com/labs/'

  app 'Tuck.app'

  zap trash: [
               '~/Library/Preferences/com.irradiatedsoftware.Tuck.plist',
             ]
end
