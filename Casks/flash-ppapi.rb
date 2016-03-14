cask 'flash-ppapi' do
  version '21.0.0.182'
  sha256 '9a94f721dfc4630937aa536fa87af36987d849c7a00954e53a68454ed7a9449c'

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