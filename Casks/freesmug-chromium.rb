cask 'freesmug-chromium' do
<<<<<<< HEAD
  version '47.0.2526.106'
  sha256 '56103834eaf55b40ae541999fb3d024c12cd014def0786efaeab3f8460bc4504'
=======
  version '52.0.2743.82'
  sha256 'c97aa92cd843b288a887d4e2f87105dc4a5f3b4119dbd8cecaf3e4c0e7d9dc44'
>>>>>>> ac71cd606f575c2b6ae4db8da93d9c44d8d02816

  # sourceforge.net/osxportableapps was verified as official when first introduced to the cask
  url "https://downloads.sourceforge.net/osxportableapps/Chromium_OSX_#{version}.dmg"
  appcast 'https://sourceforge.net/projects/osxportableapps/rss?path=/Chromium',
          checkpoint: '0e78bc6f66e84e9ca3d5173f2b4294029b5bdb80fb006b70116d696b49aa7dad'
  name 'Chromium'
  homepage 'http://www.freesmug.org/chromium'
  license :gpl

  app 'Chromium.app'
end
