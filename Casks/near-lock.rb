cask 'near-lock' do
  version '3.6.1'
  sha256 '68c4b4e9f4f3b01908f5004650e845ffc7603ddc3d44c76b6534e12ebb641c7e'

  url 'http://nearlock.me/downloads/nearlock.dmg'
  appcast 'http://nearlock.me/downloads/nearlock.xml',
          checkpoint: 'e0ca65379137858b4f565a9abd40195cd834829143575e800465096bf86a6a7c'
  name 'Near Lock'
  homepage 'http://nearlock.me/'
  license :gratis

  app 'Near Lock.app'
end
