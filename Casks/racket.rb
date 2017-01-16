cask 'racket' do
  version '6.7'
  sha256 'abd6d9da0b09c3dc9d06e5a48ebb5e567f57ffa1584f4f262f9e6ecca9d8108a'

  # cs.utah.edu/plt/installers was verified as official when first introduced to the cask
  url "https://www.cs.utah.edu/plt/installers/#{version}/racket-#{version}-x86_64-macosx.dmg"
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

  caveats <<-EOS.undent
    MacBook Pro with Touch Bar users:
    To avoid a bug in this version that prevents programs from working with the Touch Bar, use the 32-bit version or try a snapshot build:
      https://pre.racket-lang.org/installers/

    More information on the download page:
      https://download.racket-lang.org/
  EOS
end
