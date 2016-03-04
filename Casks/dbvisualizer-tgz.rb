cask 'dbvisualizer-tgz' do
  version '9.2.14'
  sha256 '91d6793117eecbf51e82527e51208677e0e8f6071f1afdc2b0595674e0eb3ccc'

  url "http://www.dbvis.com/product_download/dbvis-#{version}/media/dbvis_macos_#{version.gsub('.', '_')}.tgz"
  homepage 'http://www.dbvis.com/'
  license :commercial

  app 'DbVisualizer.app'
end