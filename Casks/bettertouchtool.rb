cask 'bettertouchtool' do
  if MacOS.version <= :snow_leopard
    version '0.939'
    sha256 'fad5e9d36259c379bdb33188cf15d179fd9ff73023035c98f5734e7e3e13bb75'

    # bettertouchtool.net was verified as official when first introduced to the cask
    url "https://bettertouchtool.net/btt#{version}.zip"

    license :gratis
  else
    version :latest
    sha256 '8607e1069282654cd7de2f3073a3c89f910db86439677d61518459b750d8df7f'

    url "https://www.boastr.net/releases/BetterTouchTool.zip"
    appcast 'http://appcast.boastr.net',
            checkpoint: '53420365a59bf4b6bf96e270fda99d1cc339be77b2c34002f4c3a76571674f1e'

    license :commercial
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
