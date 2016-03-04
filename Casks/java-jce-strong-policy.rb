cask 'java-jce-strong-policy' do
  version :latest
  sha256 :no_check

  url 'https://edelivery.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip',
      :cookies => {
                    'oraclelicense' => 'accept-securebackup-cookie'
                  }
  name 'Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy'
  homepage 'https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html'
  license :gratis

  preflight do
    unless File.exist?('/Library/Java/Home/jre/lib/security/local_policy.jar.backed_up')
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '/Library/Java/Home/jre/lib/security/local_policy.jar', '/Library/Java/Home/jre/lib/security/local_policy.jar.backed_up'
    end
    unless File.exist?('/Library/Java/Home/jre/lib/security/US_export_policy.jar.backed_up')
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '/Library/Java/Home/jre/lib/security/US_export_policy.jar', '/Library/Java/Home/jre/lib/security/US_export_policy.jar.backed_up'
    end
    unless File.exist?('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar.backed_up')
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar.backed_up'
    end
    unless File.exist?('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar.backed_up')
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar.backed_up'
    end
  end

  stage_only true
  
  postflight do
    system '/usr/bin/sudo', '-E', '--',
      '/bin/ln', '-sf', "#{staged_path}/UnlimitedJCEPolicyJDK8/local_policy.jar", '/Library/Java/Home/jre/lib/security/local_policy.jar'
    system '/usr/bin/sudo', '-E', '--',
        '/bin/ln', '-sf', "#{staged_path}/UnlimitedJCEPolicyJDK8/US_export_policy.jar", '/Library/Java/Home/jre/lib/security/US_export_policy.jar'
    system '/usr/bin/sudo', '-E', '--',
      '/bin/ln', '-sf', "#{staged_path}/UnlimitedJCEPolicyJDK8/local_policy.jar", '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar'
    system '/usr/bin/sudo', '-E', '--',
        '/bin/ln', '-sf', "#{staged_path}/UnlimitedJCEPolicyJDK8/US_export_policy.jar", '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chown', '--', 'root:wheel', '/Library/Java/Home/jre/lib/security/local_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chown', '--', 'root:wheel', '/Library/Java/Home/jre/lib/security/US_export_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chmod', '--', 'a+r-x,ug+w,o-w', '/Library/Java/Home/jre/lib/security/local_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chmod', '--', 'a+r-x,ug+w,o-w', '/Library/Java/Home/jre/lib/security/US_export_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chmod', '--', 'a+r-x,ug+w,o-w', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar'
    system '/usr/bin/sudo', '-E', '--', 
      'chmod', '--', 'a+r-x,ug+w,o-w', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar'
  end
  
  uninstall :delete => [
      '/Library/Java/Home/jre/lib/security/local_policy.jar',
      '/Library/Java/Home/jre/lib/security/US_export_policy.jar',
      '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar',
      '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar'
    ]
  
  uninstall_postflight do
    if Pathname('/Library/Java/Home/jre/lib/security/local_policy.jar.backed_up').exist?
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '-f', '/Library/Java/Home/jre/lib/security/local_policy.jar.backed_up', '/Library/Java/Home/jre/lib/security/local_policy.jar'
    end
    if Pathname('/Library/Java/Home/jre/lib/security/US_export_policy.jar.backed_up').exist?
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '-f', '/Library/Java/Home/jre/lib/security/US_export_policy.jar.backed_up', '/Library/Java/Home/jre/lib/security/US_export_policy.jar'
    end
    if Pathname('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar.backed_up').exist?
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '-f', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar.backed_up', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/local_policy.jar'
    end
    if Pathname('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar.backed_up').exist?
      system '/usr/bin/sudo', '-E', '--',
        '/bin/mv', '-f', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar.backed_up', '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/lib/security/US_export_policy.jar'
    end
  end
end