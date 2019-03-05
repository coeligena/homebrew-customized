cask 'soapui' do
  version '5.4.0'
  sha256 '9528936b416f8b4925c65d72a486108f8bf251cf102ebdcef5146a61a83ca9b5'

  # s3.amazonaws.com/downloads.eviware/soapuios was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/downloads.eviware/soapuios/#{version}/SoapUI-#{version}.dmg"
  name 'SmartBear SoapUI'
  homepage 'https://www.soapui.org/'

  # Installer runs install4j from the distribution in quiet mode.
  #
  # Because the defaults in the installation also launch the HermesJMS
  # installer, we also have to provide overrides for those defaults.
  #
  # The defaults below chose the options to:
  #   accept the # license agreement
  #   install only SoapUI (not HermesJMS, the # tutorials, or source)
  #   install to /Applications
  #   don't create a desktop icon
  #   don't view the release notes
  #   don't launch SoapUI after installing.
  #
  # For future Cask maintainers, if any of these variables change in future
  # versions from SmartBear, you can run the installer manually and then
  # check the values in the following file generated by the installation:
  #   /Applications/SoapUI-${version}.app/Contents/java/app/.install4j/response.varfile
  #
  # And refer to the install4j command line options for additional information
  #   https://resources.ej-technologies.com/install4j/help/doc/index.html
  #
  installer script: {
                      executable: "SoapUI #{version} Installer.app/Contents/MacOS/JavaApplicationStub",
                      args:       [
                                    '-q',
                                    '-Vsys.adminRights$Boolean=true',
                                    '-Vsys.programGroupDisabled$Boolean=true',
                                    '-VcreateDesktopLinkAction$Boolean=false',
                                    '-Vsys.component.2393$Boolean=false',
                                    '-Vsys.component.132$Boolean=true',
                                    '-Vsys.component.1263$Boolean=false',
                                    '-Vsys.languageId=en',
                                    '-VshowFileAction$Boolean=false',
                                    '-Vsys.installationDir=/Applications',
                                    '-VexecutionLauncherAction$Boolean=false',
                                    '-Vsys.component.714$Boolean=true',
                                  ],
                    }

  uninstall delete: "/Applications/SoapUI-#{version}.app"

  zap trash: [
               '~/.soapuios',
               '~/default-soapui-workspace.xml',
               '~/soapui-settings.xml',
             ]
end
