cask 'arq' do
  version :latest
  sha256 :no_check

  url 'https://www.arqbackup.com/download/Arq_OSX.zip'
  appcast "https://www.arqbackup.com/download/arq4.xml",
          checkpoint: '537720fc6b4b69b44ccc36ff81198d378fedae8a2783589cbbd8d730a98396ea'
  name 'Arq'
  homepage 'https://www.arqbackup.com/'
  license :commercial

  app 'Arq.app'

  postflight do
    suppress_move_to_applications
  end
end
