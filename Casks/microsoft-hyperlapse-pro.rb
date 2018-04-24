cask 'microsoft-hyperlapse-pro' do
  version '1.5.5821.19350'
  sha256 'e274f133653590c3902c8ad7b8ff1d5570c7f07728e59a5d1730135da7d503f4'

  url "http://ftp.research.microsoft.com/downloads/9f3d92d8-583c-415d-a3cb-c238b80a1ef9/Microsoft%20Hyperlapse%20Pro-#{version}.pkg.zip"
  name 'Microsoft Hyperlapse Pro Mac'
  homepage 'https://research.microsoft.com/en-us/um/redmond/projects/hyperlapseapps/'
  

  pkg "Microsoft Hyperlapse Pro-#{version}.pkg"
  
  uninstall pkgutil: 'com.microsoft.Hyperlapse.Mac'
end
