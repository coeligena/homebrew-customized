cask 'turbo-boost-switcher' do
  version '2.4.0'
  sha256 '0ec6e73bf0f522045de666c45a436c33f2837b5c823c03d8409df102e2a65188'

  # s3.amazonaws.com/turbo-boost-switcher was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/turbo-boost-switcher/Turbo+Boost+Switcher_#{version}.zip"
  name 'Turbo Boost Switcher'
  homepage 'http://www.rugarciap.com/turbo-boost-switcher-for-os-x/'

  app 'Turbo Boost Switcher.app'

  uninstall quit:       'rugarciap.com.Turbo-Boost-Switcher',
            kext:       'com.rugarciap.DisableTurboBoost',
            login_item: 'Turbo Boost Switcher'

  zap delete: '~/Library/Preferences/rugarciap.com.Turbo-Boost-Switcher.plist'
end
