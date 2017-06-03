cask 'macid' do
  version :latest
  sha256 'b13c7018e073007ec5ad2e2b8573b0d1dae7d7be77fb380ac0055ba269fdf80b'

  url "https://macid.co/download/"
  name 'MacID'
  homepage 'https://macid.co/'
  license :gratis

  depends_on macos: '>= :yosemite'

  app 'MacID.app'

  zap delete: '~/Library/Preferences/com.kanecheshire.MacIDOSX.plist'
end
