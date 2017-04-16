cask 'maltego-ce' do
  version '4.0.11.9358'
  sha256 'eed48ed7d6a32cbb6d963c1af0c0fd7f9c78e89351aa746804889e521469ac3f'

  url "https://www.paterva.com/malv#{version.major}/community/MaltegoCE.v#{version}.dmg"
  name 'Maltego CE'
  homepage 'https://www.paterva.com/web7/buy/maltego-clients/maltego-ce.php'

  app "Maltego CE v#{version.major_minor_patch}.app"

  zap delete: "~/Library/Application Support/maltego/v#{version.major_minor_patch}CE",
      rmdir:  '~/Library/Application Support/maltego'

  caveats do
    depends_on_java('7+')
  end
end
