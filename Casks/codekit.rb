cask 'codekit' do
  version :latest
  sha256 :no_check

  url "https://codekitapp.com/binaries/codekit.zip"
  appcast 'https://incident57.com/codekit/appcast/ck3appcast.xml',
          checkpoint: 'd7f6c068fa4e310e604ed8c3a41a1d41dff5b97f4db9aa9b0d41fe0964b11d8c'
  name 'CodeKit'
  homepage 'https://incident57.com/codekit/'

  auto_updates true

  app 'CodeKit.app'
end
