cask 'racket' do
  version '6.9'
  sha256 '03e093aa5f4100c021087749ff56900dc9adfc8067f18a51065f436f58a3bd50'

  # cs.utah.edu/plt/installers was verified as official when first introduced to the cask
  url "https://www.cs.utah.edu/plt/installers/#{version}/racket-#{version}-x86_64-macosx.dmg"
  appcast 'https://download.racket-lang.org/all-versions.html',
          checkpoint: 'fa3b5479dc4027a247f4d97304a7c25e717c8ce36121d5a8222c807b60bdfa80'
  name 'Racket'
  homepage 'https://racket-lang.org/'

  suite "Racket v#{version}", :target => 'Racket'
  
  binary "#{appdir}/Racket/bin/drracket"
  binary "#{appdir}/Racket/bin/gracket"
  binary "#{appdir}/Racket/bin/gracket-text"
  binary "#{appdir}/Racket/bin/mred"
  binary "#{appdir}/Racket/bin/mred-text"
  binary "#{appdir}/Racket/bin/mzc"
  binary "#{appdir}/Racket/bin/mzpp"
  binary "#{appdir}/Racket/bin/mzscheme"
  binary "#{appdir}/Racket/bin/mztext"
  binary "#{appdir}/Racket/bin/pdf-slatex"
  binary "#{appdir}/Racket/bin/plt-games"
  binary "#{appdir}/Racket/bin/plt-help"
  binary "#{appdir}/Racket/bin/plt-r5rs"
  binary "#{appdir}/Racket/bin/plt-r6rs"
  binary "#{appdir}/Racket/bin/plt-web-server"
  binary "#{appdir}/Racket/bin/racket"
  binary "#{appdir}/Racket/bin/raco"
  binary "#{appdir}/Racket/bin/scribble"
  binary "#{appdir}/Racket/bin/setup-plt"
  binary "#{appdir}/Racket/bin/slatex"
  binary "#{appdir}/Racket/bin/slideshow"
  binary "#{appdir}/Racket/bin/swindle"
end
