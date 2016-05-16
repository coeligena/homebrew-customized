cask 'freesmug-chromium' do
  version '47.0.2526.106'
  sha256 '56103834eaf55b40ae541999fb3d024c12cd014def0786efaeab3f8460bc4504'

  # sourceforge.net/sourceforge/osxportableapps was verified as official when first introduced to the cask
  url "http://downloads.sourceforge.net/sourceforge/osxportableapps/Chromium_OSX_#{version}.dmg"
  appcast 'https://sourceforge.net/projects/osxportableapps/rss?path=/Chromium',
          checkpoint: '29135e524e31c17d147d9cb6077d323b81a26fee54f039e80ebd845614b761e8'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'
  license :gpl

  app 'Chromium.app'
end
