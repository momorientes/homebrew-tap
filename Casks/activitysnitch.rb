cask "activitysnitch" do
  version "1.0.2"
  sha256 "e39a6407903878f94e61222b583fff2d50490d40e70764c05c6e8ada3e752fb4"

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
