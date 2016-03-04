cask 'freesmug-chromium' do
  version '47.0.2526.106'
  sha256 '56103834eaf55b40ae541999fb3d024c12cd014def0786efaeab3f8460bc4504'

  # sourceforge.net/sourceforge/osxportableapps was verified as official when first introduced to the cask
  url "http://downloads.sourceforge.net/sourceforge/osxportableapps/Chromium_OSX_#{version}.dmg"
  appcast 'https://sourceforge.net/projects/osxportableapps/rss?path=/Chromium',
          checkpoint: '7e8bc74ea4d5d138526d369c0a72732a5991ef424d09f02e1511e192c5f1076d'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'
  license :gpl

  app 'Chromium.app'
end
