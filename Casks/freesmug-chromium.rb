cask 'freesmug-chromium' do
  version '47.0.2526.106'
  sha256 '56103834eaf55b40ae541999fb3d024c12cd014def0786efaeab3f8460bc4504'

  # sourceforge.net/osxportableapps was verified as official when first introduced to the cask
  url "https://downloads.sourceforge.net/osxportableapps/Chromium_OSX_#{version}.dmg"
  appcast 'https://sourceforge.net/projects/osxportableapps/rss?path=/Chromium',
          checkpoint: '04d8f777b18e1f54958dcd8badcd51eb778c64dcd55521d45a85179bbe23cd97'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'

  app 'Chromium.app'
end
