cask 'splashtop-streamer' do
  version '3.0.6.2'
  sha256 '619e72c668bb299bbce277dee0125fa0c87b69da931d48043e909e4b155826d0'

  # cloudfront.net is the official download host per the vendor homepage
  url "https://d17kmd0va0f0mp.cloudfront.net/mac/Splashtop_Streamer_MAC_v#{version}.dmg"
  name 'Splashtop Streamer'
  homepage 'http://www.splashtop.com/downloads'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  pkg 'Splashtop Streamer.pkg'

  uninstall pkgutil: 'com.splashtop.splashtopStreamer.*'
end
