cask 'cheatsheet' do
  version '1.2.6'
  sha256 'cb4008869ea0dcb569a7c310c73a0bfe2192a7eb566f41b13c771a22adaea78c'

  # mediaatelier.com/CheatSheet was verified as official when first introduced to the cask
  url "https://mediaatelier.com/CheatSheet/CheatSheet_#{version}.zip"
  appcast 'https://mediaatelier.com/CheatSheet/feed.php',
          checkpoint: '76bebd775e105d108f5f786017fe6c4f6e4fa7b5a73314304adb138b42508374'
  name 'CheatSheet'
  homepage 'https://www.cheatsheetapp.com/CheatSheet/'
  license :gratis

  app 'CheatSheet.app'

  postflight do
    suppress_move_to_applications
  end
end
