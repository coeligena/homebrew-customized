cask 'noobproof' do
  version '1.5'
  sha256 '6e74a5aec8e9cf9102c160019990e90ae46486358959fa0d22517b4171f8209a'

  url "http://www.hanynet.com/noobproof-#{version}.zip"
  appcast 'http://www.hanynet.com/noobproof/'
  name 'NoobProof'
  homepage 'http://www.hanynet.com/noobproof/'

  app 'NoobProof.app'
end
