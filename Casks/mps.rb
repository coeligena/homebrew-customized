cask 'mps' do
  version '2017.1,171.1065'
  sha256 'db5ef0b93a3308c0db0e590514a434829d1200eb1ba10a5fd545621dfa116e39'

  url "https://download.jetbrains.com/mps/#{version.before_comma}/MPS-#{version.before_comma}-macos.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=MPS&latest=true&type=release',
          checkpoint: '9d5a7ebd2a13e2ff6c63a3f09912769640814787e079419b902e5cbd7e32d2b7'
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
