cask 'time-sink' do
  version :latest
  sha256 :no_check

  url 'https://manytricks.com/download/timesink'
  appcast 'https://manytricks.com/timesink/appcast.xml',
          checkpoint: '31adc137baa25f72cb6609ac8048d2a502c56ab8a2dfcf1311cb41a872a99381'
  name 'Time Sink'
  homepage 'https://manytricks.com/timesink/'
  license :commercial

  auto_updates true

  app 'Time Sink.app'
end
