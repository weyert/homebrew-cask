cask 'microsoft-edge-canary' do
    version '76.0.174.0'
    sha256 'dabc8bcca2a1b5078b0a3093eba6a18a3792e4237495f2aad99065c3b749831e'
  
    url "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/MicrosoftEdgeCanary-#{version}.pkg?Consent=1"
    name 'Microsoft Edge'
    homepage 'https://www.google.com/chrome/'
  
    auto_updates true
    depends_on macos: '>= :sierra'
  
    pkg "MicrosoftEdgeCanary-#{version}.pkg"

    uninstall launchctl: [
                           'com.microsoft.Edge.Canary',
    ]
  
    zap trash: [
                 '~/Library/Application Support/Microsoft Edge Canary',
                 '~/Library/Preferences/com.microsoft.Edge.Canary.plist',
                 '~/Library/Saved Application State/com.microsoft.Edge.Canary.savedState'
               ],
        rmdir: [
                 '~/Library/Application Support/Microsoft Edge Canary'
        ]
  end
