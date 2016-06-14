cask 'devonthink-personal' do
  version '2.8.11'
  sha256 'fdeff11304cf56615966b956b6fe2456cf8a0cfc65c95128316be4ba3b611e03'

  # amazonaws.com/DTWebsiteSupport was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/DTWebsiteSupport/download/devonthink/#{version}/DEVONthink_Personal.dmg.zip"
  appcast 'http://www.devon-technologies.com/fileadmin/templates/filemaker/sparkle.php?product=217255&format=xml',
          checkpoint: 'ade5aaf7e441870c260eceade05119d566d81a87776001aaf98416f47f4c6f54'
  name 'DEVONthink Personal'
  homepage 'http://www.devontechnologies.com/products/devonthink/devonthink-personal.html'
  license :commercial

  depends_on macos: '>= :mountain_lion'
  container nested: 'DEVONthink_Personal.dmg'

  app 'DEVONthink.app'
end
