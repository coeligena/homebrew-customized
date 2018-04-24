cask 'flash-esr' do
  version '18.0.0.375'
  sha256 '0bb5bdd8ff11451c8be9a6746adc63c76d5172e6b94d9612b549421242469f32'

  # macromedia.com was verified as official when first introduced to the cask
  url "http://fpdownload.macromedia.com/get/flashplayer/current/licensing/mac/install_flash_player_#{version.split('.')[0]}_osx_pkg.dmg"
  name 'Adobe Flash Player Extended Support Release'
  homepage 'https://www.adobe.com/fi/products/flashplayer/distribution3.html'
  

  pkg 'Install Adobe Flash Player.pkg'

  uninstall pkgutil: 'com.adobe.pkg.FlashPlayer',
            delete:  '/Library/Internet Plug-Ins/Flash Player.plugin'

  zap       delete: [
                      '~/Library/Caches/Adobe/Flash Player',
                      '~/Library/Logs/FlashPlayerInstallManager.log',
                    ]
end
