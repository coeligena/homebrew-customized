cask 'netbeans' do
  version '8.1'
  sha256 'adc3963891a62e7d716d4b2ee195bc57f7e42150dabfe684d0a8eedfc9b6c99a'

  url "http://download.netbeans.org/netbeans/#{version}/final/bundles/netbeans-#{version}-macosx.dmg"
  name 'NetBeans IDE'
  homepage 'https://netbeans.org/'
  license :oss
  
  preflight do
      File.open('/tmp/netbeans-choices.xml', 'w') do |f|
          # use "\n" for two lines of text
          f.puts %Q{<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <array>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>baseide</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>javase</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>webcommon</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>extide</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>javaee</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>0</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>javame</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>cpp</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>groovy</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>php</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>ergonomics</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>0</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>glassfish</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>0</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>tomcat</string>
        </dict>
        <dict>
            <key>attributeSetting</key>
            <integer>1</integer>
            <key>choiceAttribute</key>
            <string>selected</string>
            <key>choiceIdentifier</key>
            <string>postinstallscripts</string>
        </dict>
    </array>
</plist>}
      end
  end

  preflight do
    system 'rm', '-Rf', '/Applications/Netbeans.app'
  end

  pkg "NetBeans #{version}.pkg", :apply_choice_changes_xml => '/tmp/netbeans-choices.xml'

  postflight do
    system '/usr/bin/sudo', '-E', '--', 
          'mv', '-f', "/Applications/Netbeans/Netbeans #{version}.app/", '/Applications/Netbeans.app/'
    system 'rmdir', '--', '/Applications/Netbeans/'
  end

  # Theoretically this uninstall could conflict with a separate GlassFish
  # installation.
  #
  # In practice, it appears that the normal GlassFish installation process does
  # not use the OS X installer and so isn't in the pkgutil receipts database.
  #
  # https://glassfish.java.net/docs/4.0/installation-guide.pdf
  #
  # Arguably if the GlassFish installation by NetBeans inside its own target
  # directory were to conflict with a standard GlassFish installation in the
  # receipts database that would be a bug upstream with NetBeans not prefixing
  # its GlassFish package with "org.netbeans."
  #
  # If this ever becomes an issue, :pkgutil => 'glassfish-.*' could be moved
  # to a separate "zap" stanza.
  #
  # The NetBeans installer does some postflight unpacking of paths installed by
  # the OS X installer, so it's insufficient to just delete the paths exposed
  # by pkgutil, hence the additional ":delete" option below.

  uninstall :pkgutil => 'org.netbeans.ide.*|glassfish-.*',
            :delete => '/Applications/NetBeans*'
end