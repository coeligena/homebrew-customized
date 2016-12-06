cask 'bettertouchtool' do
  if MacOS.version <= :snow_leopard
    version '0.939'
    sha256 'fad5e9d36259c379bdb33188cf15d179fd9ff73023035c98f5734e7e3e13bb75'

    # bettertouchtool.net was verified as official when first introduced to the cask
    url "https://bettertouchtool.net/btt#{version}.zip"

  else
    version :latest
    sha256 'ac3aba361483986b694c7616739d316d13680db64eeabcd1dbb6b99f28ba453f'

    url "https://www.boastr.net/releases/BetterTouchTool.zip"
    appcast 'http://appcast.boastr.net',
            checkpoint: 'df6443a5e3285a68a7aba41851eaf5d6237a4f65a8508d81ffebe715715c4674'

  end

  name 'BetterTouchTool'
  homepage 'https://www.boastr.net/'

  auto_updates true
  accessibility_access true

  app 'BetterTouchTool.app'

  uninstall login_item: 'BetterTouchTool'

  zap delete: [
                '~/Library/Preferences/com.hegenberg.BetterTouchTool.plist',
                '~/Library/Application Support/BetterTouchTool',
              ]
end
