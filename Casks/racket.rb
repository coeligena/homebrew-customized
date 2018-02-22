cask 'racket' do
  version '6.12'
  sha256 '54fbee6a967209c62c814f60ba00ca105f01c69a8f1a9f4bfa21525698398a31'

  url "https://mirror.racket-lang.org/installers/#{version}/racket-#{version}-x86_64-macosx.dmg"
  appcast 'https://download.racket-lang.org/all-versions.html',
          checkpoint: '087ee282ac3b03af2070a6812e52188d578f4f1cbd7fb0d5e1e29d8aed5871c9'
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
