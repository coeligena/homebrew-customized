cask 'splashtop-streamer' do
  version '3.1.2.0'
  sha256 'e1ee59c52dbb7c478e324d0b0d883bd5dcadadc396a2d8103b0c00543c273fdb'

  # d17kmd0va0f0mp.cloudfront.net was verified as official when first introduced to the cask
  url "https://d17kmd0va0f0mp.cloudfront.net/mac/Splashtop_Streamer_Mac_v#{version}.dmg"
  name 'Splashtop Streamer'
  homepage 'https://w2ww.splashtop.com/downloads'

  pkg 'Splashtop Streamer.pkg'

  uninstall pkgutil: 'com.splashtop.splashtopStreamer.*'
end
