cask 'shotcut' do
  version '16.08.04'
  sha256 '895409d9dca080a243db1e3b4f62665a7e4a8d9712f68281b11f227127c23e7b'

  # github.com/mltframework/shotcut was verified as official when first introduced to the cask
  url "https://github.com/mltframework/shotcut/releases/download/v#{version.major_minor}/shotcut-osx-x86_64-#{version.no_dots}.dmg"
  appcast 'https://github.com/mltframework/shotcut/releases.atom',
          checkpoint: 'f9f9af0f09c04af5857e334f90c27f71dea99141723966608166f0b92e7c1522'
  name 'Shotcut'
  homepage 'https://www.shotcut.org/'
  license :gpl

  app 'Shotcut.app'
end
