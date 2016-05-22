cask 'exiftool' do
  version '10.17'
  sha256 '40df9539b9319b6df769159651ebae176f6ef2b4092a395d218ba4ba39a41670'

  url "http://owl.phy.queensu.ca/~phil/exiftool/ExifTool-#{version}.dmg"
  appcast 'http://owl.phy.queensu.ca/~phil/exiftool/rss.xml',
          checkpoint: '9fc475063d255d4141bcaf3f46fe85bf0b3eee1aab4ebbddc174407c447fc324'
  name 'ExifTool by Phil Harvey'
  homepage 'http://www.sno.phy.queensu.ca/~phil/exiftool/'
  license :gpl

  pkg "ExifTool-#{version}.pkg"

  uninstall pkgutil: 'com.philharvey.image-exiftool'
end
