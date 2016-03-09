cask 'time-sink' do
  version :latest
  sha256 :no_check

  url 'https://manytricks.com/download/timesink'
  appcast 'https://manytricks.com/timesink/appcast.xml',
          checkpoint: 'f6886239162de22ba1b755eb14603ef514d5d00ab59b75969b3761ac1beadbaa'
  name 'Time Sink'
  homepage 'https://manytricks.com/timesink/'
  license :commercial

  auto_updates true

  app 'Time Sink.app'
end
