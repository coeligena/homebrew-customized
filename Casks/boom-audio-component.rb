cask 'boom-audio-component' do
  version :latest
  sha256 :no_check

  url 'http://globaldelight.com/boom/download/device/version1.4/update/BoomDevice.zip'
  name 'Boom Audio Component'
  homepage 'http://www.globaldelight.com/boom/install-boom-device.php?type=update&deviceVerison=1.4'
  

  pkg 'BoomDevice.pkg'
end
