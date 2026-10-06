cask "agent-reaper" do
  version "0.2.0"
  sha256 "6c7084edd98a31f7320b06cc5b901297fd5bb29e82939635b3b2a78e32db10bd"

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
