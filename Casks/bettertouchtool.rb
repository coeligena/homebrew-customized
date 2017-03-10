cask 'bettertouchtool' do
  if MacOS.version <= :snow_leopard
    version '0.939'
    sha256 'b79f71602113dba3e2740e470b9e286025425f9d50d4f797bd47995816b462ae'

    # bettertouchtool.net was verified as official when first introduced to the cask
    url "https://bettertouchtool.net/btt#{version}.zip"

  else
    version :latest
    sha256 '3c14312e1f2337394d9e9b52b2ac76a1da4eb513c5cfada93733ccc0e4d2b027'

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
