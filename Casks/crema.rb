cask "crema" do
  version "1.0.0"
  sha256 "52a26e21b7b00c55e5174972709f44db832edfd2e85887612e568451e6c4d1f4"

  url "https://github.com/theitger/crema/releases/download/v#{version}/Crema-#{version}.zip"
  name "Crema"
  desc "Keeps the computer awake from the menu bar, one shot at a time"
  homepage "https://github.com/theitger/crema"

  depends_on macos: :ventura

  app "Crema.app"

  # Ad-hoc signed (no Apple Developer certificate): without this Gatekeeper
  # blocks the first launch. The download is pinned by sha256 above.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Crema.app"]
  end

  zap trash: "~/Library/Preferences/com.theitger.crema.plist"
end
