cask 'evernote' do
    if MacOS.version <= :snow_leopard
        version '5.5.2'
        sha256 '06b6da6d74ccab08deabfdd4c9519b9bc7f7ef0f0db2a0e8b0cd72e781f2e0ed'
        url 'https://cdn1.evernote.com/mac/release/Evernote_402634.dmg'
    else
        version '6.9_453991'
        sha256 '88384d50b928b925d8e5c0d945bb7d03fe5d0e1dbcce9fcdb8e21e7775cdfb5b'
        url "https://cdn1.evernote.com/mac-smd/public/Evernote_RELEASE_#{version}.dmg"
        appcast 'https://update.evernote.com/public/ENMac/EvernoteMacUpdate.xml',
        checkpoint: '07d6d2bcbf997b4fac475d03adceca330d4144152afb15103a0251bc17e89f33'
    end
    
    name 'Evernote'
    homepage 'https://evernote.com/'
    license :gratis
    
    auto_updates true
    
    app 'Evernote.app'
end