cask "agent-reaper" do
  version "0.1.0"
  sha256 "56e523a9eb76d3611049028b816c481757fc4d6ca1458290481597a9fbe841af"

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
