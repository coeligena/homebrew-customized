cask 'foobarplus' do
  version '1.5,6'
  sha256 '26de719bc39b142db41463ba67f430b5791928f85c0fc17469b1d5a39c1579af'

  # amazonaws.com/foobarapp was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/foobarapp/FoobarPlus+#{version.before_comma}+(#{version.after_comma}).zip"
  appcast 'https://www.foobaz.io/sparkle/com.weirdrocketeer.FoobarPlus.xml'
  name 'FoobarPlus'
  homepage 'https://www.foobaz.io/plus/'

  app 'FoobarPlus.app'

  zap trash: [
               '~/Library/Caches/com.weirdrocketeer.FoobarPlus',
               '~/Library/Preferences/com.weirdrocketeer.FoobarPlus.plist',
             ]
end
