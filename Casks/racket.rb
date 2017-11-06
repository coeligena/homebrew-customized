cask 'racket' do
  version '6.11'
  sha256 'b6196c80a7dc5c2e73c0bcb99d441e337f5e7337aa308352049e078a03d9d6ee'

  url "https://mirror.racket-lang.org/installers/#{version}/racket-#{version}-x86_64-macosx.dmg"
  appcast 'https://download.racket-lang.org/all-versions.html',
          checkpoint: '3c12b566b1367a36229138d66eb87295f8b6c36198989b667f43b2b0ece89d22'
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
