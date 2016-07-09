cask 'darktable' do
  version '2.0.5'
  sha256 'e0ae0e5e19771810a80d6851e022ad5e51fb7da75dcbb98d96ab5120b38955fd'

  # github.com/darktable-org/darktable was verified as official when first introduced to the cask
  url "https://github.com/darktable-org/darktable/releases/download/release-#{version}/darktable-#{version}.dmg"
  appcast 'https://github.com/darktable-org/darktable/releases.atom',
          checkpoint: '7983f9d630d521bc530069d06be63b971685d9ed81b181d70bba95c788cdd978'
  name 'darktable'
  homepage 'https://www.darktable.org/'
  license :gpl

  app 'darktable.app'
end
