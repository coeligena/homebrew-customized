cask 'firefox' do
  version :latest
  sha256 :no_check

  url "https://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US",
          user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36'
  appcast "https://aus5.mozilla.org/update/3/Firefox/#{version}/0/Darwin_x86_64-gcc3-u-i386-x86_64/en-US/release/Darwin%2015.3.0/default/default/update.xml?force=1",
          checkpoint: '3bcddb4a768718aa1c44067092cefd5b4e0c456dd6a95a236bf4e438f2d7b8d8'
  name 'Mozilla Firefox'
  homepage 'https://www.mozilla.org/en-US/firefox/'
  license :mpl

  auto_updates true

  app 'Firefox.app'

  zap delete: [
                '~/Library/Application Support/Firefox',
                '~/Library/Caches/Firefox',
              ]
end
