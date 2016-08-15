cask 'splashtop-personal' do
  version '2.6.6'
  sha256 '761164ff34d6d684c0935bf9339c02438fd85539ec15676136d0cb85529273d7'

  # d17kmd0va0f0mp.cloudfront.net was verified as official when first introduced to the cask
  url "https://d17kmd0va0f0mp.cloudfront.net/macclient/STP/Splashtop_Personal_v#{version}.dmg"
  name 'Splashtop Personal'
  homepage 'http://www.splashtop.com/personal'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  pkg 'Splashtop Personal.pkg'

  uninstall pkgutil: 'com.splashtop.stp.*'
end
