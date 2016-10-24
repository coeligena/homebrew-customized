cask 'bettertouchtool' do
  if MacOS.version <= :snow_leopard
    version '0.939'
    sha256 'fad5e9d36259c379bdb33188cf15d179fd9ff73023035c98f5734e7e3e13bb75'

    # bettertouchtool.net was verified as official when first introduced to the cask
    url "https://bettertouchtool.net/btt#{version}.zip"

  else
    version :latest
    sha256 'd934b42c2dc93a7378d6043d265c61d8f7b3c3ef38ba25329a9e9892fd2fae01'

    url "https://www.boastr.net/releases/BetterTouchTool.zip"
    appcast 'http://appcast.boastr.net',
            checkpoint: '4e8f1aa8caa162a4c742ca5f237dae7c75216bd945c1bce1eb7b51dd45839124'

  end

  name 'BetterTouchTool'
  homepage 'https://boastr.net/'

  auto_updates true
  accessibility_access true

  app 'BetterTouchTool.app'

  uninstall login_item: 'BetterTouchTool'

  zap delete: [
                '~/Library/Preferences/com.hegenberg.BetterTouchTool.plist',
                '~/Library/Application Support/BetterTouchTool',
              ]
end
