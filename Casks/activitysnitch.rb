cask "activitysnitch" do
  version "1.0.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/momorientes/activitysnitch/releases/download/v#{version}/ActivitySnitch-#{version}.zip"
  name "ActivitySnitch"
  desc "Menubar watchdog that flags and quits processes with sustained high Energy Impact"
  homepage "https://github.com/momorientes/activitysnitch"

  depends_on macos: ">= :sonoma"

  app "ActivitySnitch.app"

  uninstall quit: "network.noscito.ActivitySnitch"

  zap trash: [
    "~/Library/Preferences/network.noscito.ActivitySnitch.plist",
  ]
end
