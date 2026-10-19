cask "muxy" do
  version "0.5.0"
  sha256 "51e791b5c2aff3bcd343c90473495ab73ebb61ad51174bf915053ebdf4268b56"

  url "https://github.com/theitger/muxy/releases/download/v#{version}/Muxy-#{version}.zip"
  name "Muxy"
  desc "Terminal workspace for parallel coding agents with native Ghostty rendering"
  homepage "https://github.com/theitger/muxy"

  depends_on macos: :sonoma

  app "Muxy.app"

  # Ad-hoc signed (no Apple Developer certificate): without this Gatekeeper
  # blocks the first launch. The download is pinned by sha256 above.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Muxy.app"]
  end
end
