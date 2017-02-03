cask 'splashtop-streamer' do
  version '3.1.2.1'
  sha256 '570b112ffacca4e656424d4498746b1332aef1f0030f03856c3122c8b09d86ab'

  # d17kmd0va0f0mp.cloudfront.net was verified as official when first introduced to the cask
  url "https://d17kmd0va0f0mp.cloudfront.net/mac/Splashtop_Streamer_Mac_v#{version}.dmg"
  appcast 'https://www.splashtop.com/wp-content/themes/responsive/downloadx.php?platform=mac',
          checkpoint: '4ba18465508615ae26412e19d4515c8cd3b19c7dd7e2790c168632d5f7a3fb40'
  name 'Splashtop Streamer'
  homepage 'https://www.splashtop.com/downloads'

  pkg 'Splashtop Streamer.pkg'

  uninstall pkgutil: 'com.splashtop.splashtopStreamer.*'
end
