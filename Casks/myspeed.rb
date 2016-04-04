require 'Ox'

cask 'myspeed' do
  #    version '1153' # 1.43
  #    sha256 '22a77eaf5fec64e3055bc68f5287b9d2d94a0c34abc83e5948d0ff591c8cf7f5'
  version '6322' # 6 Beta
  sha256 '2e993b484b2f80c96e2a31127a39b95eaa3d8204d4b18a91eeabce8b37191577'
  
  url "https://www.enounce.com/downloads/#{version}/EnounceMySpeed.dmg"
  homepage 'https://www.enounce.com/myspeed1-mac-download'
  license :commercial

  preflight do
    i = 30
    while not File.exist?(ENV["HOME"]+'/Library/Preferences/com.enounce.MySpeed.plist') && i > 0
      print "> > > Waiting...\n"
      sleep 5
      i-=1
    end
    break unless File.exist?(ENV["HOME"]+'/Library/Preferences/com.enounce.MySpeed.plist')
    sleep 5
    
    system 'plutil', '-convert', 'xml1', ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist'

    xml = Ox.parse(File.open(ENV["HOME"]+'/Library/Preferences/com.enounce.MySpeed.plist.bakp').read)
    arr = xml.locate('plist/dict/*/^Text')
    i = 0; lic = ''; licrem = ''; timesav = 0; timetot = 0
    arr.each do |t|
      timesav = arr[i+1] if t == 'UI:TimeSaved'
      timetot = arr[i+1] if t == 'UI:TimeSavedTtl'
      i+=1
    end
    
    xml = Ox.parse(File.open(ENV["HOME"]+'/Library/Preferences/com.enounce.MySpeed.plist').read)
    arr = xml.locate('plist/dict/*/^Text')
    i = 0
    arr.each do |t|
      lic = arr[i+1] if t == 'License5'
      licrem = arr[i+1] if t == 'UI:LicenseRemindTime'
      i+=1
    end
    
    println lic
    println licrem
    println timesav
    println timetot
    
    File.open(ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist', 'w') do |f|
      # use "\n" for two lines of text
      f.puts %Q{<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>FlashAdapter:ProgramsToNotHook</key>
	<array/>
	<key>License5</key>
	<string>#{lic}</string>
	<key>Registration:Email</key>
	<string></string>
	<key>Registration:SerialNumber</key>
	<string></string>
	<key>UI:AlwaysStartAtOneX</key>
	<false/>
	<key>UI:AutoCheckForUpdates</key>
	<true/>
	<key>UI:EnableBrowserPlugin</key>
	<false/>
	<key>UI:HotKeyFaster</key>
	<string>F</string>
	<key>UI:HotKeyNormal</key>
	<string>N</string>
	<key>UI:HotKeyPreferred</key>
	<string>B</string>
	<key>UI:HotKeyShowSlider</key>
	<string>M</string>
	<key>UI:HotKeySlower</key>
	<string>S</string>
	<key>UI:LaunchAtLogin</key>
	<true/>
	<key>UI:LicenseRemindTime</key>
	<integer>#{licrem}</integer>
	<key>UI:PreferredSpeed</key>
	<integer>30</integer>
	<key>UI:ShowSliderWhenActive</key>
	<false/>
	<key>UI:SliderExpanded</key>
	<false/>
	<key>UI:TakeFocusWhenAutoShow</key>
	<false/>
	<key>UI:TimeSaved</key>
	<integer>#{timesav}</integer>
	<key>UI:TimeSavedTtl</key>
	<integer>#{timetot}</integer>
	<key>UI:UseHotKeys</key>
	<true/>
	<key>UI:currentRate</key>
	<integer>30</integer>
	<key>UI:maxRate</key>
	<integer>50</integer>
	<key>UI:minRate</key>
	<integer>3</integer>
	<key>UI:slewRate</key>
	<integer>1</integer>
</dict>
</plist>
}
    end
    system 'plutil', '-convert', 'binary1', ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist'
  end
  
  uninstall_preflight do
    File.open('/tmp/remove-myspeed.sh', 'w') do |f|
      # use "\n" for two lines of text
      f.puts %Q{#!/bin/bash
# program to use apple script as part of install
# to close all browsers and MySpeed
#
# Also removes the older verison of diagnostics, if it is there
# and moves MySpeed out of the trash if it happens to be there
#

thisProgramName="removeMySpeed.tool"

# routine to check for failure, print a message and exit
checkForFailure()
{
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo "Error...syntax: checkForFailure <last Error code> <error message>"
		exit 0
	else
		if [ $1 != "0" ]; then
			echo $2
			echo "$thisProgramName failed.."
			exit -1
		fi
	fi
}

# function runs all the applscript
#
runAppleScript()
{
    # we put all the applescript into a long
    # string and then just pipe that to osascript
    #
    osaCommand=`cat <<EOF
        set scriptResult to "pass"
        on ApplicationIsRunning(appName)
            tell application "System Events" to set appNameIsRunning to exists (processes where name is appName)
            return appNameIsRunning
        end ApplicationIsRunning

        on QuitApplication(appName, appleScriptName)
            if ApplicationIsRunning(appName) then
                try
                    tell application appleScriptName
                        with timeout of 5 seconds
                            quit 
                        end timeout
                    end tell
                end try
            end if
        end QuitApplication
        
        on ForceQuitApplication(appName)
            tell application "System Events"
               set theID to (unix id of processes whose name is appName)
               try
                   -- Should stop the application with no dialogs and no items saved.
                   do shell script "kill -9 " & theID
               end try
            end tell        
        end ForceQuitApplication
        
        on CheckForMySpeedApps()
            set runningApps to {}
            set appsToCheckList to {"MySpeed", "MySpeedInjector", "MySpeedDiagnostics" }
                                    
            repeat with theCurrentApp in appsToCheckList
                if (ApplicationIsRunning(theCurrentApp)) then
                    set runningApps to runningApps & theCurrentApp
                end if
            end repeat
                        
            return runningApps        
        end CheckForMySpeedApps

        on CheckForMySpeedEnabledApps()
            set runningApps to {}
            set appsToCheckList to {"MySpeed", "MySpeedInjector", "MySpeedDiagnostics", "Safari", "firefox-bin", "firefox", ¬
                                    "Google Chrome", "Opera", "flock-bin", "Camino", "RockMelt", "Google Chrome Canary", ¬
                                    "RealPlayer", "mdm_flash_player" }
                                    
            repeat with theCurrentApp in appsToCheckList
                if (ApplicationIsRunning(theCurrentApp)) then
                    set runningApps to runningApps & theCurrentApp
                end if
            end repeat
                        
            return runningApps
        end CheckForMySpeedEnabledApps
        
        on QuitAllMySpeedEnabledApps()
            QuitApplication("MySpeedInjector", "MySpeedInjector")
            QuitApplication("MySpeed", "MySpeed")
            QuitApplication("MySpeedDiagnostics", "MySpeedDiagnostics")
            QuitApplication("Safari","Safari")
            QuitApplication("firefox-bin", "firefox")
            QuitApplication("firefox", "firefox")
            QuitApplication("Google Chrome", "Google Chrome")
            QuitApplication("Opera", "Opera")
            QuitApplication("flock-bin", "flock")
            QuitApplication("Camino", "Camino")
            QuitApplication("RockMelt", "RockMelt")
            QuitApplication("Google Chrome Canary", "Google Chrome Canary")
            QuitApplication("RealPlayer", "RealPlayer")
            QuitApplication("mdm_flash_player", "Wimpy FLV Player")        
        end QuitAllMySpeedEnabledApps

        set os_version to do shell script "sw_vers -productVersion"	
        set dialogApp to "Finder"

        set currentlyRunningApps to CheckForMySpeedEnabledApps()
        if (length of currentlyRunningApps > 0) then
            tell application dialogApp
                activate
                set AppleScript's text item delimiters to {"\n"}
                set msg to "In order to continue, MySpeed Removal Tool needs to close the following applications:\n" & currentlyRunningApps
                try
                    display dialog msg default button 1 buttons {"Continue", "Cancel"} with title "MySpeed Removal Tool"
                    on error number -128
                        set scriptResult to "fail" 
                end try
            end tell           
        end if	
    
        if (scriptResult is "pass") then
            set quitLoopDone to false
            repeat until quitLoopDone
                QuitAllMySpeedEnabledApps()
                delay 1
                
                -- if any MySpeed apps are still running, then they failed to properly shutdown
                -- force quit those
                set mySpeedRunningApps to CheckForMySpeedApps()
                if (length of mySpeedRunningApps > 0) then
                    repeat with theMySpeedApp in mySpeedRunningApps
                        if (ApplicationIsRunning(theMySpeedApp))
                            ForceQuitApplication(theMySpeedApp)
                        end if
                    end repeat                
                end if
                
                set currentlyRunningApps to CheckForMySpeedEnabledApps()
                if (length of currentlyRunningApps > 0) then
                    tell application dialogApp
                        activate
                        set AppleScript's text item delimiters to {"\n"}
                        set runningAppsString to currentlyRunningApps as string
                        set msg to "The following applications still need to be closed:\n" & currentlyRunningApps & "\n...try again to close them?"
                        try
                            display dialog msg default button 1 buttons {"Try again", "Cancel"} with title "MySpeed Removal Tool"
                            on error number -128
                                set scriptResult to "fail"
                                set quitLoopDone to true
                        end try
                    end tell
                else
                    set quitLoopDone to true                
                end if
            end repeat

            delay 1

            if (scriptResult is "fail") then
                tell application dialogApp
                    activate
                    set msg to "MySpeed or a MySpeed enabled application (browsers) are still running..removal cannot continue. A reboot may be required before removal can continue."
                    set dialogresult to display dialog msg default button 1 buttons {"Cancel Install" } with title "MySpeed Removal Tool"
                    set scriptResult to "fail"              
                end tell
    
            end if
        end if
        
        tell application "Terminal" to activate
        
        return scriptResult       
EOF
`
    appleScriptResult=`echo "$osaCommand" | osascript`
    echo "$appleScriptResult"
}

# first run the applescript to close everything
result=$(runAppleScript)
if [ $result != "pass" ] 
then
    echo "Failed to close all MySpeed Enabled applications...exiting"
    exit 0
fi

# get sudo password
# clear out the old sudo password
sudo -k
read -s -p "Enter password to remove all MySpeed components: " sudoPassword
echo ""
checkForFailure $? "Failed to get needed password...cannot continue"
# test the password
echo "testing password"
echo $sudoPassword | sudo -S pwd
checkForFailure $? "sudo passord incorrect..."

# For old installs, need to remove user local copies of some files
# Enounce, Inc, copyright (c) 2010. All rights reserved.
#
# remove the Enounce AUTimePitch Audio Unit
if [ -e /Library/Audio/Plug-Ins/Components/AUTimePitch.component ] 
then 
    echo "Removing AUTimePitch"
    echo $sudoPassword | sudo -S rm -rf /Library/Audio/Plug-Ins/Components/AUTimePitch.component 
fi

# Remove the NPAPI MySpeed Plugin, if it exists
if [ -e "/Library/Internet Plug-Ins/NPMySpeedPlugin.plugin" ] 
then 
    echo "Removing NPMySpeedPlugin"
    echo $sudoPassword | sudo -S rm -rf "/Library/Internet Plug-Ins/NPMySpeedPlugin.plugin" 
fi

# Remove the MySpeed Scripting Addition, if it exists
if [ -e /Library/ScriptingAdditions/MySpeed.osax ] 
then 
    echo "Removing MySpeed.osax"
    echo $sudoPassword | sudo -S rm -rf /Library/ScriptingAdditions/MySpeed.osax 
fi

# Remove MySpeed, if it exists
if [ -e /Applications/MySpeed.app ] 
then 
    echo "Removing MySpeed"
    echo $sudoPassword | sudo -S rm -rf /Applications/MySpeed.app
fi

# Remove MySpeed temp files dir, if it exists
if [ -e ~/.enounce2 ] 
then 
    echo "Removing MySpeed temporary files directory"
    echo $sudoPassword | sudo -S rm -rf ~/.enounce2
fi

# Restore Safari Sandbox, if necessary
backupExtension="Original"
pathToSafariPrivateSandbox="/System/Library/PrivateFrameworks/WebKit2.framework/WebProcess.app/Contents/Resources/com.apple.WebProcess.sb"
pathToSafariPrivateSandboxBackup=$pathToSafariPrivateSandbox.$backupExtension
pathToSafariStagedSandbox="/System/Library/StagedFrameworks/Safari/WebKit2.framework/WebProcess.app/Contents/Resources/com.apple.WebProcess.sb"
pathToSafariStagedSandboxBackup=$pathToSafariStagedSandbox.$backupExtension

# Safari 6.1
pathToSafari61FlashSandbox="/System/Library/StagedFrameworks/Safari/WebKit2.framework/Resources/PlugInSandboxProfiles/com.macromedia.Flash Player.plugin.sb"
pathToSafari61FlashSandboxBackup=$pathToSafari61FlashSandbox.$backupExtension
pathToSafari61WebProcessSandbox="/System/Library/StagedFrameworks/Safari/WebKit2.framework/Resources/com.apple.WebProcess.sb"
pathToSafari61WebProcessSandboxBackup=$pathToSafari61WebProcessSandbox.$backupExtension

# Safari 7.0 (Mavericks)
pathToSafari70WebProcessSandbox="/System/Library/PrivateFrameworks/WebKit2.framework/Resources/com.apple.WebProcess.sb"
pathToSafari70WebProcessSandboxBackup=$pathToSafari70WebProcessSandbox.$backupExtension
pathToSafari70FlashSandbox="/System/Library/PrivateFrameworks/WebKit2.framework/Resources/PlugInSandboxProfiles/com.macromedia.Flash Player.plugin.sb"
pathToSafari70FlashSandboxBackup=$pathToSafari70FlashSandbox.$backupExtension

# Safari 7.1 Beta
pathToSafari71WebProcessSandbox="/System/Library/StagedFrameworks/Safari/WebKit.framework/Versions/A/Resources/com.apple.WebProcess.sb"
pathToSafari71WebProcessSandboxBackup=$pathToSafari71WebProcessSandbox.$backupExtension
pathToSafari71FlashSandbox="/System/Library/StagedFrameworks/Safari/WebKit.framework/Versions/A/Resources/PlugInSandboxProfiles/com.macromedia.Flash Player.plugin.sb"
pathToSafari71FlashSandboxBackup=$pathToSafari71FlashSandbox.$backupExtension

# Safari 8.0 (Yosemite)
pathToSafari80WebProcessSandbox="/System/Library/Frameworks/WebKit.framework/Resources/com.apple.WebProcess.sb"
pathToSafari80WebProcessSandboxBackup=$pathToSafari80WebProcessSandbox.$backupExtension
pathToSafari80FlashSandbox="/System/Library/Frameworks/WebKit.framework/Resources/PlugInSandboxProfiles/com.macromedia.Flash Player.plugin.sb"
pathToSafari80FlashSandboxBackup=$pathToSafari80FlashSandbox.$backupExtension

# our sandbox file
pathToMySpeedSandbox=/Library/Sandbox/Profiles/com.enounce.MySpeed.sb

if [ -e "$pathToSafariPrivateSandboxBackup" ]
then
    echo "Restoring Private Safari Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafariPrivateSandboxBackup" "$pathToSafariPrivateSandbox"
fi

if [ -e "$pathToSafariStagedSandboxBackup" ]
then
    echo "Restoring Staged Safari Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafariStagedSandboxBackup" "$pathToSafariStagedSandbox"
fi

if [ -e "$pathToSafari61FlashSandboxBackup" ]
then
    echo "Restoring Safari 6.1 Flash Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari61FlashSandboxBackup" "$pathToSafari61FlashSandbox"
fi

if [ -e "$pathToSafari61WebProcessSandboxBackup" ]
then
    echo "Restoring Safari 6.1 WebProcess Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari61WebProcessSandboxBackup" "$pathToSafari61WebProcessSandbox"
fi

if [ -e "$pathToSafari70FlashSandboxBackup" ]
then
    echo "Restoring Safari 7.0 Flash Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari70FlashSandboxBackup" "$pathToSafari70FlashSandbox"
fi

if [ -e "$pathToSafari70WebProcessSandboxBackup" ]
then
    echo "Restoring Safari 7.0 WebProcess Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari70WebProcessSandboxBackup" "$pathToSafari70WebProcessSandbox"
fi

if [ -e "$pathToSafari71FlashSandboxBackup" ]
then
    echo "Restoring Safari 7.1 Flash Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari71FlashSandboxBackup" "$pathToSafari71FlashSandbox"
fi

if [ -e "$pathToSafari71WebProcessSandboxBackup" ]
then
    echo "Restoring Safari 7.1 WebProcess Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari71WebProcessSandboxBackup" "$pathToSafari71WebProcessSandbox"
fi

if [ -e "$pathToSafari80FlashSandboxBackup" ]
then
    echo "Restoring Safari 8.0 Flash Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari80FlashSandboxBackup" "$pathToSafari80FlashSandbox"
fi

if [ -e "$pathToSafari80WebProcessSandboxBackup" ]
then
    echo "Restoring Safari 8.0 WebProcess Sandox"
    echo $sudoPassword | sudo -S mv -f "$pathToSafari80WebProcessSandboxBackup" "$pathToSafari80WebProcessSandbox"
fi


# Remove MySpeed sandbox, if it exists
if [ -e "$pathToMySpeedSandbox" ]
then
    echo "Removing MySpeed Sandbox"
    echo $sudoPassword | sudo -S rm -rf "$pathToMySpeedSandbox"
fi

echo "MySpeed has been removed....thank you for trying MySpeed!"
}
    end
  end
  
  pkg "MySpeed for Mac.pkg"
  
  uninstall_preflight do
    system 'mv', '-f', ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist', ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist.bakp'
    system 'plutil', '-convert', 'xml1', ENV['HOME'] + '/Library/Preferences/com.enounce.MySpeed.plist.bakp'
  end

  uninstall :quit    => [
              'com.enounce.MySpeed',
              'com.enounce.MySpeedInjector'
            ],
            :pkgutil => 'com.enounce.MySpeed*',
            :delete  => [
              '/Applications/MySpeed.app',
              '/Library/Internet Plug-Ins/NPMySpeedPlugin.plugin',
              '/Library/ScriptingAdditions/MySpeed.osax'
            ]
  zap :delete => [
          '~/Library/Application Support/Enounce',
          '~/Library/Caches/com.enounce.MySpeed',
          '~/Library/Preferences/com.enounce.MySpeed.plist'
      ],
      :rmdir   => [
          '~/Library/Application Support/Enounce'
      ]
  
  uninstall_postflight do
    system '/bin/bash', '/tmp/remove-myspeed.sh'
    local_files = Pathname.glob(Pathname.new("~/.en*").expand_path)
    local_files.each do |file|
      system '/bin/rm', '-rf', file
    end
  end
end