cask 'mps' do
  version '2017.1.1,171.1216'
  sha256 '9392ad5ed41190088cd5da5cb05959cc4eac7971918b04536e51821f270d6184'

  url "https://download.jetbrains.com/mps/#{version.before_comma.major_minor}/MPS-#{version.before_comma}-macos.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=MPS&latest=true&type=release',
          checkpoint: 'f5cd8509511842a6833a7e0c84adab8d1829ed0d178f0d3b14570d0fbb0c0272'
  name 'JetBrains MPS'
  homepage 'https://www.jetbrains.com/mps/'

  auto_updates true

  app "MPS #{version.major_minor}.app"

  zap delete: [
                "~/MPSSamples.#{version.before_comma.major_minor}",
                "~/Library/Application Support/MPS#{version.before_comma.major_minor}",
                "~/Library/Preferences/MPS#{version.before_comma.major_minor}",
                "~/Library/Caches/MPS#{version.before_comma.major_minor}",
                "~/Library/Logs/MPS#{version.before_comma.major_minor}",
              ]
end
