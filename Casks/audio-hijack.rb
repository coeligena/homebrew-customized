cask 'audio-hijack' do
  version '3.3.0'
  sha256 '36eab1e7999b5f8eea338e33db453f29e5880371a3f1c808aa2f939d6e4af200'

  url 'https://rogueamoeba.com/audiohijack/download/AudioHijack.zip'
  appcast 'https://www.rogueamoeba.net/ping/versionCheck.cgi?format=sparkle&bundleid=com.rogueamoeba.audiohijack3',
          checkpoint: '0fbaba7942a36504e2e27180648f83864ce020532a49f76673d3ca6a1dbd2a01'
  name 'Audio Hijack'
  homepage 'https://www.rogueamoeba.com/audiohijack/'
  license :commercial

  depends_on macos: '>= :mavericks'

  app 'Audio Hijack.app'
end
