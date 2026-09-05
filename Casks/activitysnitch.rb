cask "activitysnitch" do
  version "1.0.1"
  sha256 "9edab81df69c17684499400f9ad401dbf17c0355eb180c23ef545c13b7a2fa17"

  url "https://github.com/momorientes/activitysnitch/releases/download/v#{version}/ActivitySnitch-#{version}.zip"
  name "ActivitySnitch"
  desc "Menubar watchdog that flags and quits processes with sustained high Energy Impact"
  homepage "https://github.com/momorientes/activitysnitch"

  depends_on macos: :sonoma

  app "ActivitySnitch.app"

  # The app is ad-hoc signed, not notarized, so Gatekeeper would block the
  # quarantined copy. Fine for a personal tap; the proper fix is notarization.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ActivitySnitch.app"]
  end

  uninstall quit: "network.noscito.ActivitySnitch"

  zap trash: [
    "~/Library/Preferences/network.noscito.ActivitySnitch.plist",
  ]
end
