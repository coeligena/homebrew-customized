cask 'iffmpeg' do
  version :latest
  sha256 :no_check

  url 'http://www.iffmpeg.com/iFFmpeg.dmg'
  name 'iFFmpeg'
  homepage 'http://www.iffmpeg.com/download.html'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'iFFmpeg.app'
end
