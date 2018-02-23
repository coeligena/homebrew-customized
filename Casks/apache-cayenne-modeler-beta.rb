cask 'apache-cayenne-modeler-beta' do
  version '4.0.B2'
  sha256 'd54e7aa76bcad73db33eff43a5a19123a43d91a78797d9f23ada12a31c006e73'

  url "https://www-eu.apache.org/dist/cayenne/#{version}/cayenne-#{version}-macosx.dmg"
  name 'Apache Cayenne Modeler'
  homepage 'https://cayenne.apache.org/download.html'

  suite "cayenne-#{version}-macosx", :target => 'CayenneModeler'
  app 'CayenneModeler.app', :target => "#{appdir}/CayenneModeler/CayenneModeler.app"
end
