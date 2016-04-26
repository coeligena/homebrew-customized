cask 'evernote' do
  if MacOS.release <= :snow_leopard
    version :latest
    sha256 '06b6da6d74ccab08deabfdd4c9519b9bc7f7ef0f0db2a0e8b0cd72e781f2e0ed'
    url 'https://cdn1.evernote.com/mac/release/Evernote_402634.dmg'
  else
    version :latest
    sha256 :no_check
    url "https://evernote.com/download/get.php?file=EvernoteMac"
    appcast 'https://update.evernote.com/public/ENMac/EvernoteMacUpdate.xml',
            checkpoint: '0aa0e83defff628a87eb69245552fc87c947a86def8ad4213c625261ab382b2e'
  end

  name 'Evernote'
  homepage 'https://evernote.com/'
  license :gratis

  auto_updates true

  app 'Evernote.app'
end
