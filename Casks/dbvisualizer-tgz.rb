cask 'dbvisualizer-tgz' do
  version '9.2.15'
  sha256 'b3fb9c6729133afffe3f472606d26b745911b2a890172442c416b184dfd746e3'

  url "http://www.dbvis.com/product_download/dbvis-#{version}/media/dbvis_macos_#{version.gsub('.', '_')}.tgz"
  homepage 'http://www.dbvis.com/'
  

  app 'DbVisualizer.app'
end