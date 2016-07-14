cask 'flash-esr' do
  version '18.0.0.366'
  sha256 '25b72f2a36fe8b1f9953d5e9f8cebe936d5dc33a5b14c0eac69a51c940537912'

  # macromedia.com was verified as official when first introduced to the cask
  url "http://fpdownload.macromedia.com/get/flashplayer/current/licensing/mac/install_flash_player_#{version.split('.')[0]}_osx_pkg.dmg"
  name 'Adobe Flash Player Extended Support Release'
  homepage 'https://www.adobe.com/fi/products/flashplayer/distribution3.html'
  license :gratis

  pkg 'Install Adobe Flash Player.pkg'

  uninstall pkgutil: 'com.adobe.pkg.FlashPlayer',
            delete:  '/Library/Internet Plug-Ins/Flash Player.plugin'

  zap       delete: [
                      '~/Library/Caches/Adobe/Flash Player',
                      '~/Library/Logs/FlashPlayerInstallManager.log',
                    ]
end
