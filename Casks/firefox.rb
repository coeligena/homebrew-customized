cask 'firefox' do
  version :latest
  sha256 :no_check

  url "https://ftp.mozilla.org/pub/firefox/releases/46.0/mac/en-US/Firefox%2046.0.dmg",
          user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36'
  appcast "https://aus5.mozilla.org/update/3/Firefox/#{version}/0/Darwin_x86_64-gcc3-u-i386-x86_64/en-US/release/Darwin%2015.3.0/default/default/update.xml?force=1",
          checkpoint: '81b10965246c46c5a6569f8d777c38b6a5835e02481414a6c951cc39dc533ef7'
  name 'Mozilla Firefox'
  homepage 'https://www.mozilla.org/en-US/firefox/'
  license :mpl

  auto_updates true

  app 'Firefox.app'

  zap delete: [
                '~/Library/Application Support/Firefox',
                '~/Library/Caches/Firefox',
              ]

  caveats <<-EOS.undent
  The Mac App Store version of 1Password won't work with a Homebrew-cask-linked Mozilla Firefox. To bypass this limitation, you need to either:
    + Move Mozilla Firefox to your /Applications directory (the app itself, not a symlink).
    + Install 1Password from outside the Mac App Store (licenses should transfer automatically, but you should contact AgileBits about it).
  EOS
end
