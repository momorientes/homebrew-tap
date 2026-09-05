cask "activitysnitch" do
  version "1.0.0"
  sha256 "ea505aa9064c2d85193a2af901b960d14c7ab2a09af2202c5ff8a6bc285d516f"

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
