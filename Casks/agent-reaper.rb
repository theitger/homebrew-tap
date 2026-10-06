cask "agent-reaper" do
  version "0.2.2"
  sha256 "fed899a818571dbe0d3be63bff044816e39070f8f5eab2dd4a31b79aa6fad7c2"

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
