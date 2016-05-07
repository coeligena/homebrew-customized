cask 'peakhour' do
  version '3.1.4'
  sha256 'f9e9d86a4e5e6122fa87f7dc1e1baa750aac4b7160a243dba117dbe98d213ad6'

  url "https://updates.peakhourapp.com/releases/PeakHour%20#{version}.zip"
  appcast 'https://updates.peakhourapp.com/PeakHourAppcast.xml',
          checkpoint: '0081474ff479a43336d19bea87fb424d3a79797f812db4fe70622199a73f33a4'
  name 'PeakHour'
  homepage 'https://www.peakhourapp.com'
  license :commercial

  app "PeakHour #{version.to_i}.app"
end
