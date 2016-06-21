cask 'flash-esr' do
  version '18.0.0.360'
  sha256 '76070c1c7dbbb779f29cb1a5c5ece5dfc55e4b78216cfd58aa2e52bca74ba965'

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
