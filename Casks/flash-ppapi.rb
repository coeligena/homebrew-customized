cask 'flash-ppapi' do
  version '23.0.0.162'
  sha256 'b1c468b9f523e1b267115ad75e1074d89528b199bc9d21101d8b5be8fb13450c'

  # macromedia.com is the official download host per the vendor homepage
  url "https://fpdownload.macromedia.com/get/flashplayer/pdc/#{version}/install_flash_player_osx_ppapi.dmg"
  name 'Adobe Flash Player'
  homepage 'https://www.adobe.com/products/flashplayer/distribution3.html'
  license :gratis

  installer :manual => 'Install Adobe Pepper Flash Player.app'

  uninstall :pkgutil => 'com.adobe.pkg.FlashPlayer',
            :delete  => '/Library/Internet Plug-Ins/PepperFlashPlayer/PepperFlashPlayer.plugin'
  zap       :delete => [
                        '~/Library/Caches/Adobe/Flash Player',
                        '~/Library/Logs/FlashPlayerInstallManager.log',
                       ]
end