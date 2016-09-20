cask 'bittorrent-sync' do
  version :latest
  sha256 :no_check

  url 'https://download-cdn.resilio.com/stable/osx/Resilio-Sync.dmg'
  name 'BitTorrent Sync'
  homepage 'https://www.getsync.com/'
  license :gratis

  app 'Resilio Sync.app'
end
