cask "agent-reaper" do
  version "0.2.1"
  sha256 "0fcb781f859f6961b418f2c292f3a85e4e30b096a1a788f70a253ed4b393d1c1"

  url "https://github.com/theitger/agent-reaper/releases/download/v#{version}/Reaper-#{version}.zip"
  name "Reaper"
  desc "Menu bar app that frees the memory coding agents leave behind"
  homepage "https://github.com/theitger/agent-reaper"

  depends_on macos: :sonoma

  app "Reaper.app"

  # Ad-hoc signed (no Apple Developer certificate): without this Gatekeeper
  # blocks the first launch. The download is pinned by sha256 above.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Reaper.app"]
  end
end
