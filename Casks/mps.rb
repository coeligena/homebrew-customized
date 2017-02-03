cask 'mps' do
  version '3.4.3'
  sha256 '9bee75f75c341e7c22d34b748d88040f1cca50b9db847c5f1220fd61f4580ebb'

  url "https://download-cf.jetbrains.com/mps/#{version.major_minor.no_dots}/MPS-#{version}-macos.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=MPS&latest=true&type=release',
          checkpoint: 'ef6ad3b25f2b29b8c5d3735f2f26e496449707fa70e32599e66fb0b745b31c8b'

  name 'JetBrains MPS'
  homepage 'https://www.jetbrains.com/mps/'

  conflicts_with cask: 'mps-eap'

  app "MPS #{version.major_minor}.app"

  zap delete: [
                "~/MPSSamples.#{version}",
                "~/Library/Application Support/MPS#{version.major_minor.no_dots}",
                "~/Library/Preferences/MPS#{version.major_minor.no_dots}",
                "~/Library/Caches/MPS#{version.major_minor.no_dots}",
                "~/Library/Logs/MPS#{version.major_minor.no_dots}",
              ]
end
